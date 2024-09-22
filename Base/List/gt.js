"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.gt = exports.$gt = void 0;
const Type_1 = require("../../Base/Bool/Type");
const $gt = (O, xs, ys) => {
    switch (xs.$) {
        case '[]':
            switch (ys.$) {
                case '[]':
                    return Type_1.$False;
                case '::':
                    return Type_1.$False;
            }
        case '::':
            switch (ys.$) {
                case '[]':
                    return Type_1.$True;
                case '::':
                    var x_gt_y = O.gt(xs.head, ys.head);
                    if (x_gt_y) {
                        return Type_1.$True;
                    }
                    else {
                        var x_lt_y = O.lt(xs.head, ys.head);
                        if (x_lt_y) {
                            return Type_1.$False;
                        }
                        else {
                            return (0, exports.$gt)(O, xs.tail, ys.tail);
                        }
                    }
            }
    }
};
exports.$gt = $gt;
const gt = (O) => (xs) => (ys) => (0, exports.$gt)(O, xs, ys);
exports.gt = gt;
// NOTE: Operator omitted: '_>_'.
