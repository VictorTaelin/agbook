module Base.IO.get-line where

open import Base.IO.Type
open import Base.String.Type

postulate get-line : IO String

{-# FOREIGN GHC import qualified Data.Text.IO as Text #-}
{-# FOREIGN GHC import qualified Control.Exception   #-}

{-# COMPILE GHC get-line = Text.getLine #-}

-- TODO: in the TypeScript version, use something like:

-- const readline = require('readline');

-- function ask(question) {
  -- return new Promise((resolve) => {
    -- const rl = readline.createInterface({
      -- input: process.stdin,
      -- output: process.stdout
    -- });
    -- rl.question(question, (answer) => {
      -- rl.close();
      -- resolve(answer);
    -- });
  -- });
-- }

-- function calculateBMI(weight, height) {
  -- return weight / (height * height);
-- }

-- async function main() {
  -- const weight = await ask('Enter your weight in kg: ');
  -- const height = await ask('Enter your height in meters: ');
  -- const bmi = calculateBMI(parseFloat(weight), parseFloat(height));
  -- console.log(`Your BMI is: ${bmi.toFixed(2)}`);
-- }

-- main();
