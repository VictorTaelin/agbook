// FIXME: avoid loops. provide better instructions for monadic files

#!/usr/bin/env bun

import { readFile, writeFile, stat } from 'fs/promises';
import { join, dirname } from 'path';
import { exec, spawn } from 'child_process';
import { promisify } from 'util';

const exec_async = promisify(exec);

// ANSI escape codes for text formatting
const BOLD = '\x1b[1m';
const RESET = '\x1b[0m';
const BLUE = '\x1b[34m';
const DIM = '\x1b[2m';
const GRAY = '\x1b[90m';
const RED = '\x1b[31m';

// Function to compile a single Agda file to TypeScript
async function compile_file(agda_file, indent_level = 0) {
  const indent = '  '.repeat(indent_level);
  console.log(`${BOLD}Compiling ${agda_file}:${RESET}`);

  const ts_file = agda_file.replace('.agda', '.ts');
  
  try {
    // Check if corresponding .ts file exists
    await stat(ts_file);
    
    // If it exists, check for errors
    try {
      console.log(`${indent}- Checking existing TypeScript file`);
      const { stdout, stderr } = await exec_async(`tsc --noEmit --target esnext --skipLibCheck ${ts_file}`);
      console.log(`${indent}- ${ts_file} is already compiled and well-typed. Skipping.`);
      return;
    } catch (error) {
      console.log(`${indent}- Found errors in existing TypeScript file. Recompiling.`);
      console.error(`${RED}${error.stdout}${RESET}`);
      // If there's an error, append it to the file
      const current_content = await readFile(ts_file, 'utf-8');
      const new_content = `${current_content}\n\n// TSC Error: ${error.stdout}`;
      await writeFile(ts_file, new_content);
    }
  } catch (error) {
    console.log(`${indent}- No existing TypeScript file found. Proceeding with compilation.`);
  }

  // Compile using agda2ts
  console.log(`${indent}- Running agda2ts`);
  return new Promise((resolve) => {
    const agda2ts = spawn('agda2ts', [agda_file]);
    let stdout = '';
    let stderr = '';

    agda2ts.stdout.on('data', (data) => {
      const chunk = data.toString();
      stdout += chunk;
      process.stdout.write(`${GRAY}${BLUE}${chunk}${RESET}`);
    });

    agda2ts.stderr.on('data', (data) => {
      const chunk = data.toString();
      stderr += chunk;
      process.stderr.write(`${GRAY}${BLUE}${chunk}${RESET}`);
    });

    agda2ts.on('close', async (code) => {
      const full_output = stdout + stderr;
      if (full_output.includes('ERROR: Missing dependencies')) {
        console.log(`${indent}- Found missing dependencies. Resolving...`);
        // Extract and compile dependencies
        const dependencies = full_output.split('\n')
          .filter(line => line.trim().startsWith('-'))
          .map(line => line.trim().slice(2));
        
        for (const dep of dependencies) {
          await compile_file(dep.replace('.ts', '.agda'), indent_level + 1);
        }
        
        // Try compiling again after resolving dependencies
        console.log(`${indent}- Retrying compilation after resolving dependencies`);
        await compile_file(agda_file, indent_level);
        resolve();
      } else if (code === 0) {
        console.log(`${indent}- Successfully compiled ${agda_file}`);
        // Recursively check the newly compiled file
        await compile_file(agda_file, indent_level);
        resolve();
      } else {
        console.error(`${RED}${indent}- Error compiling ${agda_file}${RESET}`);
        console.error(`${RED}${indent}  Compilation failed, but continuing with other files.${RESET}`);
        resolve();
      }
    });
  });
}

// Main function to compile Base/ALL.agda
async function compile_all() {
  const base_all_file = 'Base/ALL.agda';
  try {
    await compile_file(base_all_file);
  } catch (error) {
    console.error(`${RED}Error processing ${base_all_file}: ${error.message}${RESET}`);
  }
}

// Run the compilation process
compile_all().then(() => {
  console.log(`${BOLD}Compilation process completed.${RESET}`);
}).catch(error => {
  console.error(`${RED}${BOLD}Fatal error in compilation process: ${error.message}${RESET}`);
});
