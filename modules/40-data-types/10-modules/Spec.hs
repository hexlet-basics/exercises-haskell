module Main where

import Test.Hspec
import qualified Solution

main :: IO ()
main = hspec $ do
  describe "normalizeCode" $ do
    it "converts lowercase letters to uppercase" $ do
      Solution.normalizeCode "ab-12" `shouldBe` "AB-12"

    it "handles mixed letter case" $ do
      Solution.normalizeCode "aBcD" `shouldBe` "ABCD"

    it "preserves already uppercase letters" $ do
      Solution.normalizeCode "READY" `shouldBe` "READY"

    it "preserves digits" $ do
      Solution.normalizeCode "12345" `shouldBe` "12345"

    it "handles empty input" $ do
      Solution.normalizeCode "" `shouldBe` ""

    it "preserves spaces inside the code" $ do
      Solution.normalizeCode "a b c" `shouldBe` "A B C"

    it "preserves leading and trailing spaces" $ do
      Solution.normalizeCode " xy_9 " `shouldBe` " XY_9 "

    it "preserves punctuation" $ do
      Solution.normalizeCode "!@#?*-+/" `shouldBe` "!@#?*-+/"

    it "preserves tabs and line separators" $ do
      Solution.normalizeCode "\ta1\nb2\r" `shouldBe` "\tA1\nB2\r"

    it "converts the entire lowercase ASCII alphabet" $ do
      Solution.normalizeCode "abcdefghijklmnopqrstuvwxyz"
        `shouldBe` "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
