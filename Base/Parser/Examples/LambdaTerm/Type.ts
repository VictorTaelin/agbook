import { String } from '../../../../Base/String/Type';

export type Term
  = { $: 'Lam', var_: String, body: Term }
  | { $: 'App', func: Term, arg: Term }
  | { $: 'Var', name: String };

export const $Lam = (var_: String, body: Term): Term => ({ $: 'Lam', var_, body });
export const  Lam = (var_: String) => (body: Term) => $Lam(var_, body);

export const $App = (func: Term, arg: Term): Term => ({ $: 'App', func, arg });
export const  App = (func: Term) => (arg: Term) => $App(func, arg);

export const $Var = (name: String): Term => ({ $: 'Var', name });
export const  Var = (name: String) => $Var(name);