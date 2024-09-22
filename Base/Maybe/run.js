"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.run = exports.$run = void 0;
// Runs a Maybe monad, returning a default value if it is None.
// - d: The default value to return if ma is None.
// - m: The Maybe value to run.
// = The value inside ma if it's Some, otherwise the default value.
const $run = (d, m) => {
    switch (m.$) {
        case 'None':
            return d;
        case 'Some':
            return m.value;
    }
};
exports.$run = $run;
const run = (d) => (m) => (0, exports.$run)(d, m);
exports.run = run;
