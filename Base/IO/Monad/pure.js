"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.pure = exports.$pure = void 0;
// pure: Lifts a value into the IO monad
const $pure = (x) => () => Promise.resolve(x);
exports.$pure = $pure;
const pure = (x) => (0, exports.$pure)(x);
exports.pure = pure;
// NOTE: This implementation matches the JS COMPILE pragma in the Agda code.
// It creates an IO action (a function) that, when executed, immediately resolves to the given value.
