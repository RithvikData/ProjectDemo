SELECT
    *
FROM {{ source('dbo', 'EmpDataInfoData') }}
