module Solution where

-- BEGIN
edge = "|"
gap = " "

makeBadge :: String -> String
makeBadge name = edge ++ gap ++ name ++ gap ++ edge
-- END
