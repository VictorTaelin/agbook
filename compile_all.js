#!/usr/bin/env bun

//import { readFile, writeFile, stat } from 'fs/promises';
//import { join, dirname } from 'path';
//import { exec, spawn } from 'child_process';
//import { promisify } from 'util';

//const exec_async = promisify(exec);

//// Define the target language (ts or kind)
//const TARGET_LANG = 'kind';

//// ANSI escape codes for text formatting
//const BOLD = '\x1b[1m';
//const RESET = '\x1b[0m';
//const BLUE = '\x1b[34m';
//const DIM = '\x1b[2m';
//const GRAY = '\x1b[90m';
//const RED = '\x1b[31m';

//// Object to track compilation attempts
//const compilationAttempts = {};

//// Function to compile a single Agda file to the target language
//async function compile_file(agda_file, indent_level = 0) {
  //const indent = '  '.repeat(indent_level);
  //console.log(`${BOLD}Compiling ${agda_file}:${RESET}`);

  //// Check if the file has been attempted 3 or more times
  //if (compilationAttempts[agda_file] >= 3) {
    //console.error(`${RED}${indent}- Skipping ${agda_file}: Maximum compilation attempts reached.${RESET}`);
    //return false;
  //}

  //// Increment the compilation attempt count
  //compilationAttempts[agda_file] = (compilationAttempts[agda_file] || 0) + 1;

  //const target_file = agda_file.replace('.agda', TARGET_LANG === 'ts' ? '.ts' : '.kind');
  
  //try {
    //// Check if corresponding target file exists
    //await stat(target_file);
    
    //// If it exists, check for errors
    //try {
      //console.log(`${indent}- Checking existing ${TARGET_LANG.toUpperCase()} file`);
      //if (TARGET_LANG === 'ts') {
        //await exec_async(`tsc --noEmit --target esnext --skipLibCheck ${target_file}`);
      //} else {
        //await exec_async(`kind check ${target_file}`);
      //}
      //console.log(`${indent}- ${target_file} is already compiled and well-typed. Skipping.`);
      //return true;
    //} catch (error) {
      //console.log(`${indent}- Found errors in existing ${TARGET_LANG.toUpperCase()} file. Recompiling.`);
      //console.error(`${RED}${error.stdout}${RESET}`);
      //// If there's an error, append it to the file
      //const current_content = await readFile(target_file, 'utf-8');
      //const new_content = `${current_content}\n\n// ${TARGET_LANG.toUpperCase()} Error: ${error.stdout}`;
      //await writeFile(target_file, new_content);
    //}
  //} catch (error) {
    //console.log(`${indent}- No existing ${TARGET_LANG.toUpperCase()} file found. Proceeding with compilation.`);
  //}

  //// Compile using agda2ts or agda2kind
  //console.log(`${indent}- Running agda2${TARGET_LANG}`);
  //return new Promise((resolve) => {
    //const agda2lang = spawn(`agda2${TARGET_LANG}`, [agda_file]);
    //let stdout = '';
    //let stderr = '';

    //agda2lang.stdout.on('data', (data) => {
      //const chunk = data.toString();
      //stdout += chunk;
      //process.stdout.write(`${GRAY}${BLUE}${chunk}${RESET}`);
    //});

    //agda2lang.stderr.on('data', (data) => {
      //const chunk = data.toString();
      //stderr += chunk;
      //process.stderr.write(`${GRAY}${BLUE}${chunk}${RESET}`);
    //});

    //agda2lang.on('close', async (code) => {
      //const full_output = stdout + stderr;
      //if (full_output.includes('ERROR: Missing dependencies')) {
        //console.log(`${indent}- Found missing dependencies. Resolving...`);
        //// Extract and compile dependencies
        //const dependencies = full_output.split('\n')
          //.filter(line => line.trim().startsWith('-'))
          //.map(line => line.trim().slice(2));
        
        //let all_deps_compiled = true;
        //for (const dep of dependencies) {
          //const dep_result = await compile_file(dep.replace(`.${TARGET_LANG}`, '.agda'), indent_level + 1);
          //if (!dep_result) {
            //all_deps_compiled = false;
          //}
        //}
        
        //if (all_deps_compiled) {
          //// Try compiling again after resolving dependencies
          //console.log(`${indent}- Retrying compilation after resolving dependencies`);
          //resolve(await compile_file(agda_file, indent_level));
        //} else {
          //console.error(`${RED}${indent}- Skipping ${agda_file}: One or more dependencies failed to compile.${RESET}`);
          //resolve(false);
        //}
      //} else if (code === 0) {
        //console.log(`${indent}- Successfully compiled ${agda_file}`);
        //resolve(true);
      //} else {
        //console.error(`${RED}${indent}- Error compiling ${agda_file}${RESET}`);
        //console.error(`${RED}${indent}  Compilation failed, but continuing with other files.${RESET}`);
        //resolve(false);
      //}
    //});
  //});
//}

//// Main function to compile Base/ALL.agda
//async function compile_all() {
  //const base_all_file = 'Base/ALL.agda';
  //try {
    //const result = await compile_file(base_all_file);
    //if (!result) {
      //console.error(`${RED}Failed to compile ${base_all_file}${RESET}`);
    //}
  //} catch (error) {
    //console.error(`${RED}Error processing ${base_all_file}: ${error.message}${RESET}`);
  //}
//}

//// Run the compilation process
//compile_all().then(() => {
  //console.log(`${BOLD}Compilation process completed.${RESET}`);
//}).catch(error => {
  //console.error(`${RED}${BOLD}Fatal error in compilation process: ${error.message}${RESET}`);
//});


//QUESTION: is the script above checking the file after it is generated? to make sure it was generated correctly?


//Yes, the script is checking the generated file after compilation to ensure it was generated correctly. Here's how it does this:

//1. After compiling an Agda file, it checks if the corresponding target file (TypeScript or Kind) exists.

//2. If the target file exists, it attempts to type-check it:
   //- For TypeScript, it uses `tsc --noEmit --target esnext --skipLibCheck ${target_file}`
   //- For Kind, it uses `kind check ${target_file}`

//3. If the type-checking passes without errors, it considers the file correctly generated and skips recompilation.

//4. If the type-checking fails, it logs the error, appends the error message to the target file, and proceeds with recompilation.

//This process helps ensure that the generated files are not only created but also well-typed according to their respective language's type system.

//where is it checking a generated file?


  //try {
    //// Check if corresponding target file exists
    //await stat(target_file);
    
    //// If it exists, check for errors
    //try {
      //console.log(`${indent}- Checking existing ${TARGET_LANG.toUpperCase()} file`);
      //if (TARGET_LANG === 'ts') {
        //await exec_async(`tsc --noEmit --target esnext --skipLibCheck ${target_file}`);
      //} else {
        //await exec_async(`kind check ${target_file}`);
      //}
      //console.log(`${indent}- ${target_file} is already compiled and well-typed. Skipping.`);
      //return true;
    //} catch (error) {
      //console.log(`${indent}- Found errors in existing ${TARGET_LANG.toUpperCase()} file. Recompiling.`);
      //console.error(`${RED}${error.stdout}${RESET}`);
      //// If there's an error, append it to the file
      //const current_content = await readFile(target_file, 'utf-8');
      //const new_content = `${current_content}\n\n// ${TARGET_LANG.toUpperCase()} Error: ${error.stdout}`;
      //await writeFile(target_file, new_content);
    //}
  //} catch (error) {
    //console.log(`${indent}- No existing ${TARGET_LANG.toUpperCase()} file found. Proceeding with compilation.`);
  //}

//but that occurs BEFORE compilation, not after?


//You're right. The script is not checking the file after it is generated to make sure it was generated correctly. The checking you've pointed out happens before compilation, to determine if an existing file needs to be recompiled. After the actual compilation process, there's no explicit verification of the newly generated file.

//If you wanted to add a post-compilation check, you would need to add code after the compilation process to verify the newly generated file. This could be done by adding a type-checking step similar to the pre-compilation check, but placed after the compilation has completed.


//I think that would be a mistake, since it would be repeated code. instead, what I think should happen is:

//- whenever a file is generated, we recursively attempt to generate it again. that is fine because, if it type-checks, then, we'll just skip it anyway.

//is this the current behavior? or not at all?


//The current behavior in the script does not include recursively attempting to generate a file again after it has been generated. The script only attempts to compile each file once, unless there are missing dependencies that need to be resolved first.

//To implement the behavior you're suggesting, you would need to modify the `compile_file` function to recursively call itself after a successful compilation. This would ensure that the newly generated file is checked and, if necessary, recompiled.

//However, it's important to note that this approach could potentially lead to infinite loops if not implemented carefully. You would need to add a mechanism to limit the number of recursive attempts or to detect when no changes are being made between compilations.

//we already have a mechanism to limit the compilation attempts of the same file to 3. but anyway, this will only happen if the generated file fails to check, which is the exact intended behavior.

//i agree the file above should be more modular, concise and well written though.

//please, rewrite it fully, implementing the feature we discussed, and making it cleaner, shorter and, maily, better organized.
//it also needs to be more consistent with variable names. always use snake_case, never use camelCase!

//do it now:


////#!/usr/bin/env bun

//import { readFile, writeFile, stat } from 'fs/promises'
//import { exec, spawn } from 'child_process'
//import { promisify } from 'util'

//const exec_async = promisify(exec)

//const TARGET_LANG = 'kind'
//const MAX_ATTEMPTS = 3

//const BOLD = '\x1b[1m'
//const RESET = '\x1b[0m'
//const BLUE = '\x1b[34m'
//const GRAY = '\x1b[90m'
//const RED = '\x1b[31m'

//const compilation_attempts = {}

//async function type_check_file(target_file) {
  //const command = TARGET_LANG === 'ts'
    //? `tsc --noEmit --target esnext --skipLibCheck ${target_file}`
    //: `kind check ${target_file}`
  
  //try {
    //await exec_async(command)
    //return true
  //} catch (error) {
    //console.error(`${RED}${error.stdout}${RESET}`)
    //return false
  //}
//}

//async function compile_file(agda_file, indent_level = 0) {
  //const indent = '  '.repeat(indent_level)
  //console.log(`${BOLD}Compiling ${agda_file}:${RESET}`)

  //if (compilation_attempts[agda_file] >= MAX_ATTEMPTS) {
    //console.error(`${RED}${indent}- Skipping ${agda_file}: Maximum compilation attempts reached.${RESET}`)
    //return false
  //}

  //compilation_attempts[agda_file] = (compilation_attempts[agda_file] || 0) + 1

  //const target_file = agda_file.replace('.agda', `.${TARGET_LANG}`)
  
  //try {
    //await stat(target_file)
    //console.log(`${indent}- Checking existing ${TARGET_LANG.toUpperCase()} file`)
    //if (await type_check_file(target_file)) {
      //console.log(`${indent}- ${target_file} is already compiled and well-typed. Skipping.`)
      //return true
    //}
    //console.log(`${indent}- Found errors in existing ${TARGET_LANG.toUpperCase()} file. Recompiling.`)
  //} catch (error) {
    //console.log(`${indent}- No existing ${TARGET_LANG.toUpperCase()} file found. Proceeding with compilation.`)
  //}

  //console.log(`${indent}- Running agda2${TARGET_LANG}`)
  //const compilation_result = await new Promise((resolve) => {
    //const agda2lang = spawn(`agda2${TARGET_LANG}`, [agda_file])
    //let stdout = ''
    //let stderr = ''

    //agda2lang.stdout.on('data', (data) => {
      //stdout += data.toString()
      //process.stdout.write(`${GRAY}${BLUE}${data.toString()}${RESET}`)
    //})

    //agda2lang.stderr.on('data', (data) => {
      //stderr += data.toString()
      //process.stderr.write(`${GRAY}${BLUE}${data.toString()}${RESET}`)
    //})

    //agda2lang.on('close', async (code) => {
      //const full_output = stdout + stderr
      //if (full_output.includes('ERROR: Missing dependencies')) {
        //console.log(`${indent}- Found missing dependencies. Resolving...`)
        //const dependencies = full_output.split('\n')
          //.filter(line => line.trim().startsWith('-'))
          //.map(line => line.trim().slice(2))
        
        //const all_deps_compiled = await Promise.all(dependencies.map(dep => 
          //compile_file(dep.replace(`.${TARGET_LANG}`, '.agda'), indent_level + 1)
        //)).then(results => results.every(Boolean))
        
        //if (all_deps_compiled) {
          //console.log(`${indent}- Retrying compilation after resolving dependencies`)
          //resolve(await compile_file(agda_file, indent_level))
        //} else {
          //console.error(`${RED}${indent}- Skipping ${agda_file}: One or more dependencies failed to compile.${RESET}`)
          //resolve(false)
        //}
      //} else if (code === 0) {
        //console.log(`${indent}- Successfully compiled ${agda_file}`)
        //resolve(true)
      //} else {
        //console.error(`${RED}${indent}- Error compiling ${agda_file}${RESET}`)
        //resolve(false)
      //}
    //})
  //})

  //if (compilation_result) {
    //console.log(`${indent}- Verifying generated file`)
    //return await compile_file(agda_file, indent_level)
  //}

  //return false
//}

//async function compile_all() {
  //const base_all_file = 'Base/ALL.agda'
  //try {
    //const result = await compile_file(base_all_file)
    //if (!result) {
      //console.error(`${RED}Failed to compile ${base_all_file}${RESET}`)
    //}
  //} catch (error) {
    //console.error(`${RED}Error processing ${base_all_file}: ${error.message}${RESET}`)
  //}
//}

//compile_all().then(() => {
  //console.log(`${BOLD}Compilation process completed.${RESET}`)
//}).catch(error => {
  //console.error(`${RED}${BOLD}Fatal error in compilation process: ${error.message}${RESET}`)
//})


//problem: seems like this is trying to compile all dependencies in parallel. that's the wrong behavior. it should compile files one at a time. fix this erratic behavior.
//write the COMPLETE corrected file below:

//#!/usr/bin/env bun

import { readFile, writeFile, stat } from 'fs/promises'
import { exec, spawn } from 'child_process'
import { promisify } from 'util'

const exec_async = promisify(exec)

const TARGET_LANG = 'kind'
const MAX_ATTEMPTS = 3

const BOLD = '\x1b[1m'
const RESET = '\x1b[0m'
const BLUE = '\x1b[34m'
const GRAY = '\x1b[90m'
const RED = '\x1b[31m'

const compilation_attempts = {}

async function type_check_file(target_file) {
  const command = TARGET_LANG === 'ts'
    ? `tsc --noEmit --target esnext --skipLibCheck ${target_file}`
    : `kind check ${target_file}`
  
  try {
    await exec_async(command)
    return true
  } catch (error) {
    console.error(`${RED}${error.stdout}${RESET}`)
    return false
  }
}

async function compile_file(agda_file, indent_level = 0) {
  const indent = '  '.repeat(indent_level)
  console.log(`${BOLD}Compiling ${agda_file}:${RESET}`)

  if (compilation_attempts[agda_file] >= MAX_ATTEMPTS) {
    console.error(`${RED}${indent}- Skipping ${agda_file}: Maximum compilation attempts reached.${RESET}`)
    return false
  }

  compilation_attempts[agda_file] = (compilation_attempts[agda_file] || 0) + 1

  const target_file = agda_file.replace('.agda', `.${TARGET_LANG}`)
  
  try {
    await stat(target_file)
    console.log(`${indent}- Checking existing ${TARGET_LANG.toUpperCase()} file`)
    if (await type_check_file(target_file)) {
      console.log(`${indent}- ${target_file} is already compiled and well-typed. Skipping.`)
      return true
    }
    console.log(`${indent}- Found errors in existing ${TARGET_LANG.toUpperCase()} file. Recompiling.`)
  } catch (error) {
    console.log(`${indent}- No existing ${TARGET_LANG.toUpperCase()} file found. Proceeding with compilation.`)
  }

  console.log(`${indent}- Running agda2${TARGET_LANG}`)
  const compilation_result = await new Promise((resolve) => {
    const agda2lang = spawn(`agda2${TARGET_LANG}`, [agda_file])
    let stdout = ''
    let stderr = ''

    agda2lang.stdout.on('data', (data) => {
      stdout += data.toString()
      process.stdout.write(`${GRAY}${BLUE}${data.toString()}${RESET}`)
    })

    agda2lang.stderr.on('data', (data) => {
      stderr += data.toString()
      process.stderr.write(`${GRAY}${BLUE}${data.toString()}${RESET}`)
    })

    agda2lang.on('close', async (code) => {
      const full_output = stdout + stderr
      if (full_output.includes('ERROR: Missing dependencies')) {
        console.log(`${indent}- Found missing dependencies. Resolving...`)
        const dependencies = full_output.split('\n')
          .filter(line => line.trim().startsWith('-'))
          .map(line => line.trim().slice(2))
        
        let all_deps_compiled = true
        for (const dep of dependencies) {
          const dep_result = await compile_file(dep.replace(`.${TARGET_LANG}`, '.agda'), indent_level + 1)
          if (!dep_result) {
            all_deps_compiled = false
            break
          }
        }
        
        if (all_deps_compiled) {
          console.log(`${indent}- Retrying compilation after resolving dependencies`)
          resolve(await compile_file(agda_file, indent_level))
        } else {
          console.error(`${RED}${indent}- Skipping ${agda_file}: One or more dependencies failed to compile.${RESET}`)
          resolve(false)
        }
      } else if (code === 0) {
        console.log(`${indent}- Successfully compiled ${agda_file}`)
        resolve(true)
      } else {
        console.error(`${RED}${indent}- Error compiling ${agda_file}${RESET}`)
        resolve(false)
      }
    })
  })

  if (compilation_result) {
    console.log(`${indent}- Verifying generated file`)
    return await compile_file(agda_file, indent_level)
  }

  return false
}

async function compile_all() {
  const base_all_file = 'Base/ALL.agda'
  try {
    const result = await compile_file(base_all_file)
    if (!result) {
      console.error(`${RED}Failed to compile ${base_all_file}${RESET}`)
    }
  } catch (error) {
    console.error(`${RED}Error processing ${base_all_file}: ${error.message}${RESET}`)
  }
}

compile_all().then(() => {
  console.log(`${BOLD}Compilation process completed.${RESET}`)
}).catch(error => {
  console.error(`${RED}${BOLD}Fatal error in compilation process: ${error.message}${RESET}`)
})

