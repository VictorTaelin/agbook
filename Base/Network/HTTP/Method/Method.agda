module Base.Network.HTTP.Method.Method where

data Method : Set where
  GET     : Method
  POST    : Method
  PUT     : Method
  DELETE  : Method
  OPTIONS : Method
  HEAD    : Method


