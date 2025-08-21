--แสดงชื่อประเภทสินค้า ชื่อสินค้า และ ราคาสินค้า
select categoryName, ProductName, UnitPrice
from Products, Categories
where Products.CategoryID = Categories.CategoryID

select categoryName, ProductName, UnitPrice
from Products as P JOIN Categories as C
on P.CategoryID = C.CategoryID

select CompanyName,OrderID
from Orders, Shippers
where Shippers.ShipperID = Orders.Shipvia

select CompanyName,OrderID
from Orders JOIN Shippers
on Shippers.ShipperID = Orders.Shipvia

--ต้องการรหัสสินค้า ชื่อสินค้า บริษัทผู้จำหน่าย ประเทศ
select  p.ProductID, p.ProductName, s.CompanyName, s.Country
from Products p JOIN Suppliers s on p.SupplierID = s.SupplierID

select  p.ProductID, p.ProductName, s.CompanyName, s.Country
from Products p , Suppliers s where p.SupplierID = s.SupplierID

select CompanyName, OrderID
from Orders,Shippers
where Shippers.ShipperID = Orders.ShipVia
AND orderID = 10275

select CompanyName, OrderID
from Orders JOIN Shippers
ON Shippers.ShipperID = Orders.ShipVia
where orderID = 10275

--ต้องการรหัสพนักงาน ชื่อพนักกงาน รหัสใบสั่งซืื้อที่เกี่ยวข้อง เรียงตามลำดับรหัสพนักงาน
select 
--ต้องการรหัสสินค้า เมือง และประเทศของบริษัทผู้จำหน่าย
--ต้องการชื่อบริษัทขนส่ง และจำนวนใบสั่งซื้อที่เกี่ยวข้อง
--ต้องการรหัสสินค้า ชื่อสินค้า และจำนวนทั้งหมดที่ขายได้
