"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.or = exports.$or = void 0;
const Type_1 = require("../../Base/Bool/Type");
const foldr_1 = require("../../Base/List/foldr");
const or_1 = require("../../Base/Bool/or");
// Performs the boolean "or" operation between all elements of a list.
// - xs: The input list of boolean values.
// = True if any element is True, False otherwise.
const $or = (xs) => (0, foldr_1.$foldr)(or_1.$or, Type_1.$False, xs);
exports.$or = $or;
const or = (xs) => (0, exports.$or)(xs);
exports.or = or;
