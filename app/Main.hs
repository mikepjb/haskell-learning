{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use lambda-case" #-}
module Main where

newtype Parser a = Parser
  { runParser :: [Char] -> Maybe (a, [Char])
  }

satisfy :: (Char -> Bool) -> Parser Char
satisfy predicate = Parser $ \input ->
  case input of
    [] -> Nothing
    (x:xs) -> if predicate x then Just (x, xs) else Nothing

char :: Char -> Parser Char
char i = satisfy (== i)

instance Functor Parser where
  fmap f parser = _


main :: IO ()
main = do
  line <- getLine
  readAndEvalLine line
  main
  
readAndEvalLine :: Monad m => p -> m ()
readAndEvalLine line = return ()

