"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.default_ = exports.$default = exports.show = exports.$show = void 0;
// Function to convert a value to a string using its Show instance
const $show = (show_a, x) => show_a.to_string(x);
exports.$show = $show;
const show = (show_a) => (x) => (0, exports.$show)(show_a, x);
exports.show = show;
// Helper function to create a default Show instance
const $default = (show_impl) => ({
    to_string: show_impl
});
exports.$default = $default;
const default_ = (show_impl) => (0, exports.$default)(show_impl);
exports.default_ = default_;
// NOTE: 'default' is a reserved keyword in TypeScript, so we use 'default_' instead
// NOTE: Using snake_case for TypeScript names as per guidelines
