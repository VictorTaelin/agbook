import { IO } from './Base/IO/Type';
import { Unit } from './Base/Unit/Type';
import { $print } from './Base/IO/print';
import { $seq } from './Base/IO/Monad/bind';

export const main: IO<Unit> = () =>
  $seq(
    $print("Hello, world!"),
    $print("Hello, world!")
  )();

// NOTE: In TypeScript, we don't have the 'do' notation like in Agda.
// Instead, we use the `$seq` function to chain IO actions.
// The main function returns a Promise that resolves after both print statements are executed.

// To run the main function:
main().then(() => console.log("Program finished"));
