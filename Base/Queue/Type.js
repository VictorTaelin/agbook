"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.MkQueue = exports.$MkQueue = void 0;
const $MkQueue = (front, back) => ({
    $: 'MkQueue',
    front,
    back
});
exports.$MkQueue = $MkQueue;
const MkQueue = (front) => (back) => (0, exports.$MkQueue)(front, back);
exports.MkQueue = MkQueue;
