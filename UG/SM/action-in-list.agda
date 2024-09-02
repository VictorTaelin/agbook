module UG.SM.action-in-list where

open import UG.SM.Type
open import Data.List.Type
open import Data.Bool.Type
open import Data.Bool.or

-- Checks if an action is already in the list using the machine's action-eq function
action-in-list : ∀ {S A : Set} → Mach S A → A → List A → Bool
action-in-list _ _ [] = False
action-in-list mach a (x :: xs) = (Mach.action-eq mach a x) || action-in-list mach a xs
