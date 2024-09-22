"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.lt = exports.$lt = void 0;
const Type_1 = require("../../Base/Bool/Type");
const Ord_1 = require("../../Base/Trait/Ord");
const $lt = (O, xs, ys) => {
    switch (xs.$) {
        case '[]':
            switch (ys.$) {
                case '[]':
                    return Type_1.$False;
                case '::':
                    return Type_1.$True;
            }
        case '::':
            switch (ys.$) {
                case '[]':
                    return Type_1.$False;
                case '::':
                    var x_lt_y = (0, Ord_1.$lt)(O, xs.head, ys.head);
                    if (x_lt_y) {
                        return Type_1.$True;
                    }
                    else {
                        var x_gt_y = (0, Ord_1.$gt)(O, xs.head, ys.head);
                        if (x_gt_y) {
                            return Type_1.$False;
                        }
                        else {
                            return (0, exports.$lt)(O, xs.tail, ys.tail);
                        }
                    }
            }
    }
};
exports.$lt = $lt;
const lt = (O) => (xs) => (ys) => (0, exports.$lt)(O, xs, ys);
exports.lt = lt;
// NOTE: Operator omitted: '_<_'.
