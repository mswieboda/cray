require "./structs"

lib LibRay
  # spritefont loading/unloading functions
  fun get_font_default = GetFontDefault : Font
  fun load_font = LoadFont(filename : LibC::Char*) : Font
  fun load_font_ex = LoadFontEx(filename : LibC::Char*, font_size : LibC::Int, num_chars : LibC::Int, font_chars : LibC::Int*) : Font
  fun unload_font = UnloadFont(font : Font) : Void

  # text drawing functions
  fun draw_fps = DrawFPS(pos_x : LibC::Int, pos_y : LibC::Int) : Void
  fun draw_text = DrawText(text : LibC::Char*, pos_x : LibC::Int, pos_y : LibC::Int, font_size : LibC::Int, color : Color) : Void
  fun draw_text_ex = DrawTextEx(font : Font, text : LibC::Char*, position : Vector2, font_size : LibC::Float, spacing : LibC::Float, tint : Color)

  # text misc. functions
  fun measure_text = MeasureText(text : LibC::Char*, font_size : LibC::Int) : LibC::Int                                        # measure string width for default font
  fun measure_text_ex = MeasureTextEx(font : Font, text : LibC::Char*, font_size : LibC::Float, spacing : LibC::Int) : Vector2 # measure string size for spritefont
end
