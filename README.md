Postcodes.io
============

[Postcodes.io](https://postcodes.io) is a free postcode lookup API and
geocoder for the UK


TL;DR;
------

```
$ helm install https://github.com/Unmortgage/postcodes-io-helm-chart/archive/0.0.2.tar.gz --set datbase.password=foobar
```

Introduction
------------

This chart creates deployments and services for the postcodes.io postgis
database and it's optional RESTful API, on a
[Kubernetes](https://kubernetes.io) cluster using
[Helm](https://helm.sh).

Prerequisites
-------------

* Kubernetes 1.4+

Installing the chart
--------------------

To install the chart with the release name `my-release`:

```
$ helm install --name my-release https://github.com/Unmortgage/postcodes-io-helm-chart/archive/0.0.2.tar.gz --set password=foobar
```

The command deploys the postcode.io database and it's RESTful API on the
Kubernetes cluster in the default configuration. The
[configuration](#configuration) section below
lists the parameters that can be configured during installation.

Uninstalling the Chart
----------------------

To uninstall/delete the my-release deployment:

```
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart
and deletes the release.

To fully remove the service from your cluster you should use the `--purge`
flag:

```
$ helm delete my-release --purge
```

Configuration
-------------

The following table lists the configurable parameters of the postcodes.io
chart and their default values. 

Parameter | Description | Default 
--------- | ----------- | --------
`nameOverride` | Override the name of the chart | `nil`
`database.replicaCount` | How many replicas of the database to run | `1`
`database.image.repository` | postcodes.io image registry | `idealpostcodes/postcodes.io`
`database.image.tag` | postcodes.io image tag | `10.0.1`
`database.image.pullPolicy` | image pull policy | `IfNotPresent`
`database.username` | Postgres user | `"postcodesio"`
`database.password` | Postgres password (set at install time) | `nil`
`database.database` | Postgres database name | `postcodesiodb`
`database.service.type` | Kubernetes service type | `ClusterIP`
`database.service.port` | service port | `5432`
`database.livenessProbe.enabled` | enable the liveness probe | `true`
`database.livenessProbe.initialDelaySeconds` | number of seconds to wait before starting the liveness probe | `150`
`database.livenessProbe.periodSeconds` | interval between probes | `10`
`database.livenessProbe.timeoutSeconds` | number of seconds to wait before timing out | `5`
`database.livenessProbe.failureThreshold` | number of failures before killing the pod | `6`
`database.livenessProbe.successThreshold` | number of successful probes before the pod is live | `1`
`database.readinessProbe.enabled` | enable the readiness probe | `true`
`database.readinessProbe.initialDelaySeconds` | number of seconds to wait before starting the readiness probe | `5`
`database.readinessProbe.periodSeconds` | interval between probes | `10`
`database.readinessProbe.timeoutSeconds` | number of seconds to wait before timing out | `5`
`database.readinessProbe.failureThreshold` | number of failures before killing the pod | `6`
`database.readinessProbe.successThreshold` | number of successful probes for a pod to be ready | `1`
`database.resources` | resource requests and limits | `{}`
`database.nodeSelector` | node selectors | `{}`
`database.tolerations` | tolerations | `[]`
`database.affinity` | affinity | `{}`
`api.enabled` | Enable the RESTful API | `true`
`api.replicaCount` | How many replicas of the API to run | `1`
`api.image.repository` | postcodes.io image registry | `idealpostcodes/postcodes.io`
`api.image.tag` | postcodes.io image tag | `release-10.0.1`
`api.image.pullPolicy` | image pull policy | `IfNotPresent`
`api.service.type` | Kubernetes service type | `ClusterIP`
`api.service.port` | service port | `80`
`api.ingress.enabled` | Enable access to the API from an external source | `false`
`api.ingress.annotations` | Annotations for the ingress | `{}`
`api.ingress.paths` | HTTP URI paths to route to the API service | `[]`
`api.ingress.hosts` | HTTP Hosts to route to the API service | `[]`
`api.ingress.tls` | Ingress TLS configuration [Read more here](FIXME) | `[]`
`api.defaults.nearest.radius.DEFAULT` | default value for the radius parameter on the `/postcodes/:postcode/nearest` endpoint | `100`
`api.defaults.nearest.radius.MAX` | maximum value for the radius parameter on the `/postcodes/:postcode/nearest` endpoint | `2000`
`api.defaults.nearest.limit.DEFAULT` | default value for the limit parameter on the `/postcodes/:postcode/nearest` endpoint | `10`
`api.defaults.nearest.limit.MAX` | maximum value for the limit parameter on the `/postcodes/:postcode/nearest` endpoint | `100`
`api.defaults.search.limit.DEFAULT` | default value for the limit parameter on the `/postcodes/:postcode` endpoint | `10`
`api.defaults.search.limit.MAX` | maximum value for the limit parameter on the `/postcodes/:postcode` endpoint | `100`
`api.defaults.bulkGeocode.geoLocations.MAX` | maximum number of geolocations per request to the `/postcodes` endpoint | `100`
`api.defaults.bulkGeocode.geoLocations.ASYNC_LIMIT` | maximum number of parallel DB queries on the `/postcodes` endpoint | `nil`
`api.defaults.bulkGeocode.geoLocations.TIMEOUT` | maximum interval to run a bulk request on the `/postcodes` endpoint | `30000`
`api.defaults.bulkLookups.postcodes.MAX` | maximum number of postcodes per request to the `/postcodes` endpoint | `100`
`api.defaults.bulkLookups.postcodes.ASYNC_LIMIT` | maximum number of parallel DB queries on the `/postcodes` endpoint | `nil`
`api.defaults.bulkLookups.postcodes.TIMEOUT` | maximum interval to run a bulk request on the `/postcodes` endpoint | `30000`
`api.defaults.nearestOutcodes.radius.DEFAULT` | default value for the radius parameter on the `/outcodes/:outcode/nearest` endpoint | `5000`
`api.defaults.nearestOutcodes.radius.MAX` | maximum value for the radius parameter on the `/outcodes/:outcode/nearest` endpoint | `25000`
`api.defaults.nearestOutcodes.limit.DEFAULT` | default value for the limit parameter on the `/outcodes/:outcode/nearest` endpoint | `10`
`api.defaults.nearestOutcodes.limit.MAX` | maximum value for the limit parameter on the `/outcodes/:outcode/nearest` endpoint | `100`
`api.defaults.placesSearch.limit.DEFAULT` | default value for the limit parameter on the `/places/:code` endpoint | `10`
`api.defaults.placesSearch.limit.MAX` | maximum value for the limit parameter on the `/places/:code` endpoint | `100`
`api.defaults.placesContained.limit.DEFAULT` | default value for the limit parameter on the `/places` endpoint | `10`
`api.defaults.placesContained.limit.MAX` | maximum value for the limit parameter on the `/places` endpoint | `100`
`api.defaults.placesNearest.limit.DEFAULT` | default value for the limit parameter on the `places/:code/nearest` endpoint | `10`
`api.defaults.placesNearest.limit.MAX` | maximum value for the limit parameter on the `places/:code/nearest` endpoint | `100`
`api.defaults.placesNearest.radius.DEFAULT` | default value for the radius parameter on the `/places/:code/nearest` endpoint | `1000`
`api.defaults.placesNearest.radius.MAX` | maximum value for the radius parameter on the `places/:code/nearest` endpoint | `10000`
`api.defaults.filterableAttributes` | list of attributes that can be used to filter results | `["postcode", "quality", "eastings", "northings", "country", "nhs_ha", "longitude", "latitude", "parliamentary_constituency", "european_electoral_region", "primary_care_trust", "region", "lsoa", "msoa", "incode", "outcode", "codes", "admin_district", "parish", "admin_county", "admin_ward", "ccg", "nuts", "ced"]`
`api.resources` | resource requests and limits | `{}`
`api.nodeSelector` | node selectors | `{}`
`api.tolerations` | tolerations | `[]`
`api.affinity` | affinity | `{}`
