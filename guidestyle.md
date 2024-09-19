# Agda Guidestyle

## 1. Uso do `with`:

- Preferir o uso do `with` em vez do `case of` ou `if` para pattern matching.
- O `with` é mais poderoso e expressivo, especialmente para tipos dependentes.
- Sintaxe do `with`:

```agda
function-name args with expression
... | pattern1 = result1
... | pattern2 = result2
```

## 2. Tipos dependentes:

- Usar tipos dependentes quando apropriado para aumentar a expressividade e segurança do código.
- O tipo Σ (sigma) é usado como um par dependente.
- Exemplo: criar um tipo para listas ordenadas.

## 3. Unicode:

- Manter o uso de caracteres Unicode para λ (lambda), ∀ (forall), ≡ (equality), e Σ (sigma).

## 4. Formatação:

- Alinhar comentários para melhor legibilidade.
- Para `with` aninhados, usar a seguinte formatação:

```agda
function-name args with expr1
... | pattern1 = result1
... | nestedPattern1 with expr2
...   | nestedPattern2 = result2
...   | pattern2       = result3
```

## 5. Imports:

- Ordenar imports alfabeticamente.
- Usar imports qualificados quando necessário para evitar conflitos de nomes.

## 6. Números naturais:

- Usar a sintaxe nativa de números (ex: `3`) em vez de `Succ(Succ(Succ Zero))`.

## 7. FFI (Foreign Function Interface):

- Criar uma pasta dedicada chamada "FFI" para código FFI.
- Subpastas para diferentes linguagens (ex: FFI/Haskell, FFI/JavaScript).
- Separar código FFI em arquivos próprios, especialmente para funções complexas.
- Para funções FFI simples (uma linha), pode-se manter no arquivo Agda principal.

## 8. Nomes:

- Evitar o uso de apóstrofes em nomes.

## 9. Parênteses:

- Evitar parênteses desnecessários.

## 10. Cláusulas `where`:

- Alinhar cláusulas `where` com a definição da função.

## 11. Funções auxiliares:

- Preferir definir funções auxiliares no topo do arquivo, antes da função principal.
- Para funções auxiliares complexas, considerar criar um arquivo separado.

## 12. Sigma (Σ) e tipos dependentes:

- Usar Σ para criar tipos mais expressivos, como listas ordenadas.
- Exemplo: `SortedList: Σ (xs: List Nat) -> (isAscending xs ≡ true)`

## 13. Performance:

- Estar ciente de possíveis impactos de performance ao escolher entre diferentes construções.
- Geralmente, confiar no compilador para otimizações adequadas.

## 14. Guideline geral:

- Preferir clareza e expressividade do código.
- Usar recursos do Agda (como tipos dependentes e `with`) para tornar o código mais seguro e preciso.

## 15. Revisão de código:

- A equipe deve revisar regularmente o código para garantir a conformidade com estas diretrizes.
- Estar aberto a ajustes nas diretrizes conforme a experiência da equipe cresce.
