
CREATE TABLE Product
(ProductID INT, ProductName VARCHAR(100) )
GO
CREATE TABLE ProductDescription
(ProductID INT, ProductDescription VARCHAR(800) )
GO
INSERT INTO Product VALUES (680,'HL Road Frame - Black, 58')
,(706,'HL Road Frame - Red, 58')
,(707,'Sport-100 Helmet, Red')
GO
INSERT INTO ProductDescription VALUES (680,'Replacement mountain wheel for entry-level rider.')
,(706,'Sturdy alloy features a quick-release hub.')
,(707,'Aerodynamic rims for smooth riding.')

select * from Product

create procedure Getparameterr as
begin
set nocount on
select p.ProductID,p.ProductName
from product as p
inner join productdescription pd
on p.productid=pd.productid
end
exec Getparameterr

---with  parameters
create procedure Getpaarameter
(@PID int)
as
begin
set nocount on
select p.ProductID,p.ProductName
from product as p
inner join productdescription pd
on p.productid=pd.productid
where p.productid=@PID
end
exec Getpaarameter 706

---with default parameters
create procedure Getparrameter
(@PID int=680)
as
begin
set nocount on
select p.ProductID,p.ProductName
from product as p
inner join productdescription pd
on p.productid=pd.productid
where p.productid=@PID
end
exec Getparrameter 680


---with output parameters
create table employe(empid int identity(1,1),empname varchar(500))
select * from employe
create procedure Gttpparameter
(@Ename varchar(50),
@EID int output)
as
begin
set nocount on
insert into employe (empname)values(@Ename)
select @EID =SCOPE_IDENTITY()
end
declare @empid int
exec  Gttpparameter 'anchal',@empid output
select *from employe

---encryption
create procedure Getencryptn
with encryption
as
begin
set nocount on
select empid,empname
from encryptn
end
sp_helptext Getencryptn


--local variable execution
local temporary,
global temporary
create procedure #tempp
as begin
print('Local temp procedure')
end
exec #tempp
select * from employe

---temperory table(glbal  execution)
create procedure ###temp
 as begin
 print('global temp procedure')
 end
 exec ###temp

 ---renaming stored procedure
 create procedure Getprodesccription 
 as
begin
set nocount on
select p.ProductID,p.ProductName,pd.ProductDescription
from product as p
inner join productdescription pd
on p.productid=pd.productid
end
exec sp_rename 'Getprodesccription ' ,'get_newme'
exec Get_newme