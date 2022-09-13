/*q1*/
select p.Name as productname,p.listprice,q.name as ProductSubcategory,r.name as Productcategory
from production.product as p
join production.ProductSubcategory as q
on  p.productsubcategoryid = q.productsubcategoryid 
join  production.productcategory  as r
on q.productcategoryid= r.productcategoryid

/*q2*/

select p.Name as productname,p.listprice,q.name as ProductSubcategory,r.name as Productcategory,
pricerank=row_number()over(order by listprice desc)
from production.product as p
join production.ProductSubcategory as q
on  p.productsubcategoryid = q.productsubcategoryid 
join  production.productcategory  as r
on q.productcategoryid= r.productcategoryid



/*q3*/
select p.Name as productname,p.listprice,q.name as ProductSubcategory,r.name as Productcategory,
pricerank=row_number()over( order by listprice desc),
categoryPriceRank= row_number()over(partition by r.name order by listprice desc)
from production.product as p
join production.ProductSubcategory as q
on  p.productsubcategoryid = q.productsubcategoryid 
join  production.productcategory  as r
on q.productcategoryid= r.productcategoryid

/*q4*/
select t1.productname, t1.listprice,t1.pricerank,t1.categorypricerank,
Top5Priceincategory=
(
CASE
    WHEN categoryPriceRank>5 THEN 'NO'
    ELSE 'YES'
END)
from (
select p.Name as productname,p.listprice,q.name as ProductSubcategory,r.name as Productcategory,
pricerank=row_number()over( order by listprice desc),
categoryPriceRank= row_number()over(partition by r.name order by listprice desc)
from production.product as p
join production.ProductSubcategory as q
on  p.productsubcategoryid = q.productsubcategoryid 
join  production.productcategory  as r
on q.productcategoryid= r.productcategoryid) t1









