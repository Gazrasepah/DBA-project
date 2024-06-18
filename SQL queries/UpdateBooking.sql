-- Create the procedure
DELIMITER //

CREATE PROCEDURE UpdateBooking(
    IN p_BookingID INT,
    IN p_BookingDate DATE
)
BEGIN
    UPDATE Bookings
    SET BookingDate = p_BookingDate
    WHERE BookingID = p_BookingID;
    
    SELECT 'Booking updated successfully.' AS Status;
END //

DELIMITER ;

-- Call the procedure to update an existing booking
CALL UpdateBooking(1, '2022-11-15');
