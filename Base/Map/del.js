"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.del = exports.$del = void 0;
const Type_1 = require("../../Base/Map/Type");
const Type_2 = require("../../Base/Maybe/Type");
// Removes a key-value pair from the Map.
// - m: The Map to remove from.
// - k: The Bits key to remove.
// = A new Map with the key-value pair removed.
const $del = (m, k) => {
    switch (m.$) {
        case 'Node':
            switch (k.$) {
                case 'E':
                    return (0, Type_1.$Node)(Type_2.$None, m.lft, m.rgt);
                case 'O':
                    return (0, Type_1.$Node)(m.val, (0, exports.$del)(m.lft, k.tail), m.rgt);
                case 'I':
                    return (0, Type_1.$Node)(m.val, m.lft, (0, exports.$del)(m.rgt, k.tail));
            }
        case 'Leaf':
            return Type_1.$Leaf;
    }
};
exports.$del = $del;
const del = (m) => (k) => (0, exports.$del)(m, k);
exports.del = del;
