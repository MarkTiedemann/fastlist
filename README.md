# fastlist [![Build status](https://ci.appveyor.com/api/projects/status/430903r5lwlos37g?svg=true)](https://ci.appveyor.com/project/MarkTiedemann/fastlist)

**Like `tasklist`, but 5x faster.**

```
    Name  Process Time  System   Context    Page  Total I/O
                         Calls  Switches  Faults
fastlist   0:00:00.031    7933      1571    4693     174322
tasklist   0:00:00.148   71404     28577    6773    1606046
```

For each process, `fastlist` prints (1) the **executable file**, (2) the **process ID**, and (3) the **parent process ID**, each seperated by a `\t`, followed by a `\n`. For example:

```cmd
λ fastlist
parent.exe  1  0
child.exe   2  1
```

`fastlist` is presumably faster than `tasklist` because it does _not_ print the **session name**, **session number**, nor the **memory usage** of each process. Unlike `tasklist`, it does, however, additionally print the **parent process ID**.

## Development

- **Install dependencies:** <code><a href="https://scoop.sh/">scoop</a> install visualc rktools2k3</code>
- **Build binary**: <code><a href="https://msdn.microsoft.com/en-us/library/610ecb4h.aspx">cl</a> fastlist.cpp</code>
- **Run benchmark**: <code><a href="https://github.com/MarkTiedemann/fastlist/blob/master/bench.cmd">bench</a> 100</code>

## License

MIT
