module Solution where

orderPrice :: Integer -> Integer -> Bool -> Integer
orderPrice quantity unitPrice giftWrap =
  -- BEGIN
  let items = quantity * unitPrice
      wrapping = if giftWrap then 40 else 0
      shipping = if items < 2000 then 150 else 0
  in items + wrapping + shipping
  -- END
