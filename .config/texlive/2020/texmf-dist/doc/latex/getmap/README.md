# README #

The goal of this package is the simplest possible provision of
map images (OpenStreetMap, Google Maps and Google Street View
are supported). In the simplest case, it is is sufficient to
specify an address.. The package loads the map using the
\write18 feature, which you must activate to use this package.
The image will be downloaded by an external Lua script. You
can use this script also from the command line.

License: LPPL

Changes in v1.11:

* Requests to Google Maps' Static Image API are no longer free

added an API key, which allows

2000req/day for Google Maps and
1000req/day for Google Street View

