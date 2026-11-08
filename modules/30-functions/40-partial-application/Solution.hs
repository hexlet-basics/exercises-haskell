module Solution where

bindFirst :: (a -> b -> c) -> a -> (b -> c)
-- BEGIN
bindFirst operation fixed = operation fixed
-- END
