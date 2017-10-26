require "../../src/cray"

SCREEN_WIDTH  = 640
SCREEN_HEIGHT = 480

LibRay.init_window SCREEN_WIDTH, SCREEN_HEIGHT, "Example: input"

icon = LibRay.load_image File.join(__DIR__, "circle.png")
circle = LibRay.load_texture_from_image icon

LibRay.set_window_icon icon

circle_pos = LibRay::Vector2.new(x: SCREEN_WIDTH/2 - circle.width/2, y: SCREEN_HEIGHT/2 - circle.height/2)

SPEED     = 300
TEXT      = "Use WASD to move the red circle!"
FONT_SIZE = 20

while !LibRay.window_should_close?
  LibRay.begin_drawing
  LibRay.clear_background LibRay::WHITE

  LibRay.draw_fps 0, 0

  text_size = LibRay.measure_text_ex LibRay.get_default_font, TEXT, FONT_SIZE, FONT_SIZE/10.0
  LibRay.draw_text_ex(
    LibRay.get_default_font,
    TEXT,
    LibRay::Vector2.new(
      x: SCREEN_WIDTH - text_size.x,
      y: 0
    ),
    FONT_SIZE,
    FONT_SIZE/10.0,
    LibRay::BLACK
  )

  delta = LibRay.get_frame_time

  if LibRay.key_down? LibRay::KEY_W
    circle_pos.y -= delta * SPEED
  end
  if LibRay.key_down? LibRay::KEY_S
    circle_pos.y += delta * SPEED
  end
  if LibRay.key_down? LibRay::KEY_A
    circle_pos.x -= delta * SPEED
  end
  if LibRay.key_down? LibRay::KEY_D
    circle_pos.x += delta * SPEED
  end

  LibRay.draw_texture_v(circle, circle_pos, LibRay::WHITE)

  LibRay.end_drawing
end

LibRay.unload_texture circle
LibRay.close_window
