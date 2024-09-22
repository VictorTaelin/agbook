"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.take = exports.$take = void 0;
const Type_1 = require("../../Base/Map/Type");
const Type_2 = require("../../Base/Maybe/Type");
const Type_3 = require("../../Base/Pair/Type");
// Retrieves and removes a value from the Map given a key.
// - m: The Map to search in and remove from.
// - k: The Bits key to look up and remove.
// = A pair containing the new Map and the value associated with the key (wrapped in Maybe).
const $take = (m, k) => {
    switch (m.$) {
        case 'Node':
            switch (k.$) {
                case 'E':
                    return (0, Type_3.$Pair)((0, Type_1.$Node)(Type_2.$None, m.lft, m.rgt), m.val);
                case 'O':
                    var [new_lft, v] = (0, exports.$take)(m.lft, k.tail);
                    return (0, Type_3.$Pair)((0, Type_1.$Node)(m.val, new_lft, m.rgt), v);
                case 'I':
                    var [new_rgt, v] = (0, exports.$take)(m.rgt, k.tail);
                    return (0, Type_3.$Pair)((0, Type_1.$Node)(m.val, m.lft, new_rgt), v);
            }
        case 'Leaf':
            return (0, Type_3.$Pair)(Type_1.$Leaf, Type_2.$None);
    }
};
exports.$take = $take;
const take = (m) => (k) => (0, exports.$take)(m, k);
exports.take = take;
