"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.mkdir = exports.$mkdir = void 0;
const Type_1 = require("../../Base/Unit/Type");
const fs = __importStar(require("fs/promises"));
// Creates a directory with the given name.
// - path: The path of the directory to create.
// = An IO action that creates the directory and returns Unit.
const $mkdir = (path) => async () => {
    await fs.mkdir(path, { recursive: true });
    return Type_1.$unit;
};
exports.$mkdir = $mkdir;
const mkdir = (path) => (0, exports.$mkdir)(path);
exports.mkdir = mkdir;
// NOTE: Using Node.js fs.promises API for asynchronous directory creation.
// The 'recursive: true' option is used to create parent directories if they don't exist,
// which is closer to the behavior of most mkdir implementations.
