# Operations

This section presents a list of RESTFul operations you can perform on elasticsearch.

## Getting information about clusters and nodes

Syntax:

```
GET _API/parameter
```

Example - Get info about cluster health

```
GET _cluster/health
```

or

```
GET _nodes/stats
```

## Creating Index

Syntax:

```
PUT <Name-of-Index>
```

Example - Create an index name `greetings_messages`

```
PUT greetings_messages
```

## Indexing a document

Syntax:

```
POST <Name-of-index>/_doc
{
    "field": "value"
    ...
}
```

This autogenerate document id

or 

```
PUT <Name-of-index>/_doc/<your-assigned-id>
{
    "field": "value"
}
```
This assign custom document id and this will replace document content with the same id.

or

```
PUT <Name-of-index>/_create/<your-assigned-id>
{
    "field": "value"
}
```

To ignore if a document id already exist (returns a 409)

Example - Greetings in English

```
POST greetings_messages/_doc
{
   "Australian": "G'day",
   "English": "Hello",
   "Texan": "Howdy",
   "Irish": "Top of the morning"
}
```
or

```
PUT greetings_messages/_doc/1
{
   "Australian": "G'day",
   "English": "Hello",
   "Texan": "Howdy",
   "Irish": "Top of the morning"
}
```

Create a document with an id of 1

## Read document

Syntax:

```
GET <Name-of-index>/_doc/<id-of-document>
```

## Upate document

Syntax:

```
POST <Name-of-index>/_update/<id-of-doc-to-update>
{
    "doc":{
        "field": "value", // field to update
        ....
    }
}
```

## Delete a document

Syntax:

```
DELETE <Name-of-Index>/_doc/<id-of-doc-to-delete>
```

## Search by index

Syntax:

```
GET <index>/_search
```

## Get the exact total number of hits

Syntax:

```
GET <index>/_search
{
  "track_total_hits": true
}
```

## Query

Syntax:

```
GET <index>/_search
{
    "query":{
        ...
    }
}
```

## Aggregations

Syntax:

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