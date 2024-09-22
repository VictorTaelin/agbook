"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.sum = exports.$sum = void 0;
const Type_1 = require("../../Base/Nat/Type");
const add_1 = require("../../Base/Nat/add");
// Calculates the sum of all values in a tree of natural numbers.
// - t: The tree to sum.
// = The sum of all values in the tree.
const $sum = (t) => {
    switch (t.$) {
        case 'Leaf':
            return Type_1.Zero;
        case 'Node':
            return (0, add_1.$add)(t.val, (0, add_1.$add)((0, exports.$sum)(t.lft), (0, exports.$sum)(t.rgt)));
    }
};
exports.$sum = $sum;
const sum = (t) => (0, exports.$sum)(t);
exports.sum = sum;
