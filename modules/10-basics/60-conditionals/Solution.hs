module Solution where

deliveryCost :: Integer -> Bool -> Integer
deliveryCost orderTotal hasSubscription =
  -- BEGIN
  if orderTotal >= 5000 || hasSubscription
    then 0
    else 290
  -- END
