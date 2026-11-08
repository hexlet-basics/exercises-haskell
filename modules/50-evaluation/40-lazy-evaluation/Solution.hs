module Solution where

preview :: Bool -> Int -> [Integer] -> [Integer]
preview enabled count values =
  -- BEGIN
  if enabled then take count values else []
  -- END
