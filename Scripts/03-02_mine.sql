WITH salesData AS (
SELECT 
    employee.lastName || ' ' || employee.firstName as name
  , strftime('%Y', sales.soldDate) AS year
  , strftime('%m', sales.soldDate) AS month
  , round(sum(sales.salesAmount),2) AS salesAmount
FROM sales
JOIN employee
  ON sales.employeeId = employee.employeeId
WHERE year = '2021'
GROUP BY employee.employeeId, year, month
ORDER BY name, month ASC
)
select
   name
  ,sum(case when month = '01' then salesAmount end) as "Jan '21"
  ,sum(case when month = '02' then salesAmount end) as "Feb '21"
  ,sum(case when month = '03' then salesAmount end) as "Mar '21"
  ,sum(case when month = '04' then salesAmount end) as "Apr '21"
  ,sum(case when month = '05' then salesAmount end) as "May '21"
  ,sum(case when month = '06' then salesAmount end) as "Jun '21"
  ,sum(case when month = '07' then salesAmount end) as "Jul '21"
  ,sum(case when month = '08' then salesAmount end) as "Aug '21"
  ,sum(case when month = '09' then salesAmount end) as "Sep '21"
  ,sum(case when month = '10' then salesAmount end) as "Oct '21"
  ,sum(case when month = '11' then salesAmount end) as "Nov '21"
  ,sum(case when month = '12' then salesAmount end) as "Dec '21"
from salesData
group by name
order by name;