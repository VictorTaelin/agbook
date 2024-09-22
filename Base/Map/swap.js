"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.swap = exports.$swap = void 0;
const Type_1 = require("../../Base/Map/Type");
const Type_2 = require("../../Base/Maybe/Type");
const Type_3 = require("../../Base/Pair/Type");
// Swaps a value in the Map for a new value, returning the old value if it existed.
// - m: The Map to swap in.
// - k: The Bits key to swap.
// - v: The new value to insert.
// = A pair containing the new Map and the old value associated with the key (wrapped in Maybe).
const $swap = (m, k, v) => {
    switch (m.$) {
        case 'Node':
            switch (k.$) {
                case 'E':
                    return (0, Type_3.$Pair)((0, Type_1.$Node)((0, Type_2.$Some)(v), m.lft, m.rgt), m.val);
                case 'O':
                    var [new_lft, old_val] = (0, exports.$swap)(m.lft, k.tail, v);
                    return (0, Type_3.$Pair)((0, Type_1.$Node)(m.val, new_lft, m.rgt), old_val);
                case 'I':
                    var [new_rgt, old_val] = (0, exports.$swap)(m.rgt, k.tail, v);
                    return (0, Type_3.$Pair)((0, Type_1.$Node)(m.val, m.lft, new_rgt), old_val);
            }
        case 'Leaf':
            switch (k.$) {
                case 'E':
                    return (0, Type_3.$Pair)((0, Type_1.$Node)((0, Type_2.$Some)(v), Type_1.$Leaf, Type_1.$Leaf), Type_2.$None);
                case 'O':
                    var [new_lft, old_val] = (0, exports.$swap)(Type_1.$Leaf, k.tail, v);
                    return (0, Type_3.$Pair)((0, Type_1.$Node)(Type_2.$None, new_lft, Type_1.$Leaf), old_val);
                case 'I':
                    var [new_rgt, old_val] = (0, exports.$swap)(Type_1.$Leaf, k.tail, v);
                    return (0, Type_3.$Pair)((0, Type_1.$Node)(Type_2.$None, Type_1.$Leaf, new_rgt), old_val);
            }
    }
};
exports.$swap = $swap;
const swap = (m) => (k) => (v) => (0, exports.$swap)(m, k, v);
exports.swap = swap;
