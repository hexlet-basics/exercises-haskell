module Solution where

sampleReading :: Integer
sampleReading = 27

-- BEGIN
formatReading :: Integer -> String
formatReading reading = "Reading: " ++ show reading

main :: IO ()
main = putStrLn (formatReading sampleReading)
-- END
