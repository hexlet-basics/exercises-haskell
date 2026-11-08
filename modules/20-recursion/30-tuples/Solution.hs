module Solution where

itemTotal :: String -> Integer -> Integer -> (String, Integer)
-- BEGIN
itemTotal code unitPrice quantity = (code, unitPrice * quantity)
-- END
