import { IO } from '../../Base/IO/Type';
import { String } from '../../Base/String/Type';
import * as readline from 'readline';

// Reads a line of input from the console.
// = A Promise that resolves to the input string.
export const $get_line: IO<String> = () => {
  return new Promise((resolve) => {
    const rl = readline.createInterface({
      input: process.stdin,
      output: process.stdout
    });
    rl.question('', (answer) => {
      rl.close();
      resolve(answer);
    });
  });
};

export const get_line: IO<String> = $get_line;
