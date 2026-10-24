SELECT
    *
FROM {{ source('dbo', 'SalesData') }}
