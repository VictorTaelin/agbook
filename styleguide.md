# Monobook Style Guide

## Summary

1. [Code Structure](#1-code-structure)
   1.1 [File Organization](#11-file-organization)
   1.2 [Naming Conventions](#12-naming-conventions)
   1.3 [Indentation and Formatting](#13-indentation-and-formatting)
   1.4 [Function Style](#14-function-style)
2. [Language-Specific Guidelines (Agda)](#2-language-specific-guidelines-agda)
   2.1 [Imports](#21-imports)
   2.2 [Types and Data Structures](#22-types-and-data-structures)
   2.3 [Unicode and Operators](#23-unicode-and-operators)
3. [Documentation](#3-documentation)
   3.1 [Comments](#31-comments)
4. [Testing](#4-testing)
5. [Code Review Process](#5-code-review-process)
6. [Performance Considerations](#6-performance-considerations)
7. [Third-Party Libraries and Dependencies (FFI)](#7-third-party-libraries-and-dependencies-ffi)
8. [Examples](#8-examples)
9. [Tools and Linters](#9-tools-and-linters)

## 1. Code Structure

### 1.1 File Organization

1. Module declaration
2. Imports (alphabetically ordered)
3. Comments
4. Function definitions
5. Infix declarations

example:

```hs
module Base.Float.add where

open import Base.Float.Type

primitive primFloatPlus : Float → Float → Float

-- Addition of floats.
-- - x: The 1st float.
-- - y: The 2nd float.
-- = The sum of x and y.
add : Float -> Float -> Float
add = primFloatPlus

-- The infix version of add.
_+_ : Float -> Float -> Float
_+_ = add

infixl 6 _+_
```

### 1.2 Naming Conventions

- Variables and Functions: Use kebab-case (e.g., "add-nat")
- Types: Use CamelCase (e.g., NaturalNumber, BinaryTree)
- Avoid apostrophes in names
- For types under `Base/`, use naming consistent with Agda builtins (e.g., `Zero` and `Succ`)
 ```hs
  data Nat : Set where
   Zero : Nat  
   Succ : Nat -> Nat
  ```
- Helper functions should have the prefix of the filename followed by "-go"

### 1.3 Indentation and Formatting

- Use 2 spaces for indentation
- Align arguments and patterns in function definitions
- For functions with many arguments, alignment is not necessary. Use good judgment for readability
- Avoid unnecessary parentheses. Only use them when they are required for precedence or clarity
- When writing argument spacing, don't put space inside the argument in CI example
- Align chains of if-then-else statements

#### 1.3.1 Correct Examples

```hs
pad-length : Bits → Bits → Pair Bits Bits
pad-length a b = do
  let len-a   = length a
  let len-b   = length b
  let trg-len = max len-a len-b
  pad-zeros trg-len a , pad-zeros trg-len b
```

Here, do notation with let is used for clarity and to avoid the let...in structure. The indentation is aligned, making the code easy to read.

Another correct form of aligning patterns:

```hs
pred : Bits → Bits
pred E      = E
pred (O E)  = E
pred (O bs) = I (pred bs)
pred (I bs) = O bs
```

#### 1.3.2 Incorrec Examples

```hs
pad-length : Bits → Bits → Pair Bits Bits
pad-length a b =
  let len-a = length a
      len-b = length b
      target-len = max len-a len-b
  in pad-zeros target-len a , pad-zeros target-len b
  ```

Another incorrect forms of aligning patterns:

```hs
pred : Bits → Bits
pred E= E
pred (O E) = E
pred (O bs) = I (pred bs)
pred (I bs) = O bs

pred : Bits → Bits
pred         E  = E
pred (O      E) = E
pred (O     bs) = I (pred bs)
pred (I     bs) = O bs
```

### 1.4 Function Style

- Prefer `do` notation with `let` over `let...in` and `where`
- Use `with` for pattern matching instead of `case of` or `if`
- Use native Agda `if` instead of `case of` and `Bool.if`
- If possible, replace a record with a sequence of let statements
- If a helper function is very large or complex, it should be placed in a separate file

#### 1.4.1 Correct Examples

```hs
to-digit : Nat -> Char -> Maybe Nat
to-digit base c =
  if is-digit c then
    digit-to-nat c
  else if (base = 16) && is-hex-digit c then
    hex-to-nat c
  else
    None
```

Here, native `if` statements are used, and the structure is clear and readable. Pattern matching alternatives such as `case of` are avoided.

```hs
exists : String -> I Bool
exists path = do
  file-exists <- is-file path
  if file-exists
    then pure True
    else is-directory path
```

This example shows the use of `do` notation with an `if` block for clarity and conciseness. The `do` notation improves readability over a more complex `let...in` or `where` construct.

Another correct form for indentation is:

```hs
to-digit : Nat -> Char -> Maybe Nat
to-digit base c =
  if is-digit c
    then
       digit-to-nat c
    else if (base = 16) && is-hex-digit c then
       hex-to-nat c
    else
       None
```

#### 1.4.2 Incorrect Example

```hs
exists : String -> I Bool
exists path = do
  file-exists <- is-file path
  if file-exists
  then pure True
  else is-directory path
```

In this case, the indentation is inconsistent, making the code harder to read. The `then` and `else` branches should be properly aligned for better readability.

- Define helper functions at the top of the file or in separate files for complex ones
- Align `where` clauses with the function definition
- Primitives must be specific in the function file (e.g., primCharEquality should be in Char/eq)

```agda
TODO: Pass the example here.
```

## 2. Language-Specific Guidelines (Agda)

### 2.1 Imports

- Use `import qualified` to avoid name clashes
- Each file should export only one definition (except for infix operators)
- Each folder in the project should contain an ALL.agda file. The purpose of this file is to:

1. Import and re-export all modules in the folder.
2. Provide a single point of import for all functionality in that folder.
3. Ensure consistent naming and organization across the project.

Example of an ALL.agda file:

```hs
module Base.Example.ALL where

open import Base.Example.Type public
open import Base.Example.function1 public
open import Base.Example.function2 public

-- Re-export the main type and its constructors
open Base.Example.Type public using (ExampleType; Constructor1; Constructor2)
```

This structure allows other modules to import all functionality from a folder by simply importing its ALL module:

```hs
open import Base.Example.ALL
```

Example:

```hs
import qualified Data.List as List
import qualified Data.Maybe as Maybe

-- Usage:
List.length : List A -> Nat
Maybe.fromMaybe : A -> Maybe A -> A
```

### 2.2 Types and Data Structures

- For natural numbers, use native syntax (e.g., `3`) instead of `Succ(Succ(Succ Zero))`

### 2.3 Unicode and Operators

- Use Unicode for ∀, λ, ≡, and Σ
- Use standard arrow (->) instead of Unicode arrow
- Minimize operator use, except for common ones (TODO: write here the exceptions)
- Export both the operator and its corresponding function name

## 3. Documentation

### 3.1 Comments

- Start comments with a capital letter and end with a period
- Use complete sentences for explanatory comments
- Use numerical abbreviations for simple argument descriptions (e.g., 1st, 2nd, 3rd, 4th...)
- Use `=` to comment on what the function will return

Example:

```hs
module Base.Float.add where

open import Base.Float.Type

primitive
  primFloatPlus : Float → Float → Float

-- Addition of floats.
-- - x: The 1st float.
-- - y: The 2nd float.
-- = The sum of x and y.
add : Float -> Float -> Float
add = primFloatPlus

-- The infix version of add.
_+_ : Float -> Float -> Float
_+_ = add

infixl 6 _+_
```

## 4. Testing

- Create a test file for each data file
- Prefer tests using Eq and `refl` as proofs
- Place test directories alongside the tested data

Example directory structure:

```md
.
├── Base
│   ├── Nat
│   │   ├── ALL.agda
│   │   ├── Ord.agda
│   │   ├── Test
│   │   │   ├── eq.agda
│   │   │   ├── rshift.agda
│   │   │   └── show.agda
│   │   ├── Type.agda
│   │   └──add.agda
```

Path Example:

```hs
module Data.Nat.Test.eq where
```

## 5. Code Review Process

- Regularly review code for guideline compliance
- Be open to adjusting guidelines as the team's experience grows

## 6. Performance Considerations

- Be aware of performance impacts when choosing between constructs
- Trust the compiler for optimizations

## 7. Third-Party Libraries and Dependencies (FFI)

- Use a dedicated "FFI" folder with language-specific subfolders
- Separate complex FFI functions into their own files

## 8. Examples

(Various examples are provided throughout the document)

## 9. Tools and Linters

- Run tests and type-checking frequently
- Use CI/CD for automated checks
