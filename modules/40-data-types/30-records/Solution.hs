module Solution where

data Product = Product
  { productCode :: String
  , productPrice :: Integer
  }

setPrice :: Product -> Integer -> Product
-- BEGIN
setPrice product newPrice = product {productPrice = newPrice}
-- END
