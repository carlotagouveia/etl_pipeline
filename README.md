# Building an ETL pipeline

**Technologies used:**
>1. Snowflake
>2. dbt
>3. Airflow


## Snowflake set up:
```sh
-- create accounts
use role accountadmin;

create warehouse dbt_wh with warehouse_size='x-small';
create database if not exists dbt_db;
create role if not exists dbt_role;

show grants on warehouse dbt_wh;

grant role dbt_role to user jayzern;
grant usage on warehouse dbt_wh to role dbt_role;
grant all on database dbt_db to role dbt_role;

use role dbt_role;

create schema if not exists dbt_db.dbt_schema;

-- clean up
use role accountadmin;

drop warehouse if exists dbt_wh;
drop database if exists dbt_db;
drop role if exists dbt_role;
```

## dbt

### dbt installation:

Create venv:
 ```sh
python -m venv dbt-env				
  ```

 ```sh
source dbt-env/bin/activate			
  ```

Create alias:
 ```sh
alias env_dbt='source <PATH_TO_VIRTUAL_ENV_CONFIG>/bin/activate'
  ```

Install dbt:

 ```sh
pip install dbt
```

### Initiate dbt project:

 ```sh
dbt init <project_name>
```

### Run dbt project
```sh
dbt deps                            # installs packages
```

```sh
dbt run                             # runs transformations
```

```sh
dbt test                            # runs tests
```

To run a single model:
```sh
dbt run -s <sql file name>
```


## Deploy on Airflow with Cosmos

Install astronomer-cosmos using Homebrew:
```sh
brew install astro
```
Create a new astro project:
```sh
astro dev init
```

Open Airflow:
```sh
localhost:8080
```

Add snowflake connection to Admin > Connections:
```sh
{
  "account": "<account_locator>-<account_name>",
  "warehouse": "dbt_wh",
  "database": "dbt_db",
  "role": "dbt_role",
  "insecure_mode": false
}
```
