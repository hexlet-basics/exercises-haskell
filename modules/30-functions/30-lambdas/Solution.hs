module Solution where

makeSurcharge :: Integer -> (Integer -> Integer)
makeSurcharge surcharge =
-- BEGIN
  \price -> price + surcharge
-- END
