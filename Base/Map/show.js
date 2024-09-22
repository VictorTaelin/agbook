"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.show = exports.$show = void 0;
const append_1 = require("../../Base/String/append");
const $show = (f, map) => {
    switch (map.$) {
        case 'Leaf':
            return "_";
        case 'Node':
            switch (map.val.$) {
                case 'None':
                    return (0, append_1.$append)("#[", (0, append_1.$append)((0, exports.$show)(f, map.lft), (0, append_1.$append)(" ", (0, append_1.$append)((0, exports.$show)(f, map.rgt), "]"))));
                case 'Some':
                    return (0, append_1.$append)("#", (0, append_1.$append)(f(map.val.value), (0, append_1.$append)("[", (0, append_1.$append)((0, exports.$show)(f, map.lft), (0, append_1.$append)(" ", (0, append_1.$append)((0, exports.$show)(f, map.rgt), "]"))))));
            }
    }
};
exports.$show = $show;
const show = (f) => (map) => (0, exports.$show)(f, map);
exports.show = show;
