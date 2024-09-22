"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.set_snd = exports.$set_snd = void 0;
// Sets the second element of a pair to a new value.
// - z: The new value for the second element.
// - pair: The original pair.
// = A new pair with the same first element and z as the second element.
const $set_snd = (z, pair) => {
    const [x, _] = pair;
    return [x, z];
};
exports.$set_snd = $set_snd;
const set_snd = (z) => (pair) => (0, exports.$set_snd)(z, pair);
exports.set_snd = set_snd;
