Docker Kibana
=============

A Kibana frontend with an Nginx proxy to Elasticsearch. Uses confd to dynamically update the configuration of Nginx.

By default, confd is configured to use ENV as backend. In this case, you will need just to pass the environment variable
```ELASTICSEARCH_HOST``` (default value: 172.17.42.1)

There is a corrsponding ```ELASTICSEARCH_PORT``` env variable too.

If you want to specify the IP of Elasticsearch do:

```
docker run -d -p 80:80 -e ELASTICSEARCH_HOST=10.0.0.5 --name es-kibana sybeck2k/kibana

```

If you use etcd, you can just run docker with the following ENV variables set: ```ETCD_PORT```, ```ETCD_HOST_IP```, and ```CONFD_BACKEND=etcd``` - confd will then update the configuration of Nginx according to the etcd key ```/elasticsearh/host``` and the port ```/elasticsearh/port```
