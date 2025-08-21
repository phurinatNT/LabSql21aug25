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
select e.EmployeeID,FirstName, OrderID
from Employees as e JOIN Orders as o on e.EmployeeID = o.EmployeeID
order by EmployeeID
--ต้องการรหัสสินค้า เมือง และประเทศของบริษัทผู้จำหน่าย
select ProductID, ProductName, City, Country
from Products p JOIN Suppliers s on p.SupplierID = s.SupplierID

--ต้องการชื่อบริษัทขนส่ง และจำนวนใบสั่งซื้อที่เกี่ยวข้อง
select CompanyName, count(*)
from Orders as o JOIN Shippers as s on o.ShipVia = s.ShipperID
Group by CompanyName

--ต้องการรหัสสินค้า ชื่อสินค้า และจำนวนทั้งหมดที่ขายได้
select p.ProductID,p.ProductName,sum(Quantity) as จำนวนที่ขายได้ทั้งหมด
from Products p JOIN [Order Details] od on p.ProductID = od.ProductID
Group by p.ProductID,p.ProductName
order by 1

select o.OrderID เลขใบสั่งซื้อ, c.CompanyName ลูกค้า,
		e.FirstName พนักงาน, o.ShipAddress ส่งไปที่
from Orders o,Customers c,Employees e
where o.CustomerID = c.CustomerID
And o.EmployeeID = e.EmployeeID

select o.OrderID เลขใบสั่งซื้อ, c.CompanyName ลูกค้า,
		e.FirstName พนักงาน, o.ShipAddress ส่งไปที่
from Orders o
	join Customers c on o.CustomerID = c.CustomerID
	join Employees e on o.EmployeeID = e.EmployeeID

select e.EmployeeID, FirstName, count(*) as [จำนวน order]
		,sum(freight) as [Sum of Freight]
from Employees e join Orders o on e.EmployeeID = o.EmployeeID
where year(OrderDate) = 1998
Group by e.EmployeeID, FirstName
Order by 3 desc

--ต้องการรหัสสินค้า ชื่อสินค้าที่ nancy ขายได้ ทั้งหมด เรียงตามลำดับรหัสสินค้า
select p.ProductID, p.ProductName
from Employees e join orders o on e.EmployeeID = o.EmployeeID
				 join [Order Details] od on o.OrderID = od.OrderID
				 join Products p on od.ProductID = p.ProductID
where e.FirstName = 'Nancy' 
Group by p.ProductID, p.ProductName 
order by ProductID

select distinct p.ProductID, p.ProductName
from Employees e join orders o on e.EmployeeID = o.EmployeeID
				 join [Order Details] od on o.OrderID = od.OrderID
				 join Products p on od.ProductID = p.ProductID
where e.FirstName = 'Nancy' 
order by ProductID

--ต้องการชื่อบริษัทลูกค้า around the Horn ซื้อสินค้าที่มาจากประเทศอะไรบ้าง
select distinct s.Country
from Customers c join orders o on c.CustomerID = o.CustomerID
				 join [Order Details] od on o.OrderID = od.OrderID
				 join Products p on od.ProductID = p.ProductID
				 join Suppliers s on s.SupplierID = p.SupplierID
where c.CompanyName = 'Around the Horn'

--บริษัทลูกค้าชื่อ Around the Horn ซื้อสินค้าอะไรบ้าง จำนวนเท่าใด
select p.ProductID, p.ProductName, sum(Quantity) [sum of Quantity]
from Customers c join orders o on c.CustomerID = o.CustomerID
				 join [Order Details] od on od.OrderID = o.OrderID
				 join Products p on p.ProductID = od.ProductID
where c.CompanyName = 'Around the Horn'
Group by p.ProductID, p.ProductName
order by 1

--ต้องการหมายเลขใบสั่งซื้อ ชื่อพนักงาน และยอดขายในใบสั่งซื้อนั้น
select o.OrderID, e.FirstName, 
		sum((Od.Quantity * od.UnitPrice * (1-od.Discount))) as TotalCash 
from Orders o join Employees e on o.EmployeeID = e.EmployeeID
			  join [Order Details] od on o.OrderID = od.OrderID
Group by o.OrderID, e.FirstName
Order by OrderID
