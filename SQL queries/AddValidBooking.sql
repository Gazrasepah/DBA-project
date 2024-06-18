-- Create the procedure
DELIMITER //

CREATE PROCEDURE AddValidBooking(
    IN p_BookingDate DATE,
    IN p_TableNumber INT
)
BEGIN
    DECLARE v_TableStatus INT;
    
    START TRANSACTION;

    -- Check if the table is already booked on the given date
    SELECT COUNT(*) INTO v_TableStatus
    FROM Bookings
    WHERE BookingDate = p_BookingDate AND TableNumber = p_TableNumber;

    -- If the table is already booked, rollback the transaction
    IF v_TableStatus > 0 THEN
        ROLLBACK;
        SELECT 'Booking declined. Table is already booked on the specified date.' AS Status;
    ELSE
        -- Insert the new booking record
        INSERT INTO Bookings (BookingDate, TableNumber, CustomerID)
        VALUES (p_BookingDate, p_TableNumber, NULL); -- Replace NULL with actual CustomerID if available

        COMMIT;
        SELECT 'Booking successful.' AS Status;
    END IF;

END //

DELIMITER ;

-- Call the procedure to attempt booking
CALL AddValidBooking('2022-10-10', 5);
