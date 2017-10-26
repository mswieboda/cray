require "./structs"

lib LibRay
  # image/texture2d data loading/unloading functions
  fun load_image = LoadImage(file_name : LibC::Char*) : Image
  fun load_image_ex = LoadImageEx(pixels : Color*, width : LibC::Int, height : LibC::Int) : Image
  fun load_image_pro = LoadImagePro(data : Void*, width : LibC::Int, height : LibC::Int, format : LibC::Int) : Image
  fun load_image_raw = LoadImageRaw(filename : LibC::Char*, width : LibC::Int, height : LibC::Int, format : LibC::Int, header_size : LibC::Int) : Image
  fun load_texture = LoadTexture(filename : LibC::Char*) : Texture2D
  fun load_texture_from_image = LoadTextureFromImage(image : Image) : Texture2D
  fun load_render_texture = LoadRenderTexture(width : LibC::Int, height : LibC::Int) : RenderTexture2D
  fun unload_image = UnloadImage(image : Image) : Void
  fun unload_texture = UnloadTexture(texture : Texture2D) : Void
  fun unload_render_texture = UnloadRenderTexture(texture : RenderTexture2D) : Void
  fun get_image_data = GetImageData(image : Image) : Color*               # get pixel data from image as a color struct array
  fun get_texture_data = GetTextureData(texture : Texture2D) : Image      # get pixel data from GPU texture and return an image
  fun update_texture = UpdateTexture(texture : Texture2D, pixels : Void*) # update gpu texture with new data
  fun save_image_as = SaveImageAs(filename : LibC::Char*, image : Image) : Void

  # image manipulation functions
  fun image_to_pot = ImageToPOT(image : Image*, fill_color : Color) : Void      # convert image to pot (power-of-two)
  fun image_format = ImageFormat(image : Image*, new_format : LibC::Int) : Void # convert image data to desired format
  fun image_alpha_mask = ImageAlphaMask(image : Image*, alpha_mask : Image) : Void
  fun image_dither = ImageDither(image : Image*, r_bpp : LibC::Int, g_bpp : LibC::Int, b_bpp : LibC::Int, a_bpp : LibC::Int) : Void # dither image data to 16bpp or lower (Floyd-Steinberg dithering)
  fun image_copy = ImageCopy(image : Image) : Image
  fun image_crop = ImageCrop(image : Image*, crop : Rectangle) : Void
  fun image_resize = ImageResize(image : Image*, new_width : LibC::Int, new_height : LibC::Int)      # resize an image (bilinear filtering)
  fun image_resize_nn = ImageResizeNN(image : Image*, new_width : LibC::Int, new_height : LibC::Int) # resize an image (nearest-neighbors scaling algorithm)
  fun image_text = ImageText(text : LibC::Char*, font_size : LibC::Int, color : Color) : Image       # create an image from text (default font)
  fun image_text_ex = ImageTextEx(font : SpriteFont, text : LibC::Char*, font_size : LibC::Int, spacing : LibC::Int, tint : Color) : Void
  fun image_draw = ImageDraw(dst : Image*, src : Image, src_rec : Rectangle, dst_rec : Rectangle) : Void
  fun image_draw_text = ImageDrawText(dst : Image*, position : Vector2, text : LibC::Char*, font_size : LibC::Int, color : Color) : Void
  fun image_draw_text_ex = ImageDrawTextEx(dst : Image*, position : Vector2, font : SpriteFont, text : LibC::Char*, font_size : LibC::Int, spacing : LibC::Int, color : Color) : Void
  fun image_flip_vertical = ImageFlipVertical(image : Image*) : Void
  fun image_flip_horizontal = ImageFlipHorizontal(image : Image*) : Void
  fun image_color_tint = ImageColorTint(image : Image*, color : Color) : Void
  fun image_color_invert = ImageColorInvert(image : Image*) : Void
  fun image_color_grayscale = ImageColorGrayscale(image : Image*) : Void
  fun image_color_contrast = ImageColorContrast(image : Image*, contrast : LibC::Float) : Void
  fun image_color_brightness = ImageColorBrightness(image : Image*, brightness : LibC::Int) : Void

  # image generation functions
  fun gen_image_gradient_v = GenImageGradientV(width : LibC::Int, height : LibC::Int, top : Color, bottom : Color) : Image
  fun gen_image_gradient_h = GenImageGradientH(width : LibC::Int, height : LibC::Int, left : Color, right : Color) : Image
  fun gen_image_gradient_radial = GenImageGradientRadial(width : LibC::Int, height : LibC::Int, density : LibC::Float, inner : Color, outer : Color) : Image
  fun gen_image_checked = GenImageChecked(width : LibC::Int, height : LibC::Int, checks_x : LibC::Int, checks_y : LibC::Int, color1 : Color, color2 : Color) : Image
  fun gen_image_white_noise = GenImageWhiteNoise(width : LibC::Int, height : LibC::Int, factor : LibC::Float) : Image
  fun gen_image_perlin_noise = GenImagePerlinNoise(width : LibC::Int, height : LibC::Int, scale : LibC::Float) : Image
  fun gen_image_cellular = GenImageCellular(width : LibC::Int, height : LibC::Int, tile_size : LibC::Int) : Image

  # texture2d configuration functions
  fun gen_texture_mipmaps = GenTextureMipmaps(texture : Texture2D*) : Void
  fun set_texture_filter = SetTextureFilter(texture : Texture2D, filter_mode : LibC::Int) : Void
  fun set_texture_wrap = SetTextureWrap(texture : Texture2D, wrap_mode : LibC::Int) : Void

  # texture2d drawing functions
  fun draw_texture = DrawTexture(texture : Texture2D, pos_x : LibC::Int, pos_y : LibC::Int, tint : Color) : Void
  fun draw_texture_v = DrawTextureV(texture : Texture2D, position : Vector2, tint : Color) : Void
  fun draw_texture_ex = DrawTextureEx(texture : Texture2D, position : Vector2, rotation : LibC::Float, scale : LibC::Float, tint : Color) : Void
  fun draw_texture_rec = DrawTextureRec(texture : Texture2D, source_rec : Rectangle, position : Vector2, tint : Color) : Void
  fun draw_texture_pro = DrawTexturePro(texture : Texture2D, source_rec : Rectangle, dest_rec : Rectangle, origin : Vector2, rotation : LibC::Float, tint : Color) : Void
end
