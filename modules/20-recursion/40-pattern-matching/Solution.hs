module Solution where

firstOrDefault :: Integer -> [Integer] -> Integer
-- BEGIN
firstOrDefault fallback [] = fallback
firstOrDefault _ (first : _) = first
-- END
