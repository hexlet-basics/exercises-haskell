module Solution where

removeInvalid :: Integer -> [Integer] -> [Integer]
-- BEGIN
removeInvalid _ [] = []
removeInvalid invalid (reading : rest) =
  if reading == invalid
    then removeInvalid invalid rest
    else reading : removeInvalid invalid rest
-- END
