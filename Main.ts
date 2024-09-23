import { Nat, IO, Unit, String } from './Base/ALL';

const $loop = (i: Nat): IO<Unit> => async () => {
  await IO.$print(String.$append("Hello ", Nat.$show(i)))();
  return $loop(Nat.$add(i, 1n))();
};

export const $main: IO<Unit> = $loop(0n);
export const  main: IO<Unit> = $main;

// Run the main function if this is the entry point
if (require.main === module) {
  main().catch(console.error);
}
