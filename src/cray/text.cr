require "./structs"

lib LibRay
  # spritefont loading/unloading functions
  fun get_default_font = GetDefaultFont : SpriteFont
  fun load_sprite_font = LoadSpriteFont(filename : LibC::Char*) : SpriteFont
  fun load_sprite_font_ex = LoadSpriteFontEx(filename : LibC::Char*, font_size : LibC::Int, num_chars : LibC::Int, font_chars : LibC::Int*) : SpriteFont
  fun unload_sprite_font = UnloadSpriteFont(sprite_font : SpriteFont) : Void

  # text drawing functions
  fun draw_fps = DrawFPS(pos_x : LibC::Int, pos_y : LibC::Int) : Void
  fun draw_text = DrawText(text : LibC::Char*, pos_x : LibC::Int, pos_y : LibC::Int, font_size : LibC::Int, color : Color) : Void
  fun draw_text_ex = DrawTextEx(sprite_font : SpriteFont, text : LibC::Char*, position : Vector2, font_size : LibC::Float, spacing : LibC::Int, color : Color) : Void

  # text misc. functions
  fun measure_text = MeasureText(text : LibC::Char*, font_size : LibC::Int) : LibC::Int                                                     # measure string width for default font
  fun measure_text_ex = MeasureTextEx(sprite_font : SpriteFont, text : LibC::Char*, font_size : LibC::Float, spacing : LibC::Int) : Vector2 # measure string size for spritefont
  fun format_text = FormatText(text : LibC::Char*, ...) : LibC::Char*
  fun sub_text = SubText(text : LibC::Char*, position : LibC::Int, length : LibC::Int) : LibC::Char*
end
