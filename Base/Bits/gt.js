"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.gt = exports.$gt = void 0;
const Type_1 = require("../../Base/Bool/Type");
const $gt = (a, b) => {
    switch (a.$) {
        case 'E':
            return Type_1.False;
        case 'O':
            switch (b.$) {
                case 'E':
                    return Type_1.True;
                case 'O':
                    return (0, exports.$gt)(a.tail, b.tail);
                case 'I':
                    return Type_1.False;
            }
        case 'I':
            switch (b.$) {
                case 'E':
                    return Type_1.True;
                case 'O':
                    return Type_1.True;
                case 'I':
                    return (0, exports.$gt)(a.tail, b.tail);
            }
    }
};
exports.$gt = $gt;
const gt = (a) => (b) => (0, exports.$gt)(a, b);
exports.gt = gt;
// NOTE: Operator omitted: '_>_'.
