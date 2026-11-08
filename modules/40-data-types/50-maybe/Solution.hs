module Solution where

findFirst :: (a -> Bool) -> [a] -> Maybe a
-- BEGIN
findFirst _ [] = Nothing
findFirst predicate (value : rest) =
  if predicate value
    then Just value
    else findFirst predicate rest
-- END
