module Solution where

scaledProgression :: Int -> Integer -> Integer -> [Integer]
scaledProgression count start step =
  -- BEGIN
  take count (map (\value -> value * 2) (iterate (\value -> value + step) start))
  -- END
