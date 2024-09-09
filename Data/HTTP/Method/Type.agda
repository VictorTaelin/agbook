module Data.HTTP.Method.Type where

data Method : Set where
  GET     : Method
  POST    : Method
  PUT     : Method
  DELETE  : Method
  OPTIONS : Method
  HEAD    : Method


