"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.set = exports.$set = void 0;
const Type_1 = require("../../Base/Map/Type");
const Type_2 = require("../../Base/Maybe/Type");
// Inserts a key-value pair into the Map.
// - m: The Map to insert into.
// - k: The Bits key to insert.
// - v: The value to associate with the key.
// = A new Map with the key-value pair inserted.
const $set = (m, k, v) => {
    switch (m.$) {
        case 'Node':
            switch (k.$) {
                case 'E':
                    return (0, Type_1.$Node)((0, Type_2.$Some)(v), m.lft, m.rgt);
                case 'O':
                    return (0, Type_1.$Node)(m.val, (0, exports.$set)(m.lft, k.tail, v), m.rgt);
                case 'I':
                    return (0, Type_1.$Node)(m.val, m.lft, (0, exports.$set)(m.rgt, k.tail, v));
            }
        case 'Leaf':
            switch (k.$) {
                case 'E':
                    return (0, Type_1.$Node)((0, Type_2.$Some)(v), Type_1.$Leaf, Type_1.$Leaf);
                case 'O':
                    return (0, Type_1.$Node)(Type_2.$None, (0, exports.$set)(Type_1.$Leaf, k.tail, v), Type_1.$Leaf);
                case 'I':
                    return (0, Type_1.$Node)(Type_2.$None, Type_1.$Leaf, (0, exports.$set)(Type_1.$Leaf, k.tail, v));
            }
    }
};
exports.$set = $set;
const set = (m) => (k) => (v) => (0, exports.$set)(m, k, v);
exports.set = set;
