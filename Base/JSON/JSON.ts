import { Bool } from '../../Base/Bool/Bool';
import { F64 } from '../../Base/F64/F64';
import { String } from '../../Base/String/String';
import { List } from '../../Base/List/List';
import { Pair } from '../../Base/Pair/Pair';

// Represents a JSON value.
export type JSON
  = { $: 'JNull' }
  | { $: 'JBool', value: Bool }
  | { $: 'JNumber', value: F64 }
  | { $: 'JString', value: String }
  | { $: 'JArray', value: List<JSON> }
  | { $: 'JObject', value: List<Pair<String, JSON>> };

export const $JNull: JSON = { $: 'JNull' };
export const  JNull: JSON = $JNull;

export const $JBool = (value: Bool): JSON => ({ $: 'JBool', value });
export const  JBool = (value: Bool) => $JBool(value);

export const $JNumber = (value: F64): JSON => ({ $: 'JNumber', value });
export const  JNumber = (value: F64) => $JNumber(value);

export const $JString = (value: String): JSON => ({ $: 'JString', value });
export const  JString = (value: String) => $JString(value);

export const $JArray = (value: List<JSON>): JSON => ({ $: 'JArray', value });
export const  JArray = (value: List<JSON>) => $JArray(value);

export const $JObject = (value: List<Pair<String, JSON>>): JSON => ({ $: 'JObject', value });
export const  JObject = (value: List<Pair<String, JSON>>) => $JObject(value);
