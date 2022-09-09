
/*q1*/

select a.firstname,a.lastname,c.JobTitle, b.rate,
averagerate= avg(b.rate) over()
from AdventureWorks2019.person.Person as a
join adventureWorks2019.HumanResources.Employee as c
on a.BusinessEntityID=c.BusinessEntityID
join adventureWorks2019.HumanResources.Employeepayhistory as b
on c.BusinessEntityID= b.Businessentityid;

/*q2*/

select a.firstname,a.lastname,c.JobTitle,b.rate,
averagerate= avg(b.rate) over(),
maxrate= max(b.rate) over()
from AdventureWorks2019.person.Person as a
join adventureWorks2019.HumanResources.Employee as c
on a.BusinessEntityID=c.BusinessEntityID
join adventureWorks2019.HumanResources.Employeepayhistory as b
on c.BusinessEntityID= b.Businessentityid;

/*q3*/

select a.firstname,a.lastname,c.JobTitle,b.rate,
averagerate= avg(b.rate) over(),
diffFromavgrate=b. rate-avg(b.rate) over(),
maxrate= max(b.rate) over()
from AdventureWorks2019.person.Person as a
join adventureWorks2019.HumanResources.Employee as c
on a.BusinessEntityID=c.BusinessEntityID
join adventureWorks2019.HumanResources.Employeepayhistory as b
on c.BusinessEntityID= b.Businessentityid;

/*q4*/

select a.firstname,a.lastname,c.JobTitle,b.rate,
averagerate= avg(b.rate) over(),
diffFromavgrate=b. rate-avg(b.rate) over(),
maxrate= max(b.rate) over(),
percentofMaxRate= b.rate/max(b.rate) over() *100
from AdventureWorks2019.person.Person as a
join adventureWorks2019.HumanResources.Employee as c
on a.BusinessEntityID=c.BusinessEntityID
join adventureWorks2019.HumanResources.Employeepayhistory as b
on c.BusinessEntityID= b.Businessentityid;












