import * as readline from 'readline';
import { IO } from '../../Base/IO/Type';
import { String } from '../../Base/String/Type';

// Reads a line of input from the console.
// = An IO action that, when executed, resolves to the input string.
export const $get_line: IO<String> = () => new Promise((resolve) => {
  const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });
  rl.question('', (answer) => {
    rl.close();
    resolve(answer);
  });
});

export const get_line: IO<String> = $get_line;