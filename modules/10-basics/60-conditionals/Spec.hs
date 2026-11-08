module Main where

import Test.Hspec

import qualified Solution

main :: IO ()
main = hspec $ do
  describe "deliveryCost" $ do
    it "charges delivery for an empty order without a subscription" $ do
      Solution.deliveryCost 0 False `shouldBe` 290
    it "charges delivery for a small order" $ do
      Solution.deliveryCost 2000 False `shouldBe` 290
    it "charges delivery immediately below the free threshold" $ do
      Solution.deliveryCost 4999 False `shouldBe` 290
    it "offers free delivery exactly at the threshold" $ do
      Solution.deliveryCost 5000 False `shouldBe` 0
    it "offers free delivery above the threshold" $ do
      Solution.deliveryCost 5001 False `shouldBe` 0
    it "offers free delivery for the maximum valid order total" $ do
      Solution.deliveryCost 1000000000 False `shouldBe` 0
    it "offers free delivery to a subscriber for a small order" $ do
      Solution.deliveryCost 2000 True `shouldBe` 0
    it "offers free delivery to a subscriber for an empty order" $ do
      Solution.deliveryCost 0 True `shouldBe` 0
    it "offers free delivery when both free delivery conditions hold" $ do
      Solution.deliveryCost 5000 True `shouldBe` 0
