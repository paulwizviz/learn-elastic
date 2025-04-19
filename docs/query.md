# Query

Query is a search mechanism to help you improve the precision of your search.

## Syntax

```
GET <index>/_search
{
    "query":{
        ...
    }
}
```

## Match Query

The syntax is as follows:

```
"query":{
    "match":
        "<field>": {
            "query": <matching criteria>
        }
}
```

Example document:

```
POST /my-index/_doc
{
    "id": "park_rocky-mountain",
    "title": "Rocky Mountain",
    "description": "Bisected north to south by the Continental Divide, this portion of the Rockies has ecosystems varying from over 150 riparian lakes to montane and subalpine forests to treeless alpine tundra."
}
```

Example query:

This example attempts to match title field

```
GET my-index/_search
{
    "query": {
        "match": {
            "title": {
                "query": "Rocky"
            }
    }
  }
}
```

## References

* [Query and filter context](https://www.elastic.co/docs/reference/query-languages/query-dsl/query-filter-context)
* [Compound queries](https://www.elastic.co/docs/reference/query-languages/query-dsl/compound-queries)
* [Full text queries](https://www.elastic.co/docs/reference/query-languages/query-dsl/full-text-queries)
    * [Beginner’s Crash Course to Elastic Stack - Part 3: Full text queries](https://www.youtube.com/watch?v=2KgJ6TQPIIA)
