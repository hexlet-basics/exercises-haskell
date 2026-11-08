module Main where

import ExerciseTest (captureOutput)
import Test.Hspec

import qualified Solution

main :: IO ()
main = hspec $ do
  describe "main" $ do
    it "prints the report in order with one blank line and a final newline" $ do
      (result, output) <- captureOutput Solution.main
      result `shouldBe` ()
      output `shouldBe` "Weekly report\n\nCompleted: 3\nStatus: ready\n"
