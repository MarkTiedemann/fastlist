@echo off
for /l %%x in (1, 1, %1) do (
  timeit.exe %2 > NUL 2>&1
)
timeit.exe -a
del timeit.dat