require "../../src/cray"

LibRay.set_config_flags LibRay::FLAG_WINDOW_RESIZABLE
LibRay.init_window 640, 480, "Example: image_effects"

orig_image = nil
image = nil
texture = nil

while !LibRay.window_should_close?
  LibRay.begin_drawing
  LibRay.clear_background LibRay::WHITE

  screen_width = LibRay.get_screen_width
  screen_height = LibRay.get_screen_height

  if texture
    LibRay.draw_texture texture, screen_width/2 - texture.width/2, screen_height/2 - texture.height/2, LibRay::WHITE

    if {
         LibRay::KEY_ONE, LibRay::KEY_TWO,
         LibRay::KEY_THREE, LibRay::KEY_FOUR,
         LibRay::KEY_FIVE, LibRay::KEY_SIX,
       }.any? { |k| LibRay.key_pressed? k }
      image = LibRay.image_copy orig_image.as(LibRay::Image) if orig_image != nil
      orig_image = LibRay.image_copy image.as(LibRay::Image)
      _image = image.as(LibRay::Image)

      if LibRay.key_pressed? LibRay::KEY_ONE
        color = LibRay::Color.new(
          r: rand(0..255),
          g: rand(0..255),
          b: rand(0..255),
          a: 255
        )
        LibRay.image_color_tint pointerof(_image), color
      elsif LibRay.key_pressed? LibRay::KEY_TWO
        LibRay.image_color_invert pointerof(_image)
      elsif LibRay.key_pressed? LibRay::KEY_THREE
        if rand(0..1) == 0
          puts "V"
          LibRay.image_flip_vertical pointerof(_image)
        else
          puts "H"
          LibRay.image_flip_horizontal pointerof(_image)
        end
      elsif LibRay.key_pressed? LibRay::KEY_FOUR
        LibRay.image_color_grayscale pointerof(_image)
      elsif LibRay.key_pressed? LibRay::KEY_FIVE
        LibRay.image_color_contrast pointerof(_image), rand(0.0..100.0)
      elsif LibRay.key_pressed? LibRay::KEY_SIX
        LibRay.image_color_brightness pointerof(_image), rand(0.0..100.0)
      end

      image = _image
      texture = LibRay.load_texture_from_image image
    end
  else
    LibRay.draw_text(
      "Drop a PNG into this window then press 1, 2, 3 or 4",
      0,
      0,
      20,
      LibRay::BLACK
    )
  end

  if LibRay.file_dropped?
    count = 0
    files = LibRay.get_dropped_files pointerof(count)

    path = files[0]
    if texture
      LibRay.unload_texture texture
    end
    image = LibRay.load_image path
    texture = LibRay.load_texture_from_image image
    orig_image = LibRay.image_copy image
    LibRay.set_window_min_size texture.width, texture.height

    LibRay.clear_dropped_files
  end

  LibRay.end_drawing
end

LibRay.close_window
