module Solution where

fullHours :: Integer -> Integer
-- BEGIN
fullHours minutes = div minutes 60
-- END

remainingMinutes :: Integer -> Integer
-- BEGIN
remainingMinutes minutes = mod minutes 60
-- END
