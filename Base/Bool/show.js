"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.show = exports.$show = exports.$$show = void 0;
const $$show = (b) => {
    if (b) {
        return "true";
    }
    else {
        return "false";
    }
};
exports.$$show = $$show;
// NOTE: Using native boolean to string conversion for efficiency.
const $show = (b) => b ? "true" : "false";
exports.$show = $show;
const show = (b) => (0, exports.$show)(b);
exports.show = show;
