"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.singleton = exports.$singleton = void 0;
const Type_1 = require("../../Base/List/Type");
// Creates a list containing a single element.
// - x: The element to be placed in the list.
// = A new list containing only the given element.
const $singleton = (x) => (0, Type_1.$Cons)(x, Type_1.$Nil);
exports.$singleton = $singleton;
const singleton = (x) => (0, exports.$singleton)(x);
exports.singleton = singleton;
// NOTE: Operator '[_]' omitted as it's not directly translatable to TypeScript.
// Users can use 'singleton' function instead.
