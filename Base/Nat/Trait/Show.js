"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.show_nat = void 0;
const show_1 = require("../../../Base/Nat/show");
// Show instance for Nat
exports.show_nat = {
    to_string: show_1.$show
};
// NOTE: Using snake_case for TypeScript names as per guidelines
// NOTE: Imported 'show' as 'nat_show' to avoid naming conflicts
