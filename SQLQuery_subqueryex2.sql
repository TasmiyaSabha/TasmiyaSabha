Write a query that displays the three most expensive orders, per vendor ID, from the
Purchasing.PurchaseOrderHeader table. There should ONLY be three records per Vendor ID,
even if some of the total amounts due are identical. "Most expensive" is defined by the 
amount in the "TotalDue" field. 

/*q1*/
WITH a AS
(
SELECT distinct VendorID , PurchaseOrderID , OrderDate ,totaldue,Freight,taxamt,
Rannk=Row_number() OVER (partition by vendorid ORDER BY totaldue Desc) 
FROM Purchasing.PurchaseOrderHeader
)
SELECT *
FROM a
WHERE Rannk<=3;



