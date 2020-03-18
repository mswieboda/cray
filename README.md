# cray

Complete [RayLib](http://raylib.com) bindings to Crystal.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  cray:
    gitlab: mswieboda/cray
```

The [RayLib](http://raylib.com) libraries are copied to your projects `lib_ext` folder.

Currently they contain:

```
libraylib.2.6.0.dylib
libraylib.261.dylib
libraylib.so # (TBD: need to compile and add to repo)
libraylib.dylib
```

`*.dylib` is used for MacOS, while `*.so` will be for Linux.

TODO: will try to have MacOS compile to `*.so` as well so only one file is needed regardless of platform.

Use these environment variables to load the library when building or running your project:

Building:

```
env LIBRARY_PATH="$(PWD)/lib_ext" crystal build src/your_project.cr
```

Running:

```
env LD_LIBRARY_PATH="$(PWD)/lib_ext" crystal build ./your_project
```

See the `Makefile` for building and running the examples and how you might setup your `Makefile` for easier development.

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
- [mswieboda](https://gitlab.com/mswieboda)

