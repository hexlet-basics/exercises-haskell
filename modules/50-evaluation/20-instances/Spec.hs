module Main where

import Test.Hspec
import qualified Solution

main :: IO ()
main = hspec $ do
  describe "ShortLabel for Book" $ do
    it "formats a book label" $ do
      Solution.shortLabel (Solution.Book "FP" 120) `shouldBe` "Book: FP | pages=120"
    it "allows zero pages and an empty title" $ do
      Solution.shortLabel (Solution.Book "" 0) `shouldBe` "Book:  | pages=0"
    it "preserves spaces in a book title" $ do
      Solution.shortLabel (Solution.Book " A Book " 1) `shouldBe` "Book:  A Book  | pages=1"
    it "formats the upper page boundary" $ do
      Solution.shortLabel (Solution.Book "Reference" 1000000) `shouldBe` "Book: Reference | pages=1000000"
  describe "ShortLabel for Course" $ do
    it "formats a course label" $ do
      Solution.shortLabel (Solution.Course "Photography" 12) `shouldBe` "Course: Photography | lessons=12"
    it "allows zero lessons and an empty title" $ do
      Solution.shortLabel (Solution.Course "" 0) `shouldBe` "Course:  | lessons=0"
    it "formats one lesson without changing the field label" $ do
      Solution.shortLabel (Solution.Course "One" 1) `shouldBe` "Course: One | lessons=1"
    it "formats the upper lesson boundary and preserves the title" $ do
      Solution.shortLabel (Solution.Course "FP Basics" 1000000) `shouldBe` "Course: FP Basics | lessons=1000000"
