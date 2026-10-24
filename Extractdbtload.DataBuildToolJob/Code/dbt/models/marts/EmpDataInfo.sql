SELECT
    *
FROM {{ source('dbo', 'EmpDataInfo') }}
