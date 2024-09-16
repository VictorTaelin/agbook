module Network.HTTP.fetch where

open import Data.IOAsync.Type
open import Data.String.Type

postulate
  fetch : String → String → String → IOAsync String

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
