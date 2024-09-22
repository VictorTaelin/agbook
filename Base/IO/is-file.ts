import { IO } from '../../Base/IO/Type';
import { String } from '../../Base/String/Type';
import { Bool } from '../../Base/Bool/Type';
import * as fs from 'fs/promises';

// Checks if a file exists at the given path.
// - path: The path to check.
// = A Promise that resolves to true if the file exists, false otherwise.
export const $is_file = (path: String): IO<Bool> => async () => {
  try {
    const stats = await fs.stat(path);
    return stats.isFile();
  } catch (error) {
    return false;
  }
};

export const is_file = (path: String) => $is_file(path);

// NOTE: Using Node.js fs/promises module to check file existence asynchronously.
// This mimics the behavior of the Haskell 'doesFileExist' function.
