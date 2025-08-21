
--  จงแสดง สินค้า ชื่อสินค้า ราคาต่อหน่วย จำนวนที่ซื้อ ราคารวมสินค้าในใบสั่งชื้อหมายเลข 10248
SELECT * FROM [Order Details]
WHERE OrderID = 10248

SELECT * FROM Products;
SELECT * FROM Categories;

-- Products
SELECT OD.ProductID, ProductName, OD.UnitPrice, Quantity, OD.UnitPrice * Quantity 
AS SumPrice
FROM [Order Details] AS OD , Products AS P
WHERE  OD.ProductID = P.ProductID
AND OrderID = 10248;

SELECT ProductID, ProductName, UnitPrice, CategoryName
FROM Products, Categories
WHERE Products.CategoryID = Categories.CategoryID;

-- JOIN
SELECT * 
FROM Products JOIN Categories
ON Products.CategoryID = Categories.CategoryID;
-- WHERE 