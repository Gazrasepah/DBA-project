-- Create the procedure
DELIMITER //

CREATE PROCEDURE CancelOrder(IN p_OrderID INT)
BEGIN
    DELETE FROM Orders WHERE OrderID = p_OrderID;
END //

DELIMITER ;

-- Call the procedure to cancel an order with OrderID = 123
CALL CancelOrder(123);
