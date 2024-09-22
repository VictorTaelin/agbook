"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.from_list = exports.$from_list = exports.$$from_list = void 0;
// Converts a list of characters to a string.
// - cs: The input list of characters.
// = A string composed of the characters in the list.
const $$from_list = (cs) => {
    switch (cs.$) {
        case '[]':
            return '';
        case '::':
            return cs.head + (0, exports.$$from_list)(cs.tail);
    }
};
exports.$$from_list = $$from_list;
// NOTE: Using native string concatenation for efficiency.
const $from_list = (cs) => {
    var result = '';
    var current = cs;
    while (current.$ === '::') {
        result += current.head;
        current = current.tail;
    }
    return result;
};
exports.$from_list = $from_list;
const from_list = (cs) => (0, exports.$from_list)(cs);
exports.from_list = from_list;
