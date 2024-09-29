module Base.Bits.sub where

open import Base.Bits.Bits
open import Base.Bits.show
open import Base.Equal.Equal
open import Base.Bits.to-nat
open import Base.Bits.from-nat


-- Função auxiliar para lidar com o empréstimo
-- Essa função ajusta a subtração quando ocorre um empréstimo.
borrow : Bits → Bits
borrow E       = E
borrow (I bs)  = O bs           -- Quando temos 1, mudamos para 0 sem empréstimo
borrow (O bs)  = I (borrow bs)  -- Quando temos 0, emprestamos e ajustamos os bits à esquerda

-- Função de subtração binária
sub : Bits → Bits → Bits
sub E y = y                
sub x E = x                  
sub (O x) (O y) = O (sub x y) 
sub (I x) (O y) = I (sub x y)
sub (O x) (I y) = O (sub (borrow x) y) 
sub (I x) (I y) = O (sub x y)

-- Infix operator for Bits subtraction
_-_ : Bits → Bits → Bits
_-_ = sub

infixl 6 _-_
