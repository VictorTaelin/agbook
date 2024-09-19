module Base.IO.get-line where

open import Base.IO.Type
open import Base.String.Type

postulate
  get-line     : IO String

{-# FOREIGN GHC import qualified Data.Text.IO as Text #-}
{-# FOREIGN GHC import qualified Control.Exception   #-}

{-# COMPILE GHC get-line = Text.getLine #-}

{-# COMPILE JS get-line = function() { 
    return new Promise(function(resolve) { 
      const buffer = Buffer.alloc(1024); 
      let bytesRead = require('fs').readSync(0, buffer, 0, buffer.length, null); 
      resolve(buffer.toString('utf-8', 0, bytesRead).split('\n')[0].trim());
    }); 
  } #-}