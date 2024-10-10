module UG.SIPD.Body.show where

open import Base.String.String
open import Base.String.append
open import Base.List.length
import Base.Nat.show as Nat
open import UG.SIPD.Body.Body
import UG.Shape.show as Shape

-- Converts a Body to its string representation.
-- - body: The Body to convert.
-- = A string representation of the given Body, including id, hitbox, and number of effects.
show : ∀ {S : Set} → Body S → String
show body = "Body: id = " ++ Body.id body 
         ++ ", hitbox = " ++ Shape.show (Body.hitbox body)
         ++ ", effects count = " ++ (Nat.show (length (Body.effects body)))
