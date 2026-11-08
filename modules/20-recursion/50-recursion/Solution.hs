module Solution where

sumFirst :: Integer -> Integer
-- BEGIN
sumFirst 0 = 0
sumFirst n = (n - 1) + sumFirst (n - 1)
-- END
