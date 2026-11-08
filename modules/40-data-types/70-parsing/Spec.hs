module Main where

import Test.Hspec
import qualified Solution

main :: IO ()
main = hspec $ do
  describe "parseQuantity" $ do
    it "reads an ordinary quantity" $ do
      Solution.parseQuantity "12" `shouldBe` Right 12

    it "accepts the lower range boundary" $ do
      Solution.parseQuantity "1" `shouldBe` Right 1

    it "accepts the upper range boundary" $ do
      Solution.parseQuantity "100" `shouldBe` Right 100

    it "rejects zero as outside the quantity range" $ do
      Solution.parseQuantity "0" `shouldBe` Left "Quantity out of range"

    it "rejects a value just above the upper boundary" $ do
      Solution.parseQuantity "101" `shouldBe` Left "Quantity out of range"

    it "distinguishes a parsed negative value from invalid text" $ do
      Solution.parseQuantity "-3" `shouldBe` Left "Quantity out of range"

    it "rejects text without a number" $ do
      Solution.parseQuantity "many" `shouldBe` Left "Invalid integer"

    it "rejects empty input" $ do
      Solution.parseQuantity "" `shouldBe` Left "Invalid integer"

    it "rejects input containing only whitespace" $ do
      Solution.parseQuantity " \t\n " `shouldBe` Left "Invalid integer"

    it "rejects a nonnumeric suffix" $ do
      Solution.parseQuantity "12x" `shouldBe` Left "Invalid integer"

    it "rejects more than one number" $ do
      Solution.parseQuantity "12 3" `shouldBe` Left "Invalid integer"

    it "rejects a fractional representation for Integer" $ do
      Solution.parseQuantity "12.0" `shouldBe` Left "Invalid integer"

    it "follows standard reading of a leading plus sign" $ do
      Solution.parseQuantity "+3" `shouldBe` Left "Invalid integer"

    it "accepts surrounding whitespace" $ do
      Solution.parseQuantity " \t12\n " `shouldBe` Right 12

    it "accepts parentheses supported by standard Integer reading" $ do
      Solution.parseQuantity "(12)" `shouldBe` Right 12

    it "accepts hexadecimal input supported by Integer reading" $ do
      Solution.parseQuantity "0x10" `shouldBe` Right 16

    it "reads a spaced negative sign before checking the range" $ do
      Solution.parseQuantity "- 3" `shouldBe` Left "Quantity out of range"

    it "reads leading zeroes using standard Integer reading" $ do
      Solution.parseQuantity "007" `shouldBe` Right 7
