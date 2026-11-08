module Main where

import Test.Hspec
import qualified Solution

main :: IO ()
main = hspec $ do
  describe "setPrice" $ do
    it "sets a new price and keeps the product code" $ do
      let updated = Solution.setPrice (Solution.Product "A12" 1000) 1200
      Solution.productCode updated `shouldBe` "A12"
      Solution.productPrice updated `shouldBe` 1200
    it "allows the lower new price boundary" $ do
      let updated = Solution.setPrice (Solution.Product "FREE" 500) 0
      Solution.productCode updated `shouldBe` "FREE"
      Solution.productPrice updated `shouldBe` 0
    it "allows the upper new price boundary" $ do
      let updated = Solution.setPrice (Solution.Product "MAX" 0) 1000000
      Solution.productCode updated `shouldBe` "MAX"
      Solution.productPrice updated `shouldBe` 1000000
    it "allows an unchanged price" $ do
      let updated = Solution.setPrice (Solution.Product "SAME" 750) 750
      Solution.productCode updated `shouldBe` "SAME"
      Solution.productPrice updated `shouldBe` 750
    it "preserves an empty product code" $ do
      let updated = Solution.setPrice (Solution.Product "" 100) 300
      Solution.productCode updated `shouldBe` ""
      Solution.productPrice updated `shouldBe` 300
    it "preserves spaces in a product code" $ do
      let updated = Solution.setPrice (Solution.Product " A " 100) 200
      Solution.productCode updated `shouldBe` " A "
      Solution.productPrice updated `shouldBe` 200
    it "preserves the original record after the call" $ do
      let original = Solution.Product "ORIGINAL" 1000
      let updated = Solution.setPrice original 2000
      Solution.productPrice updated `shouldBe` 2000
      Solution.productCode original `shouldBe` "ORIGINAL"
      Solution.productPrice original `shouldBe` 1000
    it "creates independent results from one original value" $ do
      let original = Solution.Product "SHARED" 400
      let lowerPrice = Solution.setPrice original 100
      let higherPrice = Solution.setPrice original 800
      Solution.productPrice lowerPrice `shouldBe` 100
      Solution.productPrice higherPrice `shouldBe` 800
      Solution.productPrice original `shouldBe` 400
