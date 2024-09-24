module Base.ByteString.Trait.Show where

import Base.ByteString.show as ByteString
open import Base.ByteString.Type
open import Base.Trait.Show

instance
  ShowByteString : Show ByteString
  ShowByteString = record { to-string = ByteString.show }

