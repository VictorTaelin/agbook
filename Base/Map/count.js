"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.count = exports.$count = void 0;
const Type_1 = require("../../Base/Nat/Type");
const add_1 = require("../../Base/Nat/add");
// Counts the number of elements in a Map.
// - m: The Map to count elements from.
// = The number of elements in the Map.
const $count = (m) => {
    switch (m.$) {
        case 'Leaf':
            return Type_1.$Zero;
        case 'Node':
            var left_count = (0, exports.$count)(m.lft);
            var right_count = (0, exports.$count)(m.rgt);
            var subtree_count = (0, add_1.$add)(left_count, right_count);
            switch (m.val.$) {
                case 'None':
                    return subtree_count;
                case 'Some':
                    return (0, Type_1.$Succ)(subtree_count);
            }
    }
};
exports.$count = $count;
const count = (m) => (0, exports.$count)(m);
exports.count = count;
