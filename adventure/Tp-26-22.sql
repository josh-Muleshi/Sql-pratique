SELECT Person.Person.FirstName, Person.Person.LastName, 
HumanResources.Employee.Gender, HumanResources.Employee.BirthDate
FROM Person.Person, HumanResources.Employee
WHERE Person.BusinessEntityID=HumanResources.Employee.BusinessEntityID

SELECT Person.Person.FirstName, Person.Person.LastName, 
HumanResources.Employee.Gender, HumanResources.Employee.MaritalStatus
FROM Person.Person, HumanResources.Employee
WHERE Person.BusinessEntityID=HumanResources.Employee.BusinessEntityID 
AND HumanResources.Employee.Gender = 'M' AND HumanResources.Employee.MaritalStatus = 'M'

SELECT p.FirstName, p.LastName, hrd.name
FROM Person.Person as p, HumanResources.Employee as hre, HumanResources.Department as hrd,HumanResources.EmployeeDepartmentHistory as hred
WHERE p.BusinessEntityID=hre.BusinessEntityID 
AND hre.BusinessEntityID = hred.BusinessEntityID AND hred.BusinessEntityID = hrd.DepartmentID 
--and hrd.Name = 'Marketing'

SELECT count(*) FROM HumanResources.Employee

SELECT COUNT(*) FROM Person.Person

SELECT COUNT(*) FROM Person.Person as p
WHERE p.BusinessEntityID not in
(SELECT e.BusinessEntityID FROM HumanResources.Employee as e)

SELECT COUNT(p.BusinessEntityID) FROM Person.Person as p INNER JOIN HumanResources.Employee as e
ON p.BusinessEntityID=e.BusinessEntityID 

SELECT count(*), d.Name, d.GroupName
FROM HumanResources.Employee as e, HumanResources.Department as d, HumanResources.EmployeeDepartmentHistory as ed
WHERE e.BusinessEntityID=ed.BusinessEntityID and ed.DepartmentID=d.DepartmentID
GROUP BY d.Name, d.GroupName

SELECT p.FirstName, p.LastName, e.HireDate FROM Person.Person as p ,HumanResources.Employee as e
WHERE p.BusinessEntityID=e.BusinessEntityID AND YEAR(e.HireDate)=2009 --e.HireDate like '2009%'

SELECT d.Name, COUNT(*)
FROM HumanResources.Department as d, HumanResources.EmployeeDepartmentHistory as ed, HumanResources.Employee as e
WHERE e.BusinessEntityID=ed.BusinessEntityID and ed.DepartmentID=d.DepartmentID GROUP BY d.Name ORDER by COUNT(*) DESC

SELECT d.Name
FROM HumanResources.Department as d, HumanResources.EmployeeDepartmentHistory as ed, HumanResources.Employee as e
WHERE e.BusinessEntityID=ed.BusinessEntityID and ed.DepartmentID=d.DepartmentID GROUP BY d.Name HAVING COUNT(*) = 
(SELECT top 1 COUNT(*)
FROM HumanResources.Department as d, HumanResources.EmployeeDepartmentHistory as ed, HumanResources.Employee as e
WHERE e.BusinessEntityID=ed.BusinessEntityID and ed.DepartmentID=d.DepartmentID GROUP BY d.Name ORDER by COUNT(*) DESC)