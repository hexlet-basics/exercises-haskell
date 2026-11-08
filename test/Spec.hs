module Main where

import Control.Exception (try)
import ExerciseTest (captureOutput, withInput)
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "captureOutput" $ do
    it "preserves the action result and exact output" $ do
      result <- captureOutput $ do
        putStr "hello"
        putStrLn " world"
        pure (42 :: Integer)
      result `shouldBe` (42, "hello world\n")

    it "captures an action with no output" $ do
      result <- captureOutput (pure True)
      result `shouldBe` (True, "")

    it "isolates nested captures and restores the outer output" $ do
      result <- captureOutput $ do
        putStr "before"
        inner <- captureOutput (putStr "inside")
        putStr "after"
        pure inner
      result `shouldBe` (((), "inside"), "beforeafter")

    it "restores output after an action throws" $ do
      result <- captureOutput $ do
        failed <- try (captureOutput (ioError (userError "expected"))) :: IO (Either IOError ((), String))
        case failed of
          Left _ -> putStr "restored"
          Right _ -> expectationFailure "The inner action should fail"
      result `shouldBe` ((), "restored")

  describe "withInput" $ do
    it "supplies consecutive lines to an action" $ do
      result <- withInput "first\nsecond\n" $ do
        first <- getLine
        second <- getLine
        pure (first, second)
      result `shouldBe` ("first", "second")

    it "restores the outer input after a nested action" $ do
      result <- withInput "outer\n" $ do
        inner <- withInput "inner\n" getLine
        outer <- getLine
        pure (inner, outer)
      result `shouldBe` ("inner", "outer")

    it "restores input after an action throws" $ do
      result <- withInput "outer\n" $ do
        failed <- try (withInput "inner\n" (ioError (userError "expected"))) :: IO (Either IOError ())
        case failed of
          Left _ -> getLine
          Right _ -> expectationFailure "The inner action should fail" >> pure ""
      result `shouldBe` "outer"
