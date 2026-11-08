module Solution where

reportTitle :: String
reportTitle = "Weekly report"

reportSummary :: String
reportSummary = "Completed: " ++ show (3 :: Integer)

reportStatus :: String
reportStatus = "Status: ready"

main :: IO ()
main = do
  -- BEGIN
  putStrLn reportTitle
  putStrLn ""
  putStrLn reportSummary
  putStrLn reportStatus
  -- END
