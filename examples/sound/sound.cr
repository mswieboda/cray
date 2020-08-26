require "../../src/cray"

LibRay.init_window 640, 480, "Example: sound"
LibRay.init_audio_device

TEXT = "Press ENTER to play sound"

# load sound
fxWav = LibRay.load_sound("./raylib/examples/audio/resources/sound.wav")

while !LibRay.window_should_close?
  LibRay.begin_drawing
  LibRay.clear_background(LibRay::BLACK)

  w = LibRay.get_screen_width
  h = LibRay.get_screen_height

  font_size = 20
  spacing = 10

  text_size = LibRay.measure_text_ex(LibRay.get_font_default, TEXT, font_size, spacing)

  x = w / 2.0 - text_size.x / 2.0
  y = h / 2.0 - text_size.y / 2.0

  # draw text
  LibRay.draw_text_ex(LibRay.get_font_default, TEXT, LibRay::Vector2.new(x: x, y: y), font_size, spacing, LibRay::GREEN)

  # check input
  if LibRay.key_pressed? LibRay::KEY_ENTER
    # randomize pitch
    LibRay.set_sound_pitch(fxWav, (0.5_f32 + rand(1.0)).to_f32)

    # play sound
    LibRay.play_sound(fxWav)
  end

  LibRay.end_drawing
end

# unload sound
LibRay.unload_sound(fxWav)

# close audio device
LibRay.close_audio_device

LibRay.close_window
