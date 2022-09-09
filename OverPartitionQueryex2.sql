/*q1*/
select p.Name as productname,p.listprice,q.name as ProductSubcategory,r.name as Productcategory
from production.product as p
join production.ProductSubcategory as q
on  p.productsubcategoryid = q.productsubcategoryid 
join  production.productcategory  as r
on q.productcategoryid= r.productcategoryid


/*q2*/

select p.Name as productname,p.listprice,q.name as ProductSubcategory,r.name as Productcategory,
AvgPriceByCategory=avg(p.listprice) over(partition by r.name )
from production.product as p
join production.ProductSubcategory as q
on  p.productsubcategoryid = q.productsubcategoryid 
join  production.productcategory  as r
on q.productcategoryid= r.productcategoryid

/*q3*/

select p.Name as productname,p.listprice,q.name as ProductSubcategory,r.name as Productcategory,
AvgPriceByCategory=avg(p.listprice) over(partition by r.name  ),
AvgPriceByCategoryAndSubcategory=avg(p.listprice)over(partition by r.name,q.name )
from production.product as p
join production.ProductSubcategory as q
on  p.productsubcategoryid = q.productsubcategoryid 
join  production.productcategory  as r
on q.productcategoryid= r.productcategoryid

/*q4*/
select p.Name as productname,p.listprice,q.name as ProductSubcategory,r.name as Productcategory,
AvgPriceByCategory=avg(p.listprice) over(partition by r.name  ),
AvgPriceByCategoryAndSubcategory=avg(p.listprice)over(partition by r.name,q.name ),
productvscategorydelta=p.listprice-avg(p.listprice)over(partition by r.name)
from production.product as p
join production.ProductSubcategory as q
on  p.productsubcategoryid = q.productsubcategoryid 
join  production.productcategory  as r
on q.productcategoryid= r.productcategoryid