# fastlist

**Like `tasklist`, but 4x faster.**

```
    Name  Process Time  System Calls  Context Switches  Page Faults  Total I/O
fastlist   0:00:00.035          8217              1556         4752     176917
tasklist   0:00:00.141         62314             26919         4927    1346001
```

## Development

- **Install dependencies:** <code><a href="https://scoop.sh/">scoop</a> install visualc rktools2k3</code>
- **Build binary**: <code><a href="https://msdn.microsoft.com/en-us/library/610ecb4h.aspx">cl</a> fastlist.cpp</code>
- **Run benchmark**: [`bench`](bench.cmd)

## License

MIT
