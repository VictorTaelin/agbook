"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.eq = exports.$eq = void 0;
const $eq = (a, b) => {
    switch (a.$) {
        case 'LT':
            return b.$ === 'LT';
        case 'EQ':
            return b.$ === 'EQ';
        case 'GT':
            return b.$ === 'GT';
    }
};
exports.$eq = $eq;
const eq = (a) => (b) => (0, exports.$eq)(a, b);
exports.eq = eq;
// NOTE: Operator omitted: '_==_'.
