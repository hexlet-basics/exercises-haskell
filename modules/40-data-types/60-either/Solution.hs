module Solution where

validateQuantity :: Integer -> Either String Integer
-- BEGIN
validateQuantity quantity
  | quantity < 1 = Left "Quantity must be at least 1"
  | quantity > 1000 = Left "Quantity must be at most 1000"
  | otherwise = Right quantity
-- END
