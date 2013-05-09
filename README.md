# Attributable

Attributable tracks changes made on an ActiveRecord model made by a
user. Attributable requires a PostgreSQL database that supports hstore
fields.

## Installation

To install Attributable, you need to ensure ensure that the database
that you are working with has the hstore extension installed

```SQL
CREATE EXTENSION IF NOT EXISTS hstore
```
