module Solution where

keepInRange :: Integer -> Integer -> [Integer] -> [Integer]
keepInRange lower upper readings =
  -- BEGIN
  filter (\reading -> lower <= reading && reading <= upper) readings
  -- END
