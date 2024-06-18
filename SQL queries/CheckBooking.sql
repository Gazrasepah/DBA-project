-- Create the procedure
DELIMITER //

CREATE PROCEDURE CheckBooking(
    IN p_BookingDate DATE,
    IN p_TableNumber INT
)
BEGIN
    DECLARE v_Status VARCHAR(50);
    
    -- Check if there is a booking for the given date and table number
    IF EXISTS (
        SELECT 1 FROM Bookings
        WHERE BookingDate = p_BookingDate AND TableNumber = p_TableNumber
    ) THEN
        SET v_Status = 'Table is already booked on the specified date.';
    ELSE
        SET v_Status = 'Table is available for booking on the specified date.';
    END IF;
    
    -- Output the status
    SELECT v_Status AS Status;
END //

DELIMITER ;

-- Call the procedure to check the booking status for a specific date and table number
CALL CheckBooking('2022-10-10', 5);
