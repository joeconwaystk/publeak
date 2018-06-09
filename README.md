View memory usage over time of `pub run test`.

To see normal memory usage, run without `--preview-dart-2` flag:

```bash
pub run test -j1
```

To see with leak, run with `--preview-dart-2` flag:

```bash
export DART_VM_OPTIONS=--preview-dart-2
pub run test -j1
```
