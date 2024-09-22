"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports._seq_ = exports._bind_ = exports.bind = exports.$bind = exports.seq = exports.$seq = void 0;
// Sequential composition of IO actions
// - m1: The first IO action to be performed
// - m2: The second IO action to be performed
// = An IO action that performs m1 and then m2, discarding the result of m1
const $seq = (m1, m2) => () => m1().then(() => m2());
exports.$seq = $seq;
const seq = (m1) => (m2) => (0, exports.$seq)(m1, m2);
exports.seq = seq;
// Bind operation for IO
const $bind = (ma, f) => () => ma().then(a => f(a)());
exports.$bind = $bind;
const bind = (ma) => (f) => (0, exports.$bind)(ma, f);
exports.bind = bind;
// Infix operators (not directly usable in TypeScript, but kept for reference)
exports._bind_ = exports.bind;
exports._seq_ = exports.seq;
// NOTE: In TypeScript, we can't define custom infix operators.
// The `>>=` and `>>` operators from Agda are represented by `bind` and `seq` functions respectively.
// Users should use these functions directly instead of infix notation.
// NOTE: The COMPILE GHC pragma is not applicable in TypeScript.
// The COMPILE JS pragma is implemented directly in the TypeScript code above.
