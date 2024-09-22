"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.main = exports.$main = exports.loop = void 0;
const print_1 = require("./Base/IO/print");
const bind_1 = require("./Base/IO/Monad/bind");
const Type_1 = require("./Base/Nat/Type");
const add_1 = require("./Base/Nat/add");
const show_1 = require("./Base/Nat/show");
const append_1 = require("./Base/String/append");
const $loop = (i) => {
    return (0, bind_1.$bind)((0, print_1.$print)((0, append_1.$append)("Hello ", (0, show_1.$show)(i))), () => $loop((0, add_1.$add)(i, 1n)));
};
const loop = (i) => $loop(i);
exports.loop = loop;
exports.$main = $loop(Type_1.$Zero);
const main = () => exports.$main;
exports.main = main;
// To run the main function:
(0, exports.$main)().catch(error => console.error("An error occurred:", error));
