module Solution where

-- BEGIN
findPosition :: Eq a => a -> [a] -> Maybe Integer
findPosition _ [] = Nothing
findPosition target (value : rest) =
  if target == value
    then Just 0
    else case findPosition target rest of
      Nothing -> Nothing
      Just position -> Just (position + 1)
-- END
