"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.inits = exports.$inits = void 0;
const Type_1 = require("../../Base/List/Type");
const map_1 = require("../../Base/List/map");
const singleton_1 = require("../../Base/List/singleton");
// Returns all initial segments of a list, shortest first.
// - xs: The input list.
// = A list of lists, containing all initial segments of xs.
const $inits = (xs) => {
    const tail = (xs) => {
        switch (xs.$) {
            case '[]':
                return Type_1.$Nil;
            case '::':
                return (0, Type_1.$Cons)((0, singleton_1.$singleton)(xs.head), (0, map_1.$map)((ys) => (0, Type_1.$Cons)(xs.head, ys), tail(xs.tail)));
        }
    };
    return (0, Type_1.$Cons)(Type_1.$Nil, tail(xs));
};
exports.$inits = $inits;
const inits = (xs) => (0, exports.$inits)(xs);
exports.inits = inits;
