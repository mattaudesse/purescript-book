module Test.Main where

import Prelude

import Control.Monad.Eff         (Eff)
import Control.Monad.Eff.Console (CONSOLE, logShow)
import Data.AddressBook          (AddressBook, Entry, emptyBook, insertEntry, findEntry, showEntry)
import Data.Maybe                (Maybe)

example :: Entry
example =
  { firstName: "John"
  , lastName:  "Smith"
  , address: { street: "123 Fake St."
             , city:   "Faketown"
             , state:  "CA"
             }
  }

example' :: Entry
example' =
  { firstName: "Matt"
  , lastName:  "Audesse"
  , address: { street: "789 Made up Ln."
             , city:   "Burbs"
             , state:  "CA"
             }
  }

book0 :: AddressBook
book0 = emptyBook

printEntry :: String -> String -> AddressBook -> Maybe String
printEntry firstName lastName book = showEntry <$> findEntry firstName lastName book

main :: Eff (console :: CONSOLE) Unit
main = do
  let book1 = insertEntry example  emptyBook
  let book2 = insertEntry example' book1

  logShow $ printEntry "John" "Smith"   book0
  logShow $ printEntry "John" "Smith"   book1
  logShow $ printEntry "Matt" "Audesse" book1
  logShow $ printEntry "Matt" "Audesse" book2
