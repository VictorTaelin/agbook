"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.values = exports.$values = void 0;
const Type_1 = require("../../Base/List/Type");
const append_1 = require("../../Base/List/append");
// Converts a Map to a List of the stored values.
// None values are skipped.
// - m: The input Map.
// = A list with the values stored in the Map.
const $values = (m) => {
    switch (m.$) {
        case 'Node':
            switch (m.val.$) {
                case 'None':
                    return (0, append_1.$append)((0, exports.$values)(m.lft), (0, exports.$values)(m.rgt));
                case 'Some':
                    return (0, Type_1.$Cons)(m.val.value, (0, append_1.$append)((0, exports.$values)(m.lft), (0, exports.$values)(m.rgt)));
            }
        case 'Leaf':
            return Type_1.$Nil;
    }
};
exports.$values = $values;
const values = (m) => (0, exports.$values)(m);
exports.values = values;
