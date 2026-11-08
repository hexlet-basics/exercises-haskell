module Solution where

-- BEGIN
data Tagged a = Tagged String a

tagValue :: Tagged a -> a
tagValue (Tagged _ value) = value
-- END
