"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.split_chunks = exports.$split_chunks = void 0;
const Type_1 = require("../../Base/List/Type");
const split_at_1 = require("../../Base/Bits/split-at");
// Collects Bits into a list of Bits, each with length `d`.
const $split_chunks = (d, bits) => {
    if (d === 0n) {
        return Type_1.$Nil;
    }
    if (bits.$ === 'E') {
        return Type_1.$Nil;
    }
    var split = (0, split_at_1.$split_at)(d, bits);
    var collected = split[0];
    var rest = split[1];
    if (rest.$ === 'E') {
        return (0, Type_1.$Cons)(collected, Type_1.$Nil);
    }
    else {
        return (0, Type_1.$Cons)(collected, (0, exports.$split_chunks)(d, rest));
    }
};
exports.$split_chunks = $split_chunks;
const split_chunks = (d) => (bits) => (0, exports.$split_chunks)(d, bits);
exports.split_chunks = split_chunks;
// NOTE: This function is marked as TERMINATING in Agda.
// In TypeScript, we don't have a direct equivalent for this annotation,
// so we're implementing it as a regular recursive function.
// Care should be taken to ensure it terminates in all cases.
