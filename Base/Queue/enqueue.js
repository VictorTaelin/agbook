"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.enqueue = exports.$enqueue = void 0;
const Type_1 = require("../../Base/Queue/Type");
const Type_2 = require("../../Base/List/Type");
const $enqueue = (queue, a) => {
    return (0, Type_1.$MkQueue)(queue.front, (0, Type_2.$Cons)(a, queue.back));
};
exports.$enqueue = $enqueue;
const enqueue = (queue) => (a) => (0, exports.$enqueue)(queue, a);
exports.enqueue = enqueue;
