# Concepts


## Interacting with API

<u>Getting information about clusters and nodes</u>

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

<U>Create</u>

1. Creating an index

Syntax:

```
PUT <Name-of-Index>
```

Example - Create an index name `greetings_messages`

```
PUT greetings_messages
```

2. Indexing a document

Syntax:

```
POST <Name-of-index>/_doc
{
    "field": "value"
}
```

To autogenerate document id

or 

```
PUT <Name-of-index>/_doc/<your-assigned-id>
{
    "field": "value"
}
```
To assign custom document id. This will replace document content with the same id.

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

<u>Read</u>

Syntax:

```
GET <Name-of-index>/_doc/<id-of-document>
```

<u>Upate</U>

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

<u>Delete</u>

Syntax:

```
DELETE <Name-of-Index>/_doc/<id-of-doc-to-delete>
```