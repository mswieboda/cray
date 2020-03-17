require "../../src/cray"

# This example will automatically scale with the window.

LibRay.set_config_flags LibRay::FLAG_WINDOW_RESIZABLE
LibRay.init_window 640, 480, "Example: hello_world"

TEXT = "Hello, world!"

while !LibRay.window_should_close?
  LibRay.begin_drawing
  LibRay.clear_background(LibRay::BLACK)

  w = LibRay.get_screen_width
  h = LibRay.get_screen_height

  font_size = 20
  spacing = 10

  text_size = LibRay.measure_text_ex(LibRay.get_font_default, TEXT, font_size, spacing)

  x = w / 2.0 - text_size.x
  y = h / 2.0 - text_size.y

  LibRay.draw_text_ex(LibRay.get_font_default, TEXT, LibRay::Vector2.new(x: x, y: y), font_size, spacing, LibRay::GREEN)

  LibRay.end_drawing
end

LibRay.close_window
