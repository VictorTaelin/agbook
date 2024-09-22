"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
// NOTE: In TypeScript, we represent IO as a function that returns a Promise.
// This allows us to handle asynchronous operations in a way that's similar to Agda's IO.
// No direct equivalent for the GHC-specific COMPILE pragma in TypeScript.
// The FOREIGN GHC pragma is also not applicable in TypeScript.
// For Text I/O operations, we can use the built-in String type in TypeScript,
// which is equivalent to Text in Haskell for most purposes.
