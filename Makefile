all: examples

lib_ext: raylib
	rm -rf lib_ext ;\
	mkdir -p lib_ext ;\
	cd raylib ;\
	rm -rf build ;\
	mkdir -p build ;\
	cd build ;\
	cmake -DBUILD_EXAMPLES=OFF -DBUILD_GAMES=OFF -DSHARED_RAYLIB=ON .. ;\
	make
	cp ./raylib/build/src/libraylib.*.so ./lib_ext
	cp ./raylib/build/src/libraylib.*.dylib ./lib_ext

example_hello_world: lib_ext examples/hello_world/hello_world.cr
	mkdir -p build-examples
	env LIBRARY_PATH="$(PWD)/lib_ext" crystal build examples/hello_world/hello_world.cr -o build-examples/hello_world

example_image_effects: lib_ext examples/image_effects/image_effects.cr
	mkdir -p build-examples
	env LIBRARY_PATH="$(PWD)/lib_ext" crystal build examples/image_effects/image_effects.cr -o build-examples/image_effects

example_input: lib_ext examples/input/input.cr examples/input/circle.png
	mkdir -p build-examples
	env LIBRARY_PATH="$(PWD)/lib_ext" crystal build examples/input/input.cr -o build-examples/input

example_sound: lib_ext examples/sound/sound.cr
	mkdir -p build-examples
	env LIBRARY_PATH="$(PWD)/lib_ext" crystal build examples/sound/sound.cr -o build-examples/sound

run_example_hello_world: example_hello_world
	env LD_LIBRARY_PATH="$(PWD)/lib_ext" build-examples/hello_world

run_example_image_effects: example_image_effects
	env LD_LIBRARY_PATH="$(PWD)/lib_ext" build-examples/image_effects

run_example_input: example_input
	env LD_LIBRARY_PATH="$(PWD)/lib_ext" build-examples/input

run_example_sound: example_sound
	env LD_LIBRARY_PATH="$(PWD)/lib_ext" build-examples/sound

examples: example_hello_world example_image_effects example_input example_sound

run_examples: run_example_hello_world run_example_image_effects run_example_input run_example_sound
