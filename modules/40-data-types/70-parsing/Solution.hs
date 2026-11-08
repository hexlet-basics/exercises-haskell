module Solution where

import Text.Read (readMaybe)

parseQuantity :: String -> Either String Integer
parseQuantity text =
  -- BEGIN
  case (readMaybe text :: Maybe Integer) of
    Nothing -> Left "Invalid integer"
    Just quantity ->
      if quantity >= 1 && quantity <= 100
        then Right quantity
        else Left "Quantity out of range"
  -- END
