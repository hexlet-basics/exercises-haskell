module Solution where

data Tree = Item Integer | Bundle Tree Tree

countLeaves :: Tree -> Integer
-- BEGIN
countLeaves (Item _) = 1
countLeaves (Bundle left right) = countLeaves left + countLeaves right
-- END
