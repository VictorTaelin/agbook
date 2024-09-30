module Network.HTTP.fetch where

open import Base.IO.IO
open import Base.String.String

postulate fetch : String → String → String → IO String

{-# FOREIGN GHC
import qualified Network.HTTP.Simple as HTTP
import qualified Data.ByteString.Lazy as LBS
import qualified Data.Text as T
import qualified Data.Text.Encoding as TE
import Control.Exception (try)
import Data.Function ((&))

fetch :: T.Text -> T.Text -> T.Text -> IO T.Text
fetch url method bodyData = do
    let request = HTTP.parseRequest_ (T.unpack url)
                & HTTP.setRequestMethod (TE.encodeUtf8 method)
                & HTTP.setRequestBodyLBS (LBS.fromStrict $ TE.encodeUtf8 bodyData)
                & HTTP.setRequestHeader "Content-Type" ["application/json"]

    result <- try $ HTTP.httpLBS request
    case result of
        Left e -> return $ T.pack "Error: " <> T.pack (show (e :: HTTP.HttpException))
        Right response → return $ TE.decodeUtf8 $ LBS.toStrict $ HTTP.getResponseBody response

#-}

{-# COMPILE GHC fetch = fetch #-}

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
