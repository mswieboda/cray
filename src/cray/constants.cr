require "./structs"

lib LibRay
  PI      = 3.14159265358979323846f32
  DEG2RAD = PI / 180f32
  RAD2DEG = 180f32 / PI

  FLAG_SHOW_LOGO          =  1
  FLAG_FULLSCREEN_MODE    =  2
  FLAG_WINDOW_RESIZABLE   =  4
  FLAG_WINDOW_DECORATED   =  8
  FLAG_WINDOW_TRANSPARENT = 16
  FLAG_MSAA_4X_HINT       = 32
  FLAG_VSYNC_HINT         = 64

  KEY_SPACE         =  32
  KEY_ESCAPE        = 256
  KEY_ENTER         = 257
  KEY_BACKSPACE     = 259
  KEY_RIGHT         = 262
  KEY_LEFT          = 263
  KEY_DOWN          = 264
  KEY_UP            = 265
  KEY_F1            = 290
  KEY_F2            = 291
  KEY_F3            = 292
  KEY_F4            = 293
  KEY_F5            = 294
  KEY_F6            = 295
  KEY_F7            = 296
  KEY_F8            = 297
  KEY_F9            = 298
  KEY_F10           = 299
  KEY_F11           = 300
  KEY_F12           = 301
  KEY_LEFT_SHIFT    = 340
  KEY_LEFT_CONTROL  = 341
  KEY_LEFT_ALT      = 342
  KEY_RIGHT_SHIFT   = 344
  KEY_RIGHT_CONTROL = 345
  KEY_RIGHT_ALT     = 346

  KEY_ZERO  = 48
  KEY_ONE   = 49
  KEY_TWO   = 50
  KEY_THREE = 51
  KEY_FOUR  = 52
  KEY_FIVE  = 53
  KEY_SIX   = 54
  KEY_SEVEN = 55
  KEY_EIGHT = 56
  KEY_NINE  = 57
  KEY_A     = 65
  KEY_B     = 66
  KEY_C     = 67
  KEY_D     = 68
  KEY_E     = 69
  KEY_F     = 70
  KEY_G     = 71
  KEY_H     = 72
  KEY_I     = 73
  KEY_J     = 74
  KEY_K     = 75
  KEY_L     = 76
  KEY_M     = 77
  KEY_N     = 78
  KEY_O     = 79
  KEY_P     = 80
  KEY_Q     = 81
  KEY_R     = 82
  KEY_S     = 83
  KEY_T     = 84
  KEY_U     = 85
  KEY_V     = 86
  KEY_W     = 87
  KEY_X     = 88
  KEY_Y     = 89
  KEY_Z     = 90

  # android physical buttons
  KEY_BACK        =  4
  KEY_MENU        = 82
  KEY_VOLUME_UP   = 24
  KEY_VOLUME_DOWN = 25

  MOUSE_LEFT_BUTTON   = 0
  MOUSE_RIGHT_BUTTON  = 1
  MOUSE_MIDDLE_BUTTON = 2

  MAX_TOUCH_POINTS = 2

  GAMEPAD_PLAYER1 = 0
  GAMEPAD_PLAYER2 = 1
  GAMEPAD_PLAYER3 = 2
  GAMEPAD_PLAYER4 = 3

  GAMEPAD_PS3_BUTTON_TRIANGLE =  0
  GAMEPAD_PS3_BUTTON_CIRCLE   =  1
  GAMEPAD_PS3_BUTTON_CROSS    =  2
  GAMEPAD_PS3_BUTTON_SQUARE   =  3
  GAMEPAD_PS3_BUTTON_L1       =  6
  GAMEPAD_PS3_BUTTON_R1       =  7
  GAMEPAD_PS3_BUTTON_L2       =  4
  GAMEPAD_PS3_BUTTON_R2       =  5
  GAMEPAD_PS3_BUTTON_START    =  8
  GAMEPAD_PS3_BUTTON_SELECT   =  9
  GAMEPAD_PS3_BUTTON_UP       = 24
  GAMEPAD_PS3_BUTTON_RIGHT    = 25
  GAMEPAD_PS3_BUTTON_DOWN     = 26
  GAMEPAD_PS3_BUTTON_LEFT     = 27
  GAMEPAD_PS3_BUTTON_PS       = 12

  GAMEPAD_PS3_AXIS_LEFT_X  = 0
  GAMEPAD_PS3_AXIS_LEFT_Y  = 1
  GAMEPAD_PS3_AXIS_RIGHT_X = 2
  GAMEPAD_PS3_AXIS_RIGHT_Y = 5
  GAMEPAD_PS3_AXIS_L2      = 3
  GAMEPAD_PS3_AXIS_R2      = 4

  GAMEPAD_XBOX_BUTTON_A      =  0
  GAMEPAD_XBOX_BUTTON_B      =  1
  GAMEPAD_XBOX_BUTTON_X      =  2
  GAMEPAD_XBOX_BUTTON_Y      =  3
  GAMEPAD_XBOX_BUTTON_LB     =  4
  GAMEPAD_XBOX_BUTTON_RB     =  5
  GAMEPAD_XBOX_BUTTON_SELECT =  6
  GAMEPAD_XBOX_BUTTON_START  =  7
  GAMEPAD_XBOX_BUTTON_UP     = 10
  GAMEPAD_XBOX_BUTTON_RIGHT  = 11
  GAMEPAD_XBOX_BUTTON_DOWN   = 12
  GAMEPAD_XBOX_BUTTON_LEFT   = 13
  GAMEPAD_XBOX_BUTTON_HOME   =  8

  {% if flag?("rpi") %}
      GAMEPAD_XBOX_AXIS_LEFT_X = 0
      GAMEPAD_XBOX_AXIS_LEFT_Y = 1
      GAMEPAD_XBOX_AXIS_RIGHT_X = 3
      GAMEPAD_XBOX_AXIS_RIGHT_Y = 4
      GAMEPAD_XBOX_AXIS_LT = 2
      GAMEPAD_XBOX_AXIS_RT = 5
  {% else %}
      GAMEPAD_XBOX_AXIS_LEFT_X = 0
      GAMEPAD_XBOX_AXIS_LEFT_Y = 1
      GAMEPAD_XBOX_AXIS_RIGHT_X = 2
      GAMEPAD_XBOX_AXIS_RIGHT_Y = 3
      GAMEPAD_XBOX_AXIS_LT = 4
      GAMEPAD_XBOX_AXIS_RT = 5
  {% end %}

  LIGHTGRAY  = Color.new(r: 200, g: 200, b: 200, a: 255)
  GRAY       = Color.new(r: 130, g: 130, b: 130, a: 255)
  DARKGRAY   = Color.new(r: 80, g: 80, b: 80, a: 255)
  YELLOW     = Color.new(r: 253, g: 249, b: 0, a: 255)
  GOLD       = Color.new(r: 255, g: 203, b: 0, a: 255)
  ORANGE     = Color.new(r: 255, g: 161, b: 0, a: 255)
  PINK       = Color.new(r: 255, g: 109, b: 194, a: 255)
  RED        = Color.new(r: 230, g: 41, b: 55, a: 255)
  MAROON     = Color.new(r: 190, g: 33, b: 55, a: 255)
  GREEN      = Color.new(r: 0, g: 228, b: 48, a: 255)
  LIME       = Color.new(r: 0, g: 158, b: 47, a: 255)
  DARKGREEN  = Color.new(r: 0, g: 117, b: 44, a: 255)
  SKYBLUE    = Color.new(r: 102, g: 191, b: 255, a: 255)
  BLUE       = Color.new(r: 0, g: 121, b: 241, a: 255)
  DARKBLUE   = Color.new(r: 0, g: 82, b: 172, a: 255)
  PURPLE     = Color.new(r: 200, g: 122, b: 255, a: 255)
  VIOLET     = Color.new(r: 135, g: 60, b: 190, a: 255)
  DARKPURPLE = Color.new(r: 112, g: 31, b: 126, a: 255)
  BEIGE      = Color.new(r: 211, g: 176, b: 131, a: 255)
  BROWN      = Color.new(r: 127, g: 106, b: 79, a: 255)
  DARKBROWN  = Color.new(r: 76, g: 63, b: 47, a: 255)

  WHITE    = Color.new(r: 255, g: 255, b: 255, a: 255)
  BLACK    = Color.new(r: 0, g: 0, b: 0, a: 255)
  BLANK    = Color.new(r: 0, g: 0, b: 0, a: 0)
  MAGENTA  = Color.new(r: 255, g: 0, b: 255, a: 255)
  RAYWHITE = Color.new(r: 245, g: 245, b: 245, a: 255)

  MAX_SHADER_LOCATIONS = 32
  MAX_MATERIAL_MAPS    = 12
end
