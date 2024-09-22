import { IO } from './Base/IO/Type';
import { Unit, $unit } from './Base/Unit/Type';
import { $print } from './Base/IO/print';
import { $bind } from './Base/IO/Monad/bind';
import { Nat, $Zero } from './Base/Nat/Type';
import { $add } from './Base/Nat/add';
import { $show } from './Base/Nat/show';
import { $append } from './Base/String/append';

const $loop = (i: Nat): IO<Unit> => {
  return $bind(
    $print($append("Hello ", $show(i))),
    () => $loop($add(i, 1n))
  );
};

export const loop = (i: Nat) => $loop(i);

export const $main: IO<Unit> = $loop($Zero);
export const  main = () => $main;

// To run the main function:
$main().catch(error => console.error("An error occurred:", error));
