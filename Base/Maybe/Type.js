"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Some = exports.$Some = exports.None = exports.$None = void 0;
exports.$None = { $: 'None' };
exports.None = exports.$None;
const $Some = (value) => ({ $: 'Some', value });
exports.$Some = $Some;
const Some = (value) => (0, exports.$Some)(value);
exports.Some = Some;
