module TryCompile

# test pkg which allows to reproduce the error
using CondaPkg

# some orfinary func from library docs to be sure that CondaPkg works
function foo()
    println("Hello! My status is:")
    println(CondaPkg.status())

    println("My envdir is:")
    out = CondaPkg.envdir()

    println(out)

    return out
end

export foo

# runs when call TryCompiled.exe after compilation
function julia_main()::Cint
    try
        foo()
    catch
        Base.invokelatest(Base.display_error, Base.catch_stack())
        return 1
    end
    return 0
end

end
