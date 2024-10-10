module UG.SIPD.Action.serialize where

open import Base.Bool.Bool
open import Base.ByteString.ByteString
open import Base.ByteString.append
open import Base.ByteString.cons
open import Base.ByteString.pack
open import Base.ByteString.pack-string
open import Base.ByteString.pack-string-fixed
open import Base.ByteString.write-f64-as-nat
open import Base.ByteString.write-u48
open import Base.List.head
open import Base.List.take
open import Base.Maybe.Maybe
open import Base.Maybe.Monad.bind
open import Base.Nat.Nat
open import Base.String.String
open import Base.String.from-char
open import Base.String.to-list
open import Base.Word8.Word8
open import Base.Word8.from-nat
open import UG.SIPD.Action.Action

serialize : Action → Maybe ByteString
serialize (SetNick time pid nick) = do
  let pid-str = write-u48 (pack-string "") 0 pid
  let time-str = write-u48 (pack-string "") 0 time
  let nick-str = pack-string nick
  Some ((from-nat SETNICK) :: pid-str ++ time-str ++ nick-str)

