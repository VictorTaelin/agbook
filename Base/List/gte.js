"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.gte = exports.$gte = void 0;
const Type_1 = require("../../Base/Bool/Type");
const Ord_1 = require("../../Base/Trait/Ord");
const $gte = (O, xs, ys) => {
    switch (xs.$) {
        case '[]':
            switch (ys.$) {
                case '[]':
                    return Type_1.$True;
                case '::':
                    return Type_1.$False;
            }
        case '::':
            switch (ys.$) {
                case '[]':
                    return Type_1.$True;
                case '::':
                    var x = xs.head;
                    var x_xs = xs.tail;
                    var y = ys.head;
                    var y_ys = ys.tail;
                    if ((0, Ord_1.$gt)(O, x, y)) {
                        return Type_1.$True;
                    }
                    else if ((0, Ord_1.$lt)(O, x, y)) {
                        return Type_1.$False;
                    }
                    else {
                        return (0, exports.$gte)(O, x_xs, y_ys);
                    }
            }
    }
};
exports.$gte = $gte;
const gte = (O) => (xs) => (ys) => (0, exports.$gte)(O, xs, ys);
exports.gte = gte;
// NOTE: Operator omitted: '_>=_'.
