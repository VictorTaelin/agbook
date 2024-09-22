"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Leaf = exports.$Leaf = exports.Node = exports.$Node = void 0;
const $Node = (val, lft, rgt) => ({ $: 'Node', val, lft, rgt });
exports.$Node = $Node;
const Node = (val) => (lft) => (rgt) => (0, exports.$Node)(val, lft, rgt);
exports.Node = Node;
exports.$Leaf = { $: 'Leaf' };
exports.Leaf = exports.$Leaf;
