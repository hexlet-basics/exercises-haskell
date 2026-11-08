module Solution where

import Text.Read (readMaybe)

parseQuantity :: String -> Either String Integer
parseQuantity text =
  case (readMaybe text :: Maybe Integer) of
    Nothing -> Left "Invalid integer"
    Just quantity ->
      if quantity >= 1 && quantity <= 100
        then Right quantity
        else Left "Quantity out of range"

main :: IO ()
main = do
  -- BEGIN
  text <- getLine
  let result = parseQuantity text
  case result of
    Left message -> putStrLn ("Rejected: " ++ message)
    Right quantity -> putStrLn ("Accepted: " ++ show quantity)
  -- END
