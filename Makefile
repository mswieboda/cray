all: examples

libraylib.so: raylib
	cd raylib ;\
	rm -rf build ;\
	mkdir -p build ;\
	cd build ;\
	cmake -DBUILD_EXAMPLES=OFF -DBUILD_GAMES=OFF -DSHARED_RAYLIB=ON .. ;\
	make
	cp raylib/build/release/libraylib.so .

example_hello_world: libraylib.so examples/hello_world/hello_world.cr
	mkdir -p build-examples
	env LIBRARY_PATH="$(PWD)" crystal build examples/hello_world/hello_world.cr -o build-examples/hello_world

example_image_effects: libraylib.so examples/image_effects/image_effects.cr
	mkdir -p build-examples
	env LIBRARY_PATH="$(PWD)" crystal build examples/image_effects/image_effects.cr -o build-examples/image_effects

example_input: libraylib.so examples/input/input.cr examples/input/circle.png
	mkdir -p build-examples
	env LIBRARY_PATH="$(PWD)" crystal build examples/input/input.cr -o build-examples/input

run_example_hello_world: example_hello_world
	env LD_LIBRARY_PATH="$(PWD)" build-examples/hello_world

run_example_image_effects: example_image_effects
	env LD_LIBRARY_PATH="$(PWD)" build-examples/image_effects

run_example_input: example_input
	env LD_LIBRARY_PATH="$(PWD)" build-examples/input

examples: example_hello_world example_image_effects example_input

run_examples: run_example_hello_world run_example_image_effects run_example_input
