module Solution where

humidityStatus :: Integer -> String
-- BEGIN
humidityStatus humidity
  | humidity < 30 = "dry"
  | humidity <= 70 = "normal"
  | otherwise = "wet"
-- END
