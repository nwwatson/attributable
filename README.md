# Attributable

Attributable tracks changes made on an ActiveRecord model made by a
user. Attributable requires a PostgreSQL database that supports hstore
fields.

## Installation

To install Attributable, you need to ensure ensure that the database
that you are working with has the hstore extension installed. You must use PostgreSQL to utilize this plugin.

```SQL
CREATE EXTENSION IF NOT EXISTS hstore
```

If you are developing and testing this plugin and are running the rspec tests, you will need to ensure that the test database has hstore installed also.
