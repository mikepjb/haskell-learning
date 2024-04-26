{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Main where

import GHC.Generics
import Data.Time.Calendar
import Data.Aeson
import Data.Aeson.Types
import Servant

type MessageAPI = "messages" :> Get '[JSON] [Message]

data Message = Message
    { user :: String
    , message :: String
    , created_at :: Day
} deriving (Eq, Show, Generic)

messages :: [Message]
messages =
    [ Message "oli1" "hello!" (fromGregorian 1683 3 1)
    , Message "oli2" "hello there other oli!!" (fromGregorian 1683 3 1)
    ]

server :: Server 

main :: IO ()
main = putStrLn "Hello, Haskell!"
