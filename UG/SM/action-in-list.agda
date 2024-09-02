module UG.SM.action-in-list where

open import UG.SM.Type
open import Data.List.Type
open import Data.Bool.Type
open import Data.Bool.or

-- mach : The machine containing the action equality function
-- a    : The action to search for
-- as   : The list of actions to search in
-- = Bool, True if the action is found, False otherwise
action-in-list : ∀ {S A : Set} → Mach S A → A → List A → Bool
action-in-list _ _ []           = False
action-in-list mach a (x :: xs) = (Mach.action-eq mach a x) || action-in-list mach a xs
