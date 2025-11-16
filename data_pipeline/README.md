Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

RAW_DB.RETAIL_DATA → Bronze (Airbyte landing, from S3) -- AIRBYTE_DB.RETAILIO_DB

RAW_DB.RETAIL_SILVER → Silver (cleaned business entities)

RAW_DB.RETAIL_GOLD → Gold (aggregations / analytics)

Airbyte writes only to RETAIL_DATA.
dbt reads from RETAIL_DATA and writes to RETAIL_SILVER and RETAIL_GOLD.
