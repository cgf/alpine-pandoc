# fhdo-ti-doc

Dies ist ein Docker Container zum Generieren von Dokumentation, der auf https://github.com/skyzyx/alpine-pandoc basiert.

Die folgenden Tools sind enthalten:
* Texlive mit deutscher Sprachunterstützung
* [Pandoc] to convert all [Markdown] into either generated HTML or [reStructuredText] files.

## TODO
* graphviz
* [PlantUML] incl. Java to convert UML diagrams to SVG images.

## Building the Container

```bash
docker build .
```

