SELECT
   Emp.firstName
  ,Emp.lastName
  ,Emp.title
  ,Mng.firstName AS managerFirstName
  ,Mng.lastName AS managerLastName
FROM employee Emp
LEFT OUTER JOIN employee Mng
  ON Emp.managerId = Mng.employeeId;