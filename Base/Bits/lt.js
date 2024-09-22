"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.lt = exports.$lt = void 0;
const Type_1 = require("../../Base/Bool/Type");
const $lt = (a, b) => {
    switch (a.$) {
        case 'E':
            switch (b.$) {
                case 'E':
                    return Type_1.False;
                case 'O':
                case 'I':
                    return Type_1.True;
            }
        case 'O':
            switch (b.$) {
                case 'E':
                    return Type_1.False;
                case 'O':
                    return (0, exports.$lt)(a.tail, b.tail);
                case 'I':
                    return Type_1.True;
            }
        case 'I':
            switch (b.$) {
                case 'E':
                case 'O':
                    return Type_1.False;
                case 'I':
                    return (0, exports.$lt)(a.tail, b.tail);
            }
    }
};
exports.$lt = $lt;
const lt = (a) => (b) => (0, exports.$lt)(a, b);
exports.lt = lt;
// NOTE: Operator omitted: '_<_'.
