"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.gt = exports.$gt = exports.$$gt = void 0;
const Type_1 = require("../../Base/Bool/Type");
const $$gt = (x, y) => {
    if (x === 0n) {
        return Type_1.False;
    }
    else if (y === 0n) {
        return Type_1.True;
    }
    else {
        var x_ = x - 1n;
        var y_ = y - 1n;
        return (0, exports.$$gt)(x_, y_);
    }
};
exports.$$gt = $$gt;
// NOTE: Using native BigInt comparison for efficiency
const $gt = (x, y) => x > y;
exports.$gt = $gt;
const gt = (x) => (y) => x > y;
exports.gt = gt;
// NOTE: Operator omitted: '_>_'
