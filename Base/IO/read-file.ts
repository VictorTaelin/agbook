import { String } from '../../Base/String/Type';
import { IO } from '../../Base/IO/Type';
import * as fs from 'fs/promises';

// Reads a file and returns its contents as a string.
// - path: The path to the file to be read.
// = An IO action that, when executed, will return the contents of the file as a string.
export const $read_file = (path: String): IO<String> => {
  return () => fs.readFile(path, 'utf8');
};

export const read_file = (path: String) => $read_file(path);

// NOTE: Using fs/promises for asynchronous file reading in Node.js environment.
// NOTE: Error handling is implicit in the returned Promise.
// NOTE: The IO action is now wrapped in a function to make it lazy, as per the recent IO type change.