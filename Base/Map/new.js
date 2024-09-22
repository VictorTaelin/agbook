"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.neo = exports.$neo = void 0;
const Type_1 = require("../../Base/Map/Type");
// Creates an empty Map.
// = An empty Map.
const $neo = () => Type_1.$Leaf;
exports.$neo = $neo;
const neo = () => (0, exports.$neo)();
exports.neo = neo;
