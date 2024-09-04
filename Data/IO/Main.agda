------------------------------------------------------------------------
-- The Agda standard library
--
-- Primitive IO: simple bindings to Haskell types and functions
-- Everything is assumed to be finite
------------------------------------------------------------------------


module Data.IO.Main where

-- NOTE: the contents of this module should be accessed via `IO` or
-- `IO.Finite`.

open import Data.IO.Type
open import Data.IO.bind
open import Data.IO.pure
open import Data.IO.seq
open import Data.String.Type
open import Data.Unit.Type


------------------------------------------------------------------------
-- Simple lazy IO

-- Note that the functions below produce commands which, when
-- executed, may raise exceptions.

-- Note also that the semantics of these functions depends on the
-- version of the Haskell base library. If the version is 4.2.0.0 (or
-- later?), then the functions use the character encoding specified by
-- the locale. For older versions of the library (going back to at
-- least version 3) the functions use ISO-8859-1.

postulate
  getLine     : IO String
  readFile    : String → IO String
  writeFile   : String → String → IO Unit
  appendFile  : String → String → IO Unit
  putStr      : String → IO Unit
  putStrLn    : String → IO Unit

{-# FOREIGN GHC import qualified Data.Text    as T   #-}
{-# FOREIGN GHC import qualified Data.Text.IO as TIO #-}
{-# FOREIGN GHC import qualified System.IO           #-}
{-# FOREIGN GHC import qualified Control.Exception   #-}

{-# FOREIGN GHC

  -- Reads a finite file. Raises an exception if the file path refers
  -- to a non-physical file (like "/dev/zero").
  readFiniteFile :: T.Text -> IO T.Text
  readFiniteFile f = do
    h <- System.IO.openFile (T.unpack f) System.IO.ReadMode
    Control.Exception.bracketOnError (return ()) (\_ -> System.IO.hClose h)
                                                 (\_ -> System.IO.hFileSize h)
    TIO.hGetContents h

#-}

{-# COMPILE GHC getLine    = TIO.getLine               #-}
{-# COMPILE GHC readFile   = readFiniteFile            #-}
{-# COMPILE GHC writeFile  = TIO.writeFile . T.unpack  #-}
{-# COMPILE GHC appendFile = TIO.appendFile . T.unpack #-}
{-# COMPILE GHC putStr     = TIO.putStr                #-}
{-# COMPILE GHC putStrLn   = TIO.putStrLn              #-}

{-# COMPILE UHC readFile = UHC.Agda.Builtins.primReadFiniteFile  #-}

-- A simple main function demonstrating the usage of file functions
main : IO Unit
main = do
  putStrLn "Enter a filename to read:"
  filename ← getLine
  content ← readFile filename
  putStrLn "File content:"
  putStrLn content
  putStrLn "Enter a filename to write:"
  outFilename ← getLine
  writeFile outFilename "Hello, this is a test file."
  putStrLn "File written successfully."
  appendFile outFilename "\nThis line is appended."
  putStrLn "File appended successfully."

