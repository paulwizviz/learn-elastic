# Kibana

Kibana is a user interface that enables you to visualise and analyse elasticsearch and the elastic stack.

## Example Deployment

To help you appreciate the workings of Kibana, you will find a single node cluster with Kibana integrated. You can find the example [here](../deployment/kibana/docker-compose.yml).

To use this example execute the following commands:

* From the root of the project run `./scripts/kibana.sh start`
* When you see the cluster up and running open the browser with this url `http://localhost:5601/app/dev_tools#/console` to access Kibana
* To stop the cluster, run `./scripts/kibana.sh stop`
* To reset the cluster to initial state, run `/scripts/kibana.sh clean`

## Example Dev Tools Use Cases

* [Clusters and nodes](#clusters-and-nodes)
* [Indexing](#indexing)
* [Documents](#documents)

### Clusters and Nodes

1. Health check

```
GET _cluster/health
```

2. Cluster status

```
GET _nodes/stats
```

### Indexing

1. Getting a list of indices

```
GET /_cat/indices
```

2. Creating index

This creates an index name `greetings_messages`

```
PUT greetings_messages
```

3. Indexing a document

Autogenerate document id:
```
POST <Name-of-index>/_doc
{
    "field": "value"
    ...
}
```

This assign custom document id and this will replace document content with the same id:
```
PUT <Name-of-index>/_doc/<your-assigned-id>
{
    "field": "value"
}
```

Tgnore if a document id already exist (returns a 409)
```
PUT <Name-of-index>/_create/<your-assigned-id>
{
    "field": "value"
}
```

### Documents 

1. Retrieve documents
```
GET <Name-of-index>/_doc/<id-of-document>
```

2. Upate document
```
POST <Name-of-index>/_update/<id-of-doc-to-update>
{
    "doc":{
        "field": "value", // field to update
        ....
    }
}
```

3. Delete a document
```
DELETE <Name-of-Index>/_doc/<id-of-doc-to-delete>
```

4. Search by index
```
GET <index>/_search
```

5. Get the exact total number of hits
```
GET <index>/_search
{
  "track_total_hits": true
}
```

6. Query
```
GET <index>/_search
{
    "query":{
        ...
    }
}
```

7. Aggregations
```
GET <index>._search{
    "aggs":{
        "<name of aggregation>":{
            "<specify aggregation type>":{
                "field":"<anme of field>",
                "size": "<state number of items>
            }
        }
    }
}
```