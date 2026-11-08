module Main where

import Test.Hspec
import qualified Solution

main :: IO ()
main = hspec $ do
  describe "orderPrice" $ do
    it "charges for delivery below the threshold" $ do
      Solution.orderPrice 3 400 False `shouldBe` 1350

    it "adds gift wrapping below the delivery threshold" $ do
      Solution.orderPrice 3 400 True `shouldBe` 1390

    it "makes delivery free at the threshold" $ do
      Solution.orderPrice 5 400 False `shouldBe` 2000

    it "still charges wrapping when delivery is free" $ do
      Solution.orderPrice 5 400 True `shouldBe` 2040

    it "charges delivery just below the threshold" $ do
      Solution.orderPrice 1 1999 False `shouldBe` 2149

    it "does not count wrapping toward free delivery" $ do
      Solution.orderPrice 1 1999 True `shouldBe` 2189

    it "makes delivery free just above the threshold" $ do
      Solution.orderPrice 1 2001 False `shouldBe` 2001

    it "handles a zero price" $ do
      Solution.orderPrice 2 0 False `shouldBe` 150

    it "adds wrapping to a zero-price order" $ do
      Solution.orderPrice 2 0 True `shouldBe` 190

    it "handles the maximum quantity and unit price" $ do
      Solution.orderPrice 1000 100000 True `shouldBe` 100000040
