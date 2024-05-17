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
import Servant
import Data.Aeson
import Network.Wai.Handler.Warp

type MessageAPI = "messages" :> Get '[JSON] [Message]

data Message = Message
    { user :: String
    , message :: String
    , created_at :: Day
} deriving (Eq, Show, Generic)

instance ToJSON Message

messages :: [Message]
messages =
    [ Message "oli1" "hello!" (fromGregorian 1683 3 1)
    , Message "oli2" "hello there other oli!!" (fromGregorian 1683 3 1)
    ]

server :: Server MessageAPI
server = return messages

messageAPI :: Proxy MessageAPI
messageAPI = Proxy

app :: Application
app = serve messageAPI server

main :: IO ()
main = run 8081 app
