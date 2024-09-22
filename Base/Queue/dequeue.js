"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.dequeue = exports.$dequeue = void 0;
const Type_1 = require("../../Base/Queue/Type");
const Type_2 = require("../../Base/List/Type");
const Type_3 = require("../../Base/Maybe/Type");
const Type_4 = require("../../Base/Pair/Type");
const reverse_1 = require("../../Base/List/reverse");
const $dequeue = (queue) => {
    switch (queue.front.$) {
        case '[]':
            switch (queue.back.$) {
                case '[]':
                    return Type_3.$None;
                default:
                    var reversed = (0, reverse_1.$reverse)(queue.back);
                    switch (reversed.$) {
                        case '[]':
                            return Type_3.$None;
                        case '::':
                            return (0, Type_3.$Some)((0, Type_4.$Pair)(reversed.head, (0, Type_1.$MkQueue)(reversed.tail, Type_2.$Nil)));
                    }
            }
        case '::':
            return (0, Type_3.$Some)((0, Type_4.$Pair)(queue.front.head, (0, Type_1.$MkQueue)(queue.front.tail, queue.back)));
    }
};
exports.$dequeue = $dequeue;
const dequeue = (queue) => (0, exports.$dequeue)(queue);
exports.dequeue = dequeue;
