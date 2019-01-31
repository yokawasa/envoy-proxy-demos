from flask import Flask
from flask import request
import socket
import os
import sys
import requests

app = Flask(__name__)

TRACE_HEADERS_TO_PROPAGATE = [
    'X-Ot-Span-Context',
    'X-Request-Id',

    # Zipkin headers
    'X-B3-TraceId',
    'X-B3-SpanId',
    'X-B3-ParentSpanId',
    'X-B3-Sampled',
    'X-B3-Flags',

    # Jaeger header (for native client)
    "uber-trace-id"
]

def render_page():
    return ('<body bgcolor="{}"><span style="color:white;font-size:4em;">\n'
            'Hello from {} (hostname: {} resolvedhostname:{})\n</span></body>\n'.format(
                    os.environ['SERVICE_NAME'],
                    os.environ['SERVICE_NAME'],
                    socket.gethostname(),
                    socket.gethostbyname(socket.gethostname())))

@app.route('/service/<service_color>')
def service(service_color):
    return render_page()

@app.route('/trace/<service_color>')
def trace(service_color):
    headers = {}
    ## For Propagation test ##
    # Call service 'green' from service 'blue'
    if (os.environ['SERVICE_NAME']) == 'blue':
        for header in TRACE_HEADERS_TO_PROPAGATE:
            if header in request.headers:
                headers[header] = request.headers[header]
        ret = requests.get("http://localhost:9000/trace/green", headers=headers)
    # Call service 'red' from service 'green'
    elif (os.environ['SERVICE_NAME']) == 'green':
        for header in TRACE_HEADERS_TO_PROPAGATE:
            if header in request.headers:
                headers[header] = request.headers[header]
        ret = requests.get("http://localhost:9000/trace/red", headers=headers)
    return render_page()

if __name__ == "__main__":
    app.run(host='127.0.0.1', port=8080, debug=True)
