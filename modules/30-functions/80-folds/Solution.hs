module Solution where

buildChain :: String -> [String] -> String
buildChain ending labels =
-- BEGIN
  foldr (\label remaining -> label ++ ">" ++ remaining) ending labels
-- END
