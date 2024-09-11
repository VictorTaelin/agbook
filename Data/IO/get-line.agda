module Data.IO.get-line where

open import Data.IO.Type
open import Data.String.Type

postulate
  get-line     : IO String

{-# FOREIGN GHC import qualified Data.Text.IO as Text #-}
{-# FOREIGN GHC import qualified Control.Exception   #-}

{-# COMPILE GHC get-line = Text.getLine #-}

{-# COMPILE JS get-line = function() {
    const buffer = Buffer.alloc(1024); 
    let bytesRead = require('fs').readSync(0, buffer, 0, buffer.length, null); 
    return buffer.toString('utf-8', 0, bytesRead).split('\n')[0].trim();
  }; 
#-}
