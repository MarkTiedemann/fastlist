# fastlist

**Like `tasklist`, but 10x faster.**

```
    Name  Process Time  System   Context    Page  Total I/O
                         Calls  Switches  Faults
fastlist   0:00:00.014    7331      1879    1774     176124
tasklist   0:00:00.165  124549     51150    9017    4001389
```

For each process, `fastlist` prints (1) the **process ID**, (2) the **parent process ID**, and (3) the **executable file**, each separated by a `\t`, followed by a `\n`. For example:

```batch
> fastlist.exe
0       0       [System Process]
4       0       System
72      4       Secure System
128     4       Registry
520     4       smss.exe
776     640     csrss.exe
864     640     wininit.exe
...
```

`fastlist` is faster than `tasklist`, presumably, because it does _not_ print the **session name**, **session number**, nor the **memory usage** of each process. Unlike `tasklist`, it does, however, print the **parent process ID**.

## Releases

- [**v0.2.1**](https://github.com/MarkTiedemann/fastlist/releases/tag/v0.2.1) (May 23, 2020): Packed binaries
- [**v0.2.0**](https://github.com/MarkTiedemann/fastlist/releases/tag/v0.2.0) (May 23, 2020): Unicode support; x86 and x64 build
- [**v0.1.0**](https://github.com/MarkTiedemann/fastlist/releases/tag/v0.1.0) (Oct 5, 2018): Initial release

## Compatibility

- Running `fastlist` v0.2.0 or greater on Windows Vista or older, may result in the following error message: _"The program can't start because api-ms-win-crt-heap-l1-1-0.dll is missing from your computer"_. To fix this, either download [`fastlist` v0.1.0](https://github.com/MarkTiedemann/fastlist/releases/tag/v0.1.0), or download and install the [Microsoft Visual C++ Redistributable for Visual Studio 2015, 2017 and 2019](https://support.microsoft.com/en-us/help/2977003/the-latest-supported-visual-c-downloads): [vc_redist.x86.exe](https://aka.ms/vs/16/release/vc_redist.x86.exe) or [vc_redist.x64.exe](https://aka.ms/vs/16/release/vc_redist.x64.exe).

## Notes

- `fastlist` was originally built for use in [sindresorhus/ps-list](https://github.com/sindresorhus/ps-list) (see [sindresorhus/ps-list#20](https://github.com/sindresorhus/ps-list/issues/20)).
- It is inspired by performance issues with existing solutions (for example, [sindresorhus/fkill#25](https://github.com/sindresorhus/fkill/issues/25)).
- Being included in [npmjs.com/ps-list](https://www.npmjs.com/package/ps-list), `fastlist` is downloaded up to 500,000 times per week.
- [Reddit rumors](https://www.reddit.com/r/javascript/comments/f0kmqd/askjs_fastlistexe_was_flagged_as_a_malware_by_my/) to the contrary notwithstanding, it is not a virus.
- Its author helps to maintain the Node wrapper for `tasklist`: [sindresorhus/tasklist](https://github.com/sindresorhus/tasklist).
- There is a [`fastlist` plugin](https://deno.land/x/fastlist) for [Deno](https://deno.land): [MarkTiedemann/deno_fastlist](https://github.com/MarkTiedemann/deno_fastlist).

## Development

- Download and install [Microsoft Visual Studio](https://visualstudio.microsoft.com/), including its workload for _Desktop Development with C++_. In VS, create a new _Console App_. Copy [`fastlist.cpp`](fastlist.cpp) into the project and build it.
- To benchmark `fastlist`, run [`bench.cmd`](bench.cmd).
- To test `fastlist`, run [`test.cmd`](test.cmd).
- `fastlist` uses [`upx`](https://github.com/upx/upx) to pack the binaries for reduced size (see [`pack.cmd`](pack.cmd)).

## License

MIT
