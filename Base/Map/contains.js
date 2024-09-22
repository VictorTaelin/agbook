"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.contains = exports.$contains = void 0;
const Type_1 = require("../../Base/Bool/Type");
// Checks if a key exists in the Map.
// - m: The Map to search in.
// - k: The Bits key to look for.
// = True if the key exists in the Map, False otherwise.
const $contains = (m, k) => {
    switch (m.$) {
        case 'Node':
            switch (k.$) {
                case 'E':
                    return m.val.$ === 'Some' ? Type_1.$True : Type_1.$False;
                case 'O':
                    return (0, exports.$contains)(m.lft, k.tail);
                case 'I':
                    return (0, exports.$contains)(m.rgt, k.tail);
            }
        case 'Leaf':
            return Type_1.$False;
    }
};
exports.$contains = $contains;
const contains = (m) => (k) => (0, exports.$contains)(m, k);
exports.contains = contains;
