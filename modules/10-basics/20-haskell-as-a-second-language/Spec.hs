module Main where

import Test.Hspec

import qualified Solution

main :: IO ()
main = hspec $ do
  describe "greet" $ do
    it "greets a short name" $ do
      Solution.greet "Bob" `shouldBe` "Hello, Bob!"

    it "uses the supplied name" $ do
      Solution.greet "Ann" `shouldBe` "Hello, Ann!"

    it "preserves spaces inside the name" $ do
      Solution.greet "Mary Jane" `shouldBe` "Hello, Mary Jane!"

    it "preserves the letter case" $ do
      Solution.greet "aLiCe" `shouldBe` "Hello, aLiCe!"

    it "accepts an empty name" $ do
      Solution.greet "" `shouldBe` "Hello, !"

    it "preserves leading and trailing spaces" $ do
      Solution.greet " Bob " `shouldBe` "Hello,  Bob !"

    it "preserves punctuation in the name" $ do
      Solution.greet "O'Neil-Smith" `shouldBe` "Hello, O'Neil-Smith!"
