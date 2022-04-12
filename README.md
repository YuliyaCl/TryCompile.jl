# TryCompile
Related issue:

https://github.com/cjdoris/CondaPkg.jl/issues/36

To create an app run file deploy/compile_app.sh (workdir should be root repository dir).

Tests and building proccess run correctly but when runing ....\TryCompile\bin\TryCompile.exe in cmd, an error occurs:
```
Hello! My status is:
ERROR: no environment in the LOAD_PATH depends on CondaPkg
Stacktrace:
  [1] error(s::String)
    @ Base .\error.jl:33
  [2] _resolve_top_env(load_path::Any)
    @ CondaPkg C:\Users\yzh\.julia\packages\CondaPkg\Olo5Y\src\resolve.jl:16
  [3] resolve(; force::Bool, io::IO, interactive::Bool, dry_run::Bool)
    @ CondaPkg C:\Users\yzh\.julia\packages\CondaPkg\Olo5Y\src\resolve.jl:307
  [4] is_resolved()
    @ CondaPkg C:\Users\yzh\.julia\packages\CondaPkg\Olo5Y\src\resolve.jl:418
  [5] status(; io::IO)
    @ CondaPkg C:\Users\yzh\.julia\packages\CondaPkg\Olo5Y\src\deps.jl:111
  [6] status()
    @ CondaPkg C:\Users\yzh\.julia\packages\CondaPkg\Olo5Y\src\deps.jl:110
  [7] foo(txt::String)
    @ TryCompile C:\Users\yzh\.julia\dev\TryCompile\src\TryCompile.jl:8
  [8] foo
    @ C:\Users\yzh\.julia\dev\TryCompile\src\TryCompile.jl:7 [inlined]
  [9] julia_main()
    @ TryCompile C:\Users\yzh\.julia\dev\TryCompile\src\TryCompile.jl:21
 [10] top-level scope
    @ none:1
```

So it failed trying perform `CondaPkg.status()`

This issue is related with cjdoris/PythonCall.jl#146

When I'm using another pkg to test PackageCompiler (Statistics.jl was used) everything run correctly.
