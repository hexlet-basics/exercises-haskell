module Main where

import Test.Hspec
import qualified Solution

main :: IO ()
main = hspec $ do
  describe "sensor values" $ do
    it "stores a large whole number as Integer" $ do
      (Solution.sampleCount :: Integer) `shouldBe` 987654321098765432109876543210

    it "stores the channel count as Int" $ do
      (Solution.channelCount :: Int) `shouldBe` 6

    it "stores the reference temperature as Double" $ do
      (Solution.referenceTemperature :: Double) `shouldBe` 64.25

    it "stores the ready flag as Bool" $ do
      (Solution.deviceReady :: Bool) `shouldBe` False

    it "stores the unit as a character" $ do
      (Solution.unitCode :: Char) `shouldBe` 'F'

    it "stores the device name as a string" $ do
      (Solution.deviceName :: String) `shouldBe` "Thermal probe"

  describe "makeLabel" $ do
    it "joins the supplied location and device name" $ do
      Solution.makeLabel "D4" "Thermal probe" `shouldBe` "D4 / Thermal probe"

    it "uses both arguments" $ do
      Solution.makeLabel "C8" "Auxiliary" `shouldBe` "C8 / Auxiliary"

    it "accepts an empty location" $ do
      Solution.makeLabel "" "Probe" `shouldBe` " / Probe"

    it "accepts an empty device name" $ do
      Solution.makeLabel "D4" "" `shouldBe` "D4 / "

    it "accepts two empty strings" $ do
      Solution.makeLabel "" "" `shouldBe` " / "

    it "preserves spaces and letter case" $ do
      Solution.makeLabel " d4 " "pRoBe " `shouldBe` " d4  / pRoBe "
