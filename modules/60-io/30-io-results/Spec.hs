module Main where

import ExerciseTest (captureOutput)
import Test.Hspec
import qualified Solution

main :: IO ()
main = hspec $ do
  describe "report" $ do
    it "reports zero and returns False" $ do
      (result, output) <- captureOutput (Solution.report 0)
      output `shouldBe` "Quantity: 0\n"
      result `shouldBe` False
    it "accepts the lower quantity boundary" $ do
      (result, output) <- captureOutput (Solution.report 1)
      output `shouldBe` "Quantity: 1\n"
      result `shouldBe` True
    it "accepts the value above the lower boundary" $ do
      (result, output) <- captureOutput (Solution.report 2)
      output `shouldBe` "Quantity: 2\n"
      result `shouldBe` True
    it "accepts the value below the upper boundary" $ do
      (result, output) <- captureOutput (Solution.report 99)
      output `shouldBe` "Quantity: 99\n"
      result `shouldBe` True
    it "accepts the upper quantity boundary" $ do
      (result, output) <- captureOutput (Solution.report 100)
      output `shouldBe` "Quantity: 100\n"
      result `shouldBe` True
    it "rejects the first value above the upper boundary" $ do
      (result, output) <- captureOutput (Solution.report 101)
      output `shouldBe` "Quantity: 101\n"
      result `shouldBe` False
    it "preserves a negative quantity in the output" $ do
      (result, output) <- captureOutput (Solution.report (-1))
      output `shouldBe` "Quantity: -1\n"
      result `shouldBe` False
    it "preserves a large invalid quantity in the output" $ do
      (result, output) <- captureOutput (Solution.report 1000000)
      output `shouldBe` "Quantity: 1000000\n"
      result `shouldBe` False
