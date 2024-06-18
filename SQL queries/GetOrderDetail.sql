-- Create the prepared statement
PREPARE GetOrderDetail FROM 
'SELECT OrderID, Quantity, TotalCost 
 FROM Orders 
 WHERE CustomerID = ?';

-- Create a variable and assign a value
SET @id = 1;

-- Execute the prepared statement using the variable
EXECUTE GetOrderDetail USING @id;
