"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.concat = exports.$concat = void 0;
const Type_1 = require("../../Base/List/Type");
const Type_2 = require("../../Base/Bits/Type");
// Converts a list of Bits in to a single Bits.
// Least significant bits should be to the left of the list.
const $concat = (bits_list) => {
    switch (bits_list.$) {
        case '[]':
            return Type_2.$E;
        case '::':
            switch (bits_list.head.$) {
                case 'E':
                    return (0, exports.$concat)(bits_list.tail);
                case 'O':
                    return (0, Type_2.$O)((0, exports.$concat)((0, Type_1.$Cons)(bits_list.head.tail, bits_list.tail)));
                case 'I':
                    return (0, Type_2.$I)((0, exports.$concat)((0, Type_1.$Cons)(bits_list.head.tail, bits_list.tail)));
            }
    }
};
exports.$concat = $concat;
const concat = (bits_list) => (0, exports.$concat)(bits_list);
exports.concat = concat;
