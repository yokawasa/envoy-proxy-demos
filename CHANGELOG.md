# CHANGELOG - envoy-proxy-demos

## v2.0.0 (envoy api v2 based demo apps)

Prominent changes from v1 based demo app are:

- Changed general port for front proxy from 80 to 8000
- Changed docker compose version from 2 to 3.7 (see [Compose file version 3 reference](https://docs.docker.com/compose/compose-file/))
- HTTP Connection Manager API Change: 
  - v1 API: envoy.http_connection_manager in v1 API
  - v2 API: [envoy.filters.network.http_connection_manager](https://www.envoyproxy.io/docs/envoy/latest/api-v2/config/filter/network/http_connection_manager/v2/http_connection_manager.proto)
- Tracking config for both Jaeger and Zipkin
  - endpoint: /api/v1/spans to /api/v2/spans
- Stopped using `envoy.api.v2.route.RouteMatch.regex`, deprecated option

## v1.0.0 (envoy api v1 based demo apps)

Supported & tested envoy versions:

- [v1.12.3](https://www.envoyproxy.io/docs/envoy/latest/version_history/v1.12.3)
- [v1.12.0](https://www.envoyproxy.io/docs/envoy/latest/version_history/v1.12.0)
- [v1.9.0](https://www.envoyproxy.io/docs/envoy/latest/version_history/v1.9.0)
- [v1.8.0](https://www.envoyproxy.io/docs/envoy/latest/version_history/v1.8.0)
- [v1.7.0](https://www.envoyproxy.io/docs/envoy/latest/version_history/v1.7.0)
- [v1.6.0](https://www.envoyproxy.io/docs/envoy/latest/version_history/v1.6.0)

> NOTE: From envoy api [v1.13.0](https://www.envoyproxy.io/docs/envoy/latest/version_history/v1.13.0), v1 envoy api(s) are no longer supported.
