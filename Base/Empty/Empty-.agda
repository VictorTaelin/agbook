module Base.Empty.Empty- where 

open import Base.Empty.Empty

-- Function to demonstrate that nothing can be constructed from Empty
absurd : {A : Set} → Empty → A
absurd ()

-- Test: Trying to create an Empty value (this should not type check)
-- uncomment to see the error
-- impossible : Empty
-- impossible = ?

-- Test: Using absurd function
useAbsurd : {A : Set} → Empty → A
useAbsurd = absurd

-- This definition type checks, showing that we can use Empty in function types
emptyFunction : Empty → Empty
emptyFunction x = x

-- This shows that any proposition follows from Empty (principle of explosion)
emptyImpliesAnything : {A : Set} → Empty → A
emptyImpliesAnything = absurd

