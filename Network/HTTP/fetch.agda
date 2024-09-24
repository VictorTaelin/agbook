module Network.HTTP.fetch where

open import Base.IO.Type
open import Base.String.Type

postulate
  fetch : String -> String -> String -> IO String

{-# FOREIGN GHC import qualified Network.HTTP.FFI.Fetch as HSF #-}
{-# FOREIGN GHC import qualified Data.Text as T #-}
{-# COMPILE GHC fetch = HSF.fetch #-}

{-# COMPILE JS
fetch = function(url) {
  return function(method) {
    return function(bodyData) {
      return function() {
        return fetch(url, {
          method: method,
          headers: {
            'Content-Type': 'application/json'
          },
          body: bodyData !== "" ? bodyData : undefined
        })
        .then(response => response.json())
        .then(json => JSON.stringify(json))
        .catch(error => JSON.stringify({ error: error.message }));
      };
    };
  };
};
#-}
