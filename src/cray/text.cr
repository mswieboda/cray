require "./structs"

lib LibRay
  # spritefont loading/unloading functions
  fun get_font_default = GetFontDefault : Font                                                                                                                                              # get the default font
  fun load_font = LoadFont(filename : LibC::Char*) : Font                                                                                                                                   # load font from file into GPU memory (VRAM)
  fun load_font_ex = LoadFontEx(filename : LibC::Char*, font_size : LibC::Int, num_chars : LibC::Int, font_chars : LibC::Int*) : Font                                                       # load font from file with extended parameters
  fun load_font_from_image = LoadFontFromImage(image : Image, key : Color, first_char : LibC::Int) : Font                                                                                   # load font from Image (XNA style)
  fun load_font_data = LoadFontData(filename : LibC::Char*, font_size : LibC::Int, font_chars : LibC::Int*, chars_count : LibC::Int, type : LibC::Int) : CharInfo*                          # load font data for further use
  fun gen_image_font_atlas = GenImageFontAtlas(chars : CharInfo*, recs : Rectangle**, chars_count : LibC::Int, font_size : LibC::Int, padding : LibC::Int, pack_method : LibC::Int) : Image # generate image font atlas using chars info
  fun unload_font = UnloadFont(font : Font) : Void                                                                                                                                          # unload Font from GPU memory (VRAM)

  # text drawing functions
  fun draw_fps = DrawFPS(pos_x : LibC::Int, pos_y : LibC::Int) : Void                                                                                                                                                                                                               # shows current FPS
  fun draw_text = DrawText(text : LibC::Char*, pos_x : LibC::Int, pos_y : LibC::Int, font_size : LibC::Int, color : Color) : Void                                                                                                                                                   # draw text (using default font)
  fun draw_text_ex = DrawTextEx(font : Font, text : LibC::Char*, position : Vector2, font_size : LibC::Float, spacing : LibC::Float, tint : Color) : Void                                                                                                                           # draw text using font and additional parameters
  fun draw_text_rec = DrawTextRec(font : Font, text : LibC::Char*, rec : Rectangle, font_size : LibC::Float, spacing : LibC::Float, word_wrap : Bool, tint : Color) : Void                                                                                                          # draw text using font inside rectangle limits
  fun draw_text_rec_ex = DrawTextRecEx(font : Font, text : LibC::Char*, rec : Rectangle, font_size : LibC::Float, spacing : LibC::Float, word_wrap : Bool, tint : Color, select_start : LibC::Int, select_length : LibC::Int, select_tint : Color, select_back_tint : Color) : Void # draw text using font inside rectangle limits with support for text selection
  fun draw_text_codepoint = DrawTextCodepoint(font : Font, codepoint : LibC::Int, position : Vector2, scale : LibC::Float, tint : Color) : Void                                                                                                                                     # draw one character (codepoint)

  # text misc. functions
  fun measure_text = MeasureText(text : LibC::Char*, font_size : LibC::Int) : LibC::Int                                          # measure string width for default font
  fun measure_text_ex = MeasureTextEx(font : Font, text : LibC::Char*, font_size : LibC::Float, spacing : LibC::Float) : Vector2 # measure string size for font
  fun get_glyph_index = GetGlyphIndex(font : Font, codepoint : LibC::Int) : LibC::Int
end
