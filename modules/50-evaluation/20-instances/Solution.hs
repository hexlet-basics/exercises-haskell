module Solution where

data Book = Book String Integer
data Course = Course String Integer

-- BEGIN
class ShortLabel a where
  shortLabel :: a -> String

instance ShortLabel Book where
  shortLabel (Book title pages) = "Book: " ++ title ++ " | pages=" ++ show pages

instance ShortLabel Course where
  shortLabel (Course title lessons) = "Course: " ++ title ++ " | lessons=" ++ show lessons
-- END
