module Solution where

productCodes :: [(String, Integer)] -> [String]
productCodes products =
-- BEGIN
  map fst products
-- END
