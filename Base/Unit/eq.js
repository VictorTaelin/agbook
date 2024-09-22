"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.eq = exports.$eq = void 0;
const Type_1 = require("../../Base/Bool/Type");
// Equality function for Unit type.
// Always returns True since there's only one value of Unit.
const $eq = (_a, _b) => Type_1.True;
exports.$eq = $eq;
const eq = (_a) => (_b) => Type_1.True;
exports.eq = eq;
// NOTE: Operator omitted: '_==_'.
