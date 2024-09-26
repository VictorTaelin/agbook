import { Maybe, $Some, $None } from '../../../../Base/Maybe/Maybe';
import { Term, $Lam, $App, $Var } from '../../../../Base/Parser/Examples/LambdaTerm/LambdaTerm';
import { $bind, bind } from '../../../../Base/Parser/Monad/bind';
import { $pure } from '../../../../Base/Parser/Monad/pure';
import { State } from '../../../../Base/Parser/State';
import { Parser } from '../../../../Base/Parser/Parser';
import { $consume } from '../../../../Base/Parser/consume';
import { $parse_name } from '../../../../Base/Parser/parse-name';
import { $peek_one } from '../../../../Base/Parser/peek-one';
import { $skip_trivia } from '../../../../Base/Parser/skip-trivia';
import { String } from '../../../../Base/String/String';

export const $parse: Parser<Term> = 
  $bind($skip_trivia, () =>
  $bind($peek_one, (one: Maybe<String>) => {
    switch (one.$) {
      case 'Some':
        switch (one.value) {
          case 'λ':
            return (
              $bind($consume('λ'), () =>
              $bind($parse_name, (name: String) =>
              $bind($parse, (body: Term) =>
              $pure($Lam(name, body))))));
          case '(':
            return (
              $bind($consume('('), () =>
              $bind($parse, (func: Term) =>
              $bind($parse, (argm: Term) =>
              $bind($consume(')'), () =>
              $pure($App(func, argm)))))));
          default:
            return (
              $bind($parse_name, (name: String) =>
              $pure($Var(name))));
        }
      case 'None':
        return (
          $bind($parse_name, (name: String) =>
          $pure($Var(name))));
    }
  }));

export const parse: Parser<Term> = (s: State) => $parse(s);
