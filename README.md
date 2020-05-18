# fastlist [![Build status](https://ci.appveyor.com/api/projects/status/430903r5lwlos37g?svg=true)](https://ci.appveyor.com/project/MarkTiedemann/fastlist)

**Like `tasklist`, but 5x faster.**

```
    Name  Process Time  System   Context    Page  Total I/O
                         Calls  Switches  Faults
fastlist   0:00:00.031    7933      1571    4693     174322
tasklist   0:00:00.148   71404     28577    6773    1606046
```

For each process, `fastlist` prints (1) the **executable file**, (2) the **process ID**, and (3) the **parent process ID**, each separated by a `\t`, followed by a `\n`. For example:

```cmd
λ fastlist
parent.exe  1  0
child.exe   2  1
```

`fastlist` is presumably faster than `tasklist` because it does _not_ print the **session name**, **session number**, nor the **memory usage** of each process. Unlike `tasklist`, it does, however, additionally print the **parent process ID**.

## Releases

[**v0.1.0**](https://github.com/MarkTiedemann/fastlist/releases/tag/v0.1.0) - Oct 5, 2018

[_Download `fastlist.exe`_](https://github.com/MarkTiedemann/fastlist/releases/download/v0.1.0/fastlist.exe)

```batch
:: Download via curl
curl -Lo fastlist-0.1.0.exe https://github.com/MarkTiedemann/fastlist/releases/download/v0.1.0/fastlist.exe
```

SHA-256: `071f43816861b30663b17649abfcca743f17b353786218bac1f0f92e55acb3d8`

## Development

- **Install dependencies:** <code><a href="https://scoop.sh/">scoop</a> install visualc rktools2k3</code>
- **Build binary**: <code><a href="https://msdn.microsoft.com/en-us/library/610ecb4h.aspx">cl</a> fastlist.cpp</code>
- **Run benchmark**: <code><a href="https://github.com/MarkTiedemann/fastlist/blob/master/bench.cmd">bench</a> 100</code>

## Notes

- `fastlist` was originally built for use in [sindresorhus/ps-list](https://github.com/sindresorhus/ps-list) (see [sindresorhus/ps-list#20](https://github.com/sindresorhus/ps-list/issues/20))
- it is inspired by performance issues with existing solutions (for example, [sindresorhus/fkill#25](https://github.com/sindresorhus/fkill/issues/25))
- its author, Mark Tiedemann, helps to maintain the Node wrapper for `tasklist`: [sindresorhus/tasklist](https://github.com/sindresorhus/tasklist)
- [Reddit rumors](https://www.reddit.com/r/javascript/comments/f0kmqd/askjs_fastlistexe_was_flagged_as_a_malware_by_my/) to the contrary notwithstanding, it is not a virus

## License

MIT
