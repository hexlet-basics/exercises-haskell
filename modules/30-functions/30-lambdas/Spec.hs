module Main where

import Test.Hspec

import qualified Solution

main :: IO ()
main = hspec $ do
  describe "makeSurcharge" $ do
    it "adds the captured surcharge to the price" $ do
      let add25 = Solution.makeSurcharge 25
      add25 200 `shouldBe` 225
    it "uses the same surcharge for different prices" $ do
      let add40 = Solution.makeSurcharge 40
      add40 10 `shouldBe` 50
      add40 100 `shouldBe` 140
    it "keeps separate closures independent" $ do
      let add25 = Solution.makeSurcharge 25
          add100 = Solution.makeSurcharge 100
      add25 200 `shouldBe` 225
      add100 200 `shouldBe` 300
      add25 200 `shouldBe` 225
    it "does not change its surcharge between repeated calls" $ do
      let add7 = Solution.makeSurcharge 7
      add7 10 `shouldBe` 17
      add7 10 `shouldBe` 17
      add7 10 `shouldBe` 17
    it "leaves the price unchanged when the surcharge is zero" $ do
      let addNothing = Solution.makeSurcharge 0
      addNothing 350 `shouldBe` 350
    it "returns the surcharge for a zero price" $ do
      let add80 = Solution.makeSurcharge 80
      add80 0 `shouldBe` 80
    it "handles both zero values" $ do
      (Solution.makeSurcharge 0) 0 `shouldBe` 0
    it "handles the maximum allowed surcharge and price" $ do
      (Solution.makeSurcharge 1000000) 1000000000 `shouldBe` 1001000000
