-- Create the procedure
DELIMITER //

CREATE PROCEDURE AddBooking(
    IN p_BookingID INT,
    IN p_CustomerID INT,
    IN p_BookingDate DATE,
    IN p_TableNumber INT
)
BEGIN
    INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID)
    VALUES (p_BookingID, p_BookingDate, p_TableNumber, p_CustomerID);
    
    SELECT 'Booking added successfully.' AS Status;
END //

DELIMITER ;

-- Call the procedure to add a new booking
CALL AddBooking(1, 1, '2022-10-10', 5);
