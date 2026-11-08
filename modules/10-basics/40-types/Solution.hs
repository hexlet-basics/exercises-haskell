module Solution where

-- BEGIN
sampleCount :: Integer
-- END
sampleCount = 987654321098765432109876543210

-- BEGIN
channelCount :: Int
-- END
channelCount = 6

-- BEGIN
referenceTemperature :: Double
-- END
referenceTemperature = 64.25

-- Incorrect draft signature: deviceReady :: String
-- BEGIN
deviceReady :: Bool
-- END
deviceReady = False

-- Incorrect draft signature: unitCode :: String
-- BEGIN
unitCode :: Char
-- END
unitCode = 'F'

-- BEGIN
deviceName :: String
-- END
deviceName = "Thermal probe"

-- BEGIN
makeLabel :: String -> String -> String
-- END
makeLabel location name = location ++ " / " ++ name
