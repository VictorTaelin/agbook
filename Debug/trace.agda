-- ported from: https://agda.github.io/agda-stdlib/master/Debug.Trace.html

module Debug.Trace where

open import Data.String.Type
open import Data.Equal.Type

postulate
  trace : ∀ {a} {A : Set a} → String → A → A

{-# FOREIGN GHC import qualified Debug.Trace as Debug #-}
{-# FOREIGN GHC import qualified Data.Text as Text #-}
{-# COMPILE GHC trace = const (const (Debug.trace . Text.unpack)) #-}

-- Because expressions involving postulates get stuck during evaluation,
-- we also postulate an equality characterising `trace`'s behaviour. By
-- declaring it as a rewrite rule we internalise that evaluation rule.

postulate
  trace-eq : ∀ {a} {A : Set a} (a : A) str → trace str a == a

-- FIXME: lines below cause error
-- {-# BUILTIN REWRITE _==_ #-}
-- {-# REWRITE trace-eq #-}

-- Specialised version of `trace` returning the traced message.

trace-id : String → String
trace-id str = trace str str
