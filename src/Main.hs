{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
module Main where

import Data.Monoid ((<>))
import Web.Scotty
import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics

data User = User { userId :: Int, userName :: String } deriving (Show, Generic)
instance ToJSON User
instance FromJSON User

bob :: User
bob = User { userId = 1, userName = "bob" }

jenny :: User
jenny = User { userId = 2, userName = "jenny" }

allUsers :: [User]
allUsers = [bob, jenny]

matchesId :: Int -> User -> Bool
matchesId id user = userId user == id



routes :: ScottyM ()
routes = do
  get "/users" $ do
    json allUsers

  get "/hello/:name" $ do
      name <- param "name"
      text ("hello " <> name <> "!")

  get "/users/:id" $ do
    id <- param "id"
    json (filter (matchesId id) allUsers)


main = do
    putStrLn "Starting Server..."
    scotty 3000 $ routes
