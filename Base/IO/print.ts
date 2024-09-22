import { IO } from '../../Base/IO/Type';
import { String } from '../../Base/String/Type';
import { Unit, $unit } from '../../Base/Unit/Type';

// Prints a string to the console.
// - s: The string to be printed.
// = An IO action that prints the string and returns Unit.
export const $print = (s: String): IO<Unit> => {
  return () => Promise.resolve(console.log(s)).then(() => $unit);
};

export const print = (s: String) => $print(s);

// NOTE: In TypeScript, we implement print as a function that returns a Promise.
// This matches the IO type we defined earlier and allows for asynchronous operations.
// The function logs the string to the console and then resolves with the Unit value.
