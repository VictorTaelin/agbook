"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.empty = exports.$empty = void 0;
const Type_1 = require("../../Base/Map/Type");
// Creates an empty Map.
// = An empty Map.
const $empty = () => Type_1.$Leaf;
exports.$empty = $empty;
const empty = () => (0, exports.$empty)();
exports.empty = empty;
