module Solution where

combineReadings :: Int -> Int -> [Integer] -> [Integer] -> [Integer]
combineReadings keepCount skipCount primary backup =
  -- BEGIN
  take keepCount primary ++ drop skipCount backup
  -- END
