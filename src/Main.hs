{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module Main where

import Web.Scotty
import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics
import Prelude hiding (id)

data TodoItem = TodoItem { id :: Int, description :: String, done :: Bool } deriving (Show, Generic)
instance ToJSON TodoItem
instance FromJSON TodoItem

first :: TodoItem
first = TodoItem { id = 1, description = "Do this first", done = True }

second :: TodoItem
second = TodoItem { id = 2, description = "Do this second", done = False }

allItems :: [TodoItem]
allItems = [first, second]

matchesId :: Int -> TodoItem -> Bool
matchesId itemId item = id item == itemId


routes :: ScottyM ()
routes = do
  get "/items" $ do
    json allItems

  get "/items/:id" $ do
    id <- param "id"
    json (filter (matchesId id) allItems)


main = do
    putStrLn "Starting Server..."
    scotty 3000 $ routes
