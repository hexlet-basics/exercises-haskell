module Solution where

report :: Integer -> IO Bool
-- BEGIN
report quantity = do
  putStrLn ("Quantity: " ++ show quantity)
  pure (quantity >= 1 && quantity <= 100)
-- END
