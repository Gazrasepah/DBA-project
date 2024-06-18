SELECT 
    m.MenuName 
FROM 
    Menus m
WHERE 
    m.MenuID = ANY (
        SELECT 
            o.MenuID 
        FROM 
            Orders o 
        WHERE 
            o.Quantity > 2
    );
