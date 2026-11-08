module Main where

import ExerciseTest (captureOutput)
import Test.Hspec

import qualified Solution

main :: IO ()
main = hspec $ do
  describe "main" $ do
    it "prints the exact greeting with one final newline" $ do
      (result, output) <- captureOutput Solution.main
      result `shouldBe` ()
      output `shouldBe` "Hello, Haskell!\n"
