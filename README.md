# cray

Complete [RayLib](http://raylib.com) bindings to Crystal.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  cray:
    gitlab: zatherz/cray
```

## Usage

Check out the examples in the `examples` directory.

You can run `make run_examples` to run all of the examples one after another.

The function names are the same as the names in the [cheatsheet](http://www.raylib.com/cheatsheet/cheatsheet.html), with the following differences:

* All of the functions, structs and constants are prefixed with `LibRay`.  
  `IsWindowMinimized` => `LibRay.window_minimized?`  
  `Vector2` => `LibRay::Vector2`  
  `FLAG_WINDOW_RESIZABLE` => `LibRay::FLAG_WINDOW_RESIZABLE`
* PascalCase is changed into snake_case (so for example `InitWindow` is `init_window`).
* Functions returning booleans end with a question mark and the `Is` prefixes are stripped.  
  For example, `IsWindowMinimized` is `window_minimized?`
* Any other name inconsistency is a bug.

## Contributors

- [[Zatherz]](https://gitlab.com/Zatherz) Zatherz - creator, maintainer
