julia -e 'using Pkg; Pkg.add("PackageCompiler")'

julia --project=@. --startup-file=no -e 'using Pkg; Pkg.instantiate()'

julia --project=@. --startup-file=no -e '
using PackageCompiler;
PackageCompiler.create_app(pwd(), "TryCompiled";
    precompile_execution_file=["test/runtests.jl"])
'
