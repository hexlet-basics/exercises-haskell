module Main where

import Control.Exception (Exception(..))
import GHC.IO
import GHC.IO.Handle
import System.IO

import Test.Hspec

import qualified Solution

main :: IO ()
main = hspec $ do
  describe "Solution" $ do
    it "prints a text" $ do
      Solution.main `shouldPrint` ["Hello, World!"]

shouldPrint :: IO () -> [String] -> Expectation
shouldPrint action expectedLines = do
  (mbError, output) <- withTempFile $ \handle ->
    withCapturingTo handle $ catching action
  putStrLn "--- OUTPUT ---"
  putStr output
  putStrLn "--------------"
  case mbError of
    Nothing -> lines output `shouldBe` expectedLines
    Just err -> do
      hPutStr stderr err
      expectationFailure "There was an error"

catching :: IO () -> IO (Maybe String)
catching action =
  (Nothing <$ action) `catchAny` (pure . Just . displayException)

withCapturingTo :: Handle -> IO a -> IO a
withCapturingTo handle =
  bracket
    (hDuplicate stdout <* hDuplicateTo handle stdout)
    (\old -> hDuplicateTo old stdout)
    . const

withTempFile :: (Handle -> IO a) -> IO (a, String)
withTempFile body = do
  (path, handle) <- openTempFile "/tmp" "output.txt"
  result <- body handle `finally` hClose handle
  content <- readFile path
  pure (result, content)
