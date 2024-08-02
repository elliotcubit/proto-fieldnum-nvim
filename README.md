# proto-fieldnum-nvim

A plugin which renumbers protobuf fields in the selected range.

# Installation

Install with `lazy.nvim` (or your preferred plugin manager)

```
  {
    "elliotcubit/proto-fieldnum-nvim",
    cmd = "Renumber",
  },
```

# Usage

Select a range of lines containing fields in visual mode with `<S-v>`, then `:Renumber`.

Field numbers will be modified in-place to sequential numbers, starting at the first line selected.

Optionally, pass a starting line (`:Renumber 3`) to start at a specific number (here, 3).

![Example](./assets/demo.gif)
