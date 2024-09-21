import { IO } from '../../Base/IO/Type';
import { Bool } from '../../Base/String/Type';
import { String } from '../../Base/String/Type';
import * as fs from 'fs';

// Checks if the given path is a file.
// - path: The path to check.
// = A promise that resolves to true if the path is a file, false otherwise.
export const $is_file = (path: String): IO<Bool> => {
  return () => new Promise((resolve) => {
    fs.stat(path, (err, stats) => {
      if (err) {
        resolve(false);
      } else {
        resolve(stats.isFile());
      }
    });
  });
};

export const is_file = (path: String) => $is_file(path);

// NOTE: This implementation uses Node.js fs module.
// For browser environments, a different implementation would be needed.