# Aggregates

An aggregation summarised your data as metrics, statistics and any other analytics.

## Syntax

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

## References

* [Beginner’s Crash Course to Elastic Stack - Part 4: Aggregations](https://www.youtube.com/watch?v=iGKOdep1Iss)