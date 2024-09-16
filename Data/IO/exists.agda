module Data.IO.exists where

open import Data.IO.Type
open import Data.IO.bind
open import Data.IO.pure
open import Data.IO.is-directory
open import Data.IO.is-file
open import Data.String.Type
open import Data.Bool.Type
open import Data.Bool.if

-- Checks if a file or directory exists at the given path.
-- - path: The path to check.
-- = True if either a file or directory exists at the given path, False otherwise.
exists : String → IO Bool
exists path = is-file path >>= λ file-exists →
              if file-exists
              then pure True
              else is-directory path

{-# COMPILE JS exists = function(path) { 
  return function() { 
    return new Promise(function(resolve) { 
      require('fs').access(path, function(err) { 
        resolve(!err); 
      });
     }); 
  }; 
} #-}