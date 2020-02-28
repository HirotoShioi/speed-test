# speed-test

This repo is used to compare the output speed between `putStrLn` and `logInfo` in
GHC repl environment.

1. Build:

```
stack build
```

2. Go into repl

```
stack ghci
```

3. Run with `putStrLn`

```
> main
```

4. Run with `logInfo`

```
> :main --rio
```