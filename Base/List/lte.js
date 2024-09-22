"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.lte = exports.$lte = void 0;
const Type_1 = require("../../Base/Bool/Type");
const Ord_1 = require("../../Base/Trait/Ord");
const $lte = (O, xs, ys) => {
    switch (xs.$) {
        case '[]':
            return Type_1.$True;
        case '::':
            switch (ys.$) {
                case '[]':
                    return Type_1.$False;
                case '::':
                    var x = xs.head;
                    var x_xs = xs.tail;
                    var y = ys.head;
                    var y_ys = ys.tail;
                    if ((0, Ord_1.$lt)(O, x, y)) {
                        return Type_1.$True;
                    }
                    else if ((0, Ord_1.$gt)(O, x, y)) {
                        return Type_1.$False;
                    }
                    else {
                        return (0, exports.$lte)(O, x_xs, y_ys);
                    }
            }
    }
};
exports.$lte = $lte;
const lte = (O) => (xs) => (ys) => (0, exports.$lte)(O, xs, ys);
exports.lte = lte;
// NOTE: Operator omitted: '_<=_'.
