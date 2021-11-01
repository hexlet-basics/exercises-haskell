module Main where

import Test.Hspec

import qualified Solution

main :: IO ()
main = hspec $ do
  describe "Solution" $ do
    it "greets the user" $ do
      Solution.greet "Bob" `shouldBe` "Hello, Bob!"
      Solution.greet "Ann" `shouldBe` "Hello, Ann!"
