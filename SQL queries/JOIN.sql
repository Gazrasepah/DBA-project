SELECT 
    c.CustomerID, 
    c.FullName, 
    o.OrderID, 
    o.TotalCost, 
    m.MenuName, 
    mi.CourseName, 
    mi.StarterName
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
JOIN 
    Menus m ON o.MenuID = m.MenuID
JOIN 
    MenuItems mi ON m.MenuItemID = mi.MenuItemID
WHERE 
    o.TotalCost > 150
ORDER BY 
    o.TotalCost ASC;
