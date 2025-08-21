﻿--- ****  Workshop Basic Query 2 **** ---
--1. แสดงข้อมูลสินค้า 10 รายการแรก
SELECT TOP 10 * FROM Products;

-- จงแสดง รหัสพนักงาน ชื่อ นามสกุล ของพนักงานแต่ละคน
SELECT EmployeeID AS 'รหัสพนักงาน' , FirstName AS 'ชื่อ', LastName AS 'นามสกุล'
FROM Employees

--2. แสดงรหัสพนักงาน ชื่อและนามสกุลต่อกัน อายุ ของพนักงานแต่ละคน
SELECT EmployeeID, FirstName+SPACE(2)+ LastName AS 'EmployeeName', 
    YEAR(GETDATE()) - YEAR(BirthDate) AS 'Age'
FROM Employees;

/*3. แสดงข้อมูลรหัสสินค้า ชื่อสินค้า ราคาต่อหน่วย จำนวนคงเหลือ รหัสประเภทสินค้า
จัดเรียงข้อมูลตามรหัสประเภทสินค้า จากน้อยไปหามาก และจำนวนคงเหลือจากมากไปหาน้อย */
SELECT ProductID, ProductName, UnitPrice, UnitsInStock, CategoryID
FROM Products
ORDER BY CategoryID ASC, UnitsInStock DESC;


--4. แสดงจำนวนรายการสินค้าที่จัดอยู่ในประเภทสินค้ารหัส 1
SELECT COUNT(*) AS 'จำนวนรายการสินค้า'
FROM Products
WHERE CategoryID = 1;

--5. แสดงจำนวนลูกค้าที่อยู่ในประเทศสหรัฐอเมริกา
SELECT COUNT(*) AS 'จำนวนลูกค้าในสหรัฐอเมริกา'
FROM Customers
WHERE Country = 'USA';

--6. แสดงจำนวนใบสั่งซื้อที่จัดส่งไปยังประเทศฝรั่งเศส ในปี 1997
SELECT COUNT(*) AS 'จำนวนใบสั่งซื้อที่จัดส่งไปยังฝรั่งเศสในปี 1997'
FROM Orders
WHERE ShipCountry = 'France' AND YEAR(ShippedDate) = 1997;

--7. แสดงราคาต่อหน่วยของสินค้าที่แพงสุด และถูกที่สุด
SELECT MAX(UnitPrice) AS 'ราคาต่อหน่วยแพงสุด', 
       MIN(UnitPrice) AS 'ราคาต่อหน่วยถูกที่สุด'
FROM Products;

--8. จงแสดงอายุของพนักงานที่มากสุดและอายุน้อยสุด
SELECT MAX(YEAR(GETDATE()) - YEAR(BirthDate)) AS 'อายุมากสุด', 
       MIN(YEAR(GETDATE()) - YEAR(BirthDate)) AS 'อายุน้อยสุด'
FROM Employees;

--9. แสดงรหัสสินค้า ราคาต่อหน่วย จำนวนที่ซื้อ ราคารวม ของรายการสั่งซื้อที่อยู่ในใบสั่งซื้อหมายเลข10248
SELECT ProductID, UnitPrice, Quantity, (UnitPrice *Quantity) AS 'Total'
FROM [Order Details]
WHERE OrderID = 10248;

--10. แสดงยอดสั่งซื้อรวมของใบสั่งซื้อหมายเลข 10248
SELECT SUM(UnitPrice * Quantity) AS 'ยอดสั่งซื้อรวม'
FROM [Order Details]
WHERE OrderID = 10248;

--11. แสดงอายุเฉลี่ยของพนักงาน
SELECT AVG(YEAR(GETDATE()) - YEAR(BirthDate)) AS 'อายุเฉลี่ยของพนักงาน'
FROM Employees;


--******** GROUP BY ********

--12. แสดงรหัสประเภทสินค้าและจำนวนรายการสินค้าในแต่ละประเภท
SELECT CategoryID, COUNT(ProductID) AS NumProduct
FROM Products
GROUP BY CategoryID;

--13. แสดงรหัสประเภทสินค้าและจำนวนรายการสินค้าในแต่ละประเภท เฉพาะประเภทสินค้าที่มีรายการสินค้สอยู่ในประเภทนั้น 10 รายการขึ้นไป
SELECT CategoryID, COUNT(ProductID) AS NumProduct
FROM Products
GROUP BY CategoryID
HAVING COUNT(ProductID) >=10;

--14. แสดงชื่อประเทศและจำนวนลูกค้าที่อยู่ในแต่ละประเทศ เฉพาะประเทศที่มีลูกค้าไม่ถึง 5 ราย
SELECT Country, COUNT(CustomerID) AS NumCustomer
FROM Customers
GROUP BY Country
HAVING COUNT(*) < 5;


/*15. แสดงรหัสใบสั่งซื้อและยอดสั่งซื้อรวมในแต่ละใบสั่งซื้อ เฉพาะใบสั่งซื้อที่มียอดสั่งซื้อรวมเกิน $10000
จัดเรียงข้อมูลตามยอดสั่งซื้อรวมจากมากไปหาน้อย */
SELECT OrderID, SUM(UnitPrice * Quantity) AS Total
FROM [Order Details]
GROUP BY OrderID
HAVING SUM(UnitPrice * Quantity) > 10000
ORDER BY Total DESC;


