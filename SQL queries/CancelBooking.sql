-- Create the procedure
DELIMITER //

CREATE PROCEDURE CancelBooking(
    IN p_BookingID INT
)
BEGIN
    DELETE FROM Bookings
    WHERE BookingID = p_BookingID;
    
    SELECT 'Booking canceled successfully.' AS Status;
END //

DELIMITER ;

-- Call the procedure to cancel a booking
CALL CancelBooking(1);
