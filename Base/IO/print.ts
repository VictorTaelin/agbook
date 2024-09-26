import { IO } from '../../Base/IO/IO';
import { String } from '../../Base/String/String';
import { Unit, $unit } from '../../Base/Unit/Unit';

// Prints a string to the console.
// - s: The string to be printed.
// = An IO action that prints the string and returns Unit.
export const $print = (s: String): IO<Unit> => {
  return () => {
    console.log(s);
    return Promise.resolve($unit);
  };
};

export const print = (s: String) => $print(s);

// NOTE: In TypeScript, we implement print as a function that returns an IO action.
// This matches the IO type we defined earlier (a function returning a Promise).
// When executed, it logs the string to the console and then resolves with the Unit value.