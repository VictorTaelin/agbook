"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.to_list = exports.$to_list = void 0;
const Type_1 = require("../../Base/Bits/Type");
const reverse_1 = require("../../Base/Bits/reverse");
const Type_2 = require("../../Base/List/Type");
const append_1 = require("../../Base/List/append");
const Type_3 = require("../../Base/Pair/Type");
// Helper function to traverse the Map and accumulate pairs
const to_list_helper = (m, acc) => {
    switch (m.$) {
        case 'Node':
            const lft_result = to_list_helper(m.lft, (0, Type_1.$O)(acc));
            const rgt_result = to_list_helper(m.rgt, (0, Type_1.$I)(acc));
            const combined = (0, append_1.$append)(lft_result, rgt_result);
            switch (m.val.$) {
                case 'None':
                    return combined;
                case 'Some':
                    return (0, Type_2.$Cons)((0, Type_3.$Pair)((0, reverse_1.$reverse)(acc), m.val.value), combined);
            }
        case 'Leaf':
            return Type_2.$Nil;
    }
};
// Converts a Map to a List of Bits, A pairs.
// The Bits represent the path to each element in the Map.
// None values are skipped.
// - m: The input Map.
// = A List of Pairs, where each Pair contains the Bits path and the corresponding value.
const $to_list = (m) => {
    return to_list_helper(m, Type_1.$E);
};
exports.$to_list = $to_list;
const to_list = (m) => (0, exports.$to_list)(m);
exports.to_list = to_list;
