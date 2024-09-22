"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.zip_cons = exports.$zip_cons = void 0;
const Type_1 = require("../../Base/List/Type");
const map_1 = require("../../Base/List/map");
// Helper function to implement zip-cons.
// - xs: The list to be zipped with.
// - yss: The list of lists to zip with xs.
// = A new list of lists where each element of xs is prepended to the corresponding list in yss.
const $zip_cons = (xs, yss) => {
    switch (xs.$) {
        case '[]':
            return yss;
        case '::':
            switch (yss.$) {
                case '[]':
                    return (0, map_1.$map)((y) => (0, Type_1.$Cons)(y, Type_1.$Nil), xs);
                case '::':
                    return (0, Type_1.$Cons)((0, Type_1.$Cons)(xs.head, yss.head), (0, exports.$zip_cons)(xs.tail, yss.tail));
            }
    }
};
exports.$zip_cons = $zip_cons;
const zip_cons = (xs) => (yss) => (0, exports.$zip_cons)(xs, yss);
exports.zip_cons = zip_cons;
