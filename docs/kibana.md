# Kibana

Kibana is a user interface that enables you to visualise and analyse elasticsearch and the elastic stack.

## Example Cluster

To help you appreciate the workings of Kibana, you will find a single node cluster with Kibana integrated. You can find the example [here](../deployment/kibana/docker-compose.yml).

To use this example execute the following commands:

* From the root of the project run `./scripts/kibana.sh start`
* When you see the cluster up and running open the browser with this url `http://localhost:5601` to access Kibana
* To stop the cluster, run `./scripts/kibana.sh stop`
* To reset the cluster to initial state, run `/scripts/kibana.sh clean`

