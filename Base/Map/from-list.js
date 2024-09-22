"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.from_list = exports.$from_list = void 0;
const empty_1 = require("../../Base/Map/empty");
const set_1 = require("../../Base/Map/set");
const foldr_1 = require("../../Base/List/foldr");
// Converts a list of key-value pairs to a Map.
// - pairs: A list of key-value pairs.
// = A Map containing all the key-value pairs from the input list.
const $from_list = (pairs) => {
    const insert = (pair, m) => {
        return (0, set_1.$set)(m, pair[0], pair[1]);
    };
    return (0, foldr_1.$foldr)(insert, (0, empty_1.$empty)(), pairs);
};
exports.$from_list = $from_list;
const from_list = (pairs) => (0, exports.$from_list)(pairs);
exports.from_list = from_list;
