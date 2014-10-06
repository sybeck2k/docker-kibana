# kibana

A docker container which sets up a kibana dashboard.

## Environmental Variable

__Things you'll probably change__

- KIBANA_PORT
- ELASTICSEARCH_HOST
- ELASTICSEARCH_PORT

## Ports Exposed

__Defaults__

- 80 (nginx)

## Steps

__build__

```
docker build -t registry.banno-internal.com/kibana .
```

__run__

```
docker run registry.banno-internal.com/kibana
```

__pull__

```
docker pull registry.banno-internal.com/kibana
```

__push__

```
docker push registry.banno-internal.com/kibana
```
