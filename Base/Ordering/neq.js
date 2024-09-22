"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.neq = exports.$neq = void 0;
const $neq = (a, b) => {
    switch (a.$) {
        case 'LT':
            return b.$ !== 'LT';
        case 'EQ':
            return b.$ !== 'EQ';
        case 'GT':
            return b.$ !== 'GT';
    }
};
exports.$neq = $neq;
const neq = (a) => (b) => (0, exports.$neq)(a, b);
exports.neq = neq;
// NOTE: Operator omitted: '_!=_'.
