# API

* [Clusters and nodes](#clusters-and-nodes)
* [Indexing](#indexing)
* [CURD](#crud)
* [Search](#search)

[REST APIs Official Documentation](https://www.elastic.co/guide/en/elasticsearch/reference/current/rest-apis.html)

## Clusters and Nodes

1. Health check
```
GET _cluster/health
```

2. Node status
```
GET _nodes/stats
```

[Full list of Cluster API operations](https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster.html)

## Indexing

1. Getting a list of indices
```
GET /_cat/indices
```

2. Creating index
```
PUT <index name>
```
[Full list of index API](https://www.elastic.co/guide/en/elasticsearch/reference/current/indices.html)

## CRUD

* [Create](#create)
* [Read](#read)
* [Update](#upate)
* [Delete](#delete)

[Full list of document API](https://www.elastic.co/guide/en/elasticsearch/reference/current/docs.html)

### Create 

1. Autogenerate document id:
```
POST <Name-of-index>/_doc
{
    "field": "value"
    ...
}
```

2. Assign custom document id and this will replace document content with the same id:
```
PUT <Name-of-index>/_doc/<your-assigned-id>
{
    "field": "value"
}
```

3. Ignore if a document id already exist (returns a 409)
```
PUT <Name-of-index>/_create/<your-assigned-id>
{
    "field": "value"
}
```
 
### Read

```
GET <Name-of-index>/_doc/<id-of-document>
```

### Upate

```
POST <Name-of-index>/_update/<id-of-doc-to-update>
{
    "doc":{
        "field": "value", // field to update
        ....
    }
}
```

### Delete

```
DELETE <Name-of-Index>/_doc/<id-of-doc-to-delete>
```

## Search

1. Search by index
```
GET <index>/_search
```

2. Get the exact total number of hits
```
GET <index>/_search
{
  "track_total_hits": true
}
```

There are two important search concepts:

* Precision = True Positives / True Positives + False Positives i.e. what portion search result is relevant to search
* Recall = True Positive / True Positive + False Negaitves i.e. what portion of search data is returned as search result
* The return of the documents is not determined by ranking or more relevant i.e. highest at the top and lowest at the bottom.
* Each ranking is determined by aa ranking
* Method of scoring:
    * Term Frequencies -- how many times a term occurs in each document
    * Inverse Document Frequencies -- if the search term is found in many document, it is not revelant. It will focus on term frequencies in document with important search terms.

3. Query
```
GET <index>/_search
{
    "query":{
        ...
    }
}
```

4. Aggregations
```
GET <index>/_search{
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