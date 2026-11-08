module Solution where

normalizeSpaces :: String -> String
normalizeSpaces message =
  -- BEGIN
  unwords (words message)
  -- END
