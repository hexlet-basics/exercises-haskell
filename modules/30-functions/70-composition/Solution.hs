module Solution where

countWords :: String -> Int
-- BEGIN
countWords text = (length . words) text
-- END
