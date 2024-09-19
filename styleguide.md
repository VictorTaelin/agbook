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

### 1.2 Naming Conventions
- Variables and Functions: Use kebab-case (e.g., "add-nat")
- Types: Use CamelCase (e.g., NaturalNumber, BinaryTree)
- Avoid apostrophes in names
- For types under `Base/`, use naming consistent with Agda builtins (e.g., `Zero` and `Succ`)
- Helper functions should have the prefix of the filename followed by "-go"

### 1.3 Indentation and Formatting
- Use 2 spaces for indentation
- Align arguments and patterns in function definitions
- For functions with many arguments, alignment is not necessary. Use good judgment for readability
- Avoid unnecessary parentheses. Only use them when they are required for precedence or clarity
- When writing argument spacing, don't put space inside the argument in CI example

```agda
TODO: Pass the example here.
```

- Align chains of if-then-else statements

### 1.4 Function Style
- Prefer `do` notation with `let` over `let...in` and `where`
- Use `with` for pattern matching instead of `case of` or `if`
- Use native Agda `if` instead of `case of` and `Bool.if`
- If possible, replace a record with a sequence of let statements

```agda
TODO: Pass the example here.
```

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

Example:
```agda
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
│   ├── ALL.agda
│   ├── AVL
│   │   ├── ALL.agda
│   │   ├── Balance
│   │   ├── Test
│   │   │   └── delete.agda
│   │   └──Type.agda
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
