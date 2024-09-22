"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.get = exports.$get = void 0;
const Type_1 = require("../../Base/Maybe/Type");
// Retrieves a value from the Map given a key.
// - m: The Map to search in.
// - k: The Bits key to look up.
// = The value associated with the key, wrapped in Maybe.
const $get = (m, k) => {
    switch (m.$) {
        case 'Node':
            switch (k.$) {
                case 'E':
                    return m.val;
                case 'O':
                    return (0, exports.$get)(m.lft, k.tail);
                case 'I':
                    return (0, exports.$get)(m.rgt, k.tail);
            }
        case 'Leaf':
            return Type_1.$None;
    }
};
exports.$get = $get;
const get = (m) => (k) => (0, exports.$get)(m, k);
exports.get = get;
