# fastlist

**Like `tasklist`, but 5x faster.**

```
    Name  Process Time  System   Context    Page  Total I/O
                         Calls  Switches  Faults
fastlist   0:00:00.031    7933      1571    4693     174322
tasklist   0:00:00.148   71404     28577    6773    1606046
```

## Development

- **Install dependencies:** <code><a href="https://scoop.sh/">scoop</a> install visualc rktools2k3</code>
- **Build binary**: <code><a href="https://msdn.microsoft.com/en-us/library/610ecb4h.aspx">cl</a> fastlist.cpp</code>
- **Run benchmark**: <code><a href="https://github.com/MarkTiedemann/fastlist/blob/master/bench.cmd">bench</a> 100</code>

## License

MIT
