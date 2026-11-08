module Main where

import Test.Hspec

import qualified Solution

main :: IO ()
main = hspec $ do
  describe "handlingCost" $ do
    it "charges nothing for pickup" $ do
      Solution.handlingCost Solution.Pickup `shouldBe` 0
    it "charges the base courier fee for zero distance" $ do
      Solution.handlingCost (Solution.Courier 0) `shouldBe` 150
    it "adds the fee for one kilometre" $ do
      Solution.handlingCost (Solution.Courier 1) `shouldBe` 170
    it "uses the whole courier distance" $ do
      Solution.handlingCost (Solution.Courier 12) `shouldBe` 390
    it "handles the maximum valid courier distance" $ do
      Solution.handlingCost (Solution.Courier 1000) `shouldBe` 20150
    it "charges a fixed fee for a locker" $ do
      Solution.handlingCost (Solution.Locker "L-7") `shouldBe` 100
    it "does not depend on the locker code" $ do
      Solution.handlingCost (Solution.Locker "Other-point") `shouldBe` 100
    it "accepts an empty locker code" $ do
      Solution.handlingCost (Solution.Locker "") `shouldBe` 100
