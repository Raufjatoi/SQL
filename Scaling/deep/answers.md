# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

- **Pros**: Evenly distributes data, balancing storage load.
- **Cons**: Queries require searching all boats, causing delays.

## Partitioning by Hour

- **Pros**: Faster queries for specific times.
- **Cons**: Uneven data distribution; some boats may become overloaded.

## Partitioning by Hash Value

- **Pros**: Even data distribution across boats.
- **Cons**: Queries for specific times still need all boats, causing delays
