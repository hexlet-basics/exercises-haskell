module Solution where

-- BEGIN
import qualified Data.Char

normalizeCode :: String -> String
normalizeCode code = map Data.Char.toUpper code
-- END
