module Main where

import Test.Hspec
import qualified Solution

main :: IO ()
main = hspec $ do
  describe "preview" $ do
    it "returns the requested prefix" $ do
      Solution.preview True 2 [12, 7, 18] `shouldBe` [12, 7]

    it "returns an empty list when preview is disabled" $ do
      Solution.preview False 2 [12, 7, 18] `shouldBe` []

    it "returns an empty list for a zero count" $ do
      Solution.preview True 0 [12, 7] `shouldBe` []

    it "returns the entire list when it is shorter than the request" $ do
      Solution.preview True 5 [12, 7] `shouldBe` [12, 7]

    it "handles an empty list" $ do
      Solution.preview True 3 [] `shouldBe` []

    it "preserves repeated elements" $ do
      Solution.preview True 2 [7, 7, 3] `shouldBe` [7, 7]

    it "does not demand a disabled sequence" $ do
      Solution.preview False 2 (error "disabled input must stay unused") `shouldBe` []

    it "does not demand a sequence for a zero count" $ do
      Solution.preview True 0 (error "zero-count input must stay unused") `shouldBe` []

    it "does not demand the tail after the requested prefix" $ do
      Solution.preview True 2 (12 : 7 : error "tail must stay unused") `shouldBe` [12, 7]

    it "does not demand the first unrequested element" $ do
      Solution.preview True 1 [12, error "unrequested value must stay unused", 18] `shouldBe` [12]

    it "can expose the prefix structure without demanding its first value" $ do
      length (Solution.preview True 2 [error "first value is not observed", 7, 18]) `shouldBe` 2

    it "does not demand unused values or the remaining tail while counting the prefix" $ do
      length (Solution.preview True 2 (error "first value is not observed" : 7 : error "tail is not observed"))
        `shouldBe` 2
