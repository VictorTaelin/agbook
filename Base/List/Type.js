"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Cons = exports.$Cons = exports.Nil = exports.$Nil = void 0;
exports.$Nil = { $: '[]' };
exports.Nil = exports.$Nil;
const $Cons = (head, tail) => ({ $: '::', head, tail });
exports.$Cons = $Cons;
const Cons = (head) => (tail) => (0, exports.$Cons)(head, tail);
exports.Cons = Cons;
// NOTE: constructor '[]' renamed to 'Nil'.
// NOTE: constructor '_::_' renamed to 'Cons'.
