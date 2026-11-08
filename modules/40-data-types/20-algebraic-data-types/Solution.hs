module Solution where

-- BEGIN
data Delivery = Pickup | Courier Integer | Locker String

handlingCost :: Delivery -> Integer
handlingCost Pickup = 0
handlingCost (Courier distance) = 150 + 20 * distance
handlingCost (Locker _) = 100
-- END
