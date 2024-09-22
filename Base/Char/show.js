"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.$$show = exports.show = exports.$show = void 0;
const append_1 = require("../../Base/String/append");
const from_char_1 = require("../../Base/String/from-char");
const $show = (c) => {
    return (0, append_1.$append)("'", (0, append_1.$append)((0, from_char_1.$from_char)(c), "'"));
};
exports.$show = $show;
const show = (c) => (0, exports.$show)(c);
exports.show = show;
// NOTE: For efficiency, we can use native string concatenation
const $$show = (c) => `'${c}'`;
exports.$$show = $$show;
