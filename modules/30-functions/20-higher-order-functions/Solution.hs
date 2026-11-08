module Solution where

applyTwice :: (a -> a) -> a -> a
applyTwice transform value =
  -- BEGIN
  transform (transform value)
  -- END
