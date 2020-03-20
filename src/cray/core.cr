require "./structs"

lib LibRay
  # window related functions
  fun init_window = InitWindow(width : LibC::Int, height : LibC::Int, title : LibC::Char*) : Void
  fun window_should_close? = WindowShouldClose : Bool
  fun close_window = CloseWindow : Void
  fun window_ready? = IsWindowReady : Bool
  fun window_minimized? = IsWindowMinimized : Bool
  fun window_resized? = IsWindowResized : Bool
  fun window_hidden? = IsWindowHidden : Bool
  fun toggle_fullscreen = ToggleFullscreen : Void
  fun unhide_window = UnhideWindow : Void
  fun hide_window = HideWindow : Void

  fun set_window_icon = SetWindowIcon(image : Image) : Void
  fun set_window_title = SetWindowTitle(title : LibC::Char*) : Void
  fun set_window_position = SetWindowPosition(x : LibC::Int, y : LibC::Int) : Void
  fun set_window_monitor = SetWindowMonitor(monitor : LibC::Int) : Void
  fun set_window_min_size = SetWindowMinSize(width : LibC::Int, height : LibC::Int) : Void
  fun set_window_size = SetWindowSize(width : LibC::Int, height : LibC::Int) : Void

  fun get_screen_width = GetScreenWidth : LibC::Int
  fun get_screen_height = GetScreenHeight : LibC::Int
  fun get_monitor_count = GetMonitorCount : LibC::Int
  fun get_monitor_width = GetMonitorWidth(monitor : LibC::Int) : LibC::Int
  fun get_monitor_height = GetMonitorHeight(monitor : LibC::Int) : LibC::Int
  fun get_monitor_physical_width = GetMonitorPhysicalWidth(monitor : LibC::Int) : LibC::Int
  fun get_monitor_physical_height = GetMonitorPhysicalHeight(monitor : LibC::Int) : LibC::Int
  fun get_window_position = GetWindowPosition : Vector2
  fun get_monitor_name = GetMonitorName(monitor : LibC::Int) : LibC::Char*
  fun get_clipboard_text = GetClipboardText : LibC::Char*
  fun set_clipboard_text = SetClipboardText(text : LibC::Char*) : Void

  # cursor related functions
  fun show_cursor = ShowCursor : Void
  fun hide_cursor = HideCursor : Void
  fun cursor_hidden? = IsCursorHidden : Bool
  fun enable_cursor = EnableCursor : Void
  fun disable_cursor = DisableCursor : Void

  # drawing related functions
  fun clear_background = ClearBackground(color : Color) : Void
  fun begin_drawing = BeginDrawing : Void
  fun end_drawing = EndDrawing : Void
  fun begin_mode_2d = BeginMode2D(camera : Camera2D) : Void
  fun end_mode_2d = EndMode2D : Void
  fun begin_mode_3d = BeginMode3D(camera : Camera3D) : Void
  fun end_mode_3d = EndMode3D : Void
  fun begin_texture_mode = BeginTextureMode(target : RenderTexture2D) : Void
  fun end_texture_mode = EndTextureMode : Void
  fun begin_scissor_mode = BeginScissorMode(x : LibC::Int, y : LibC::Int, width : LibC::Int, height : LibC::Int) : Void
  fun end_scissor_mode = EndScissorMode : Void

  # screen space related functions
  fun get_mouse_ray = GetMouseRay(mouse_position : Vector2, camera : Camera) : Ray
  fun get_camera_matrix = GetCameraMatrix(camera : Camera) : Matrix
  fun get_camera_matrix_2d = GetCameraMatrix2D(camera : Camera2D) : Matrix
  fun get_world_to_screen = GetWorldToScreen(position : Vector3, camera : Camera) : Vector3
  fun get_world_to_screen_ex = GetWorldToScreenEx(position : Vector3, camera : Camera, width : LibC::Int, height : LibC::Int) : Vector3
  fun get_world_to_screen_2d = GetWorldToScreen2D(position : Vector2, camera : Camera2D) : Vector2
  fun get_screen_to_world_2d = GetScreenToWorld2D(position : Vector2, camera : Camera2D) : Vector2

  # timing related functions
  fun set_target_fps = SetTargetFPS(fps : LibC::Int) : Void
  fun get_fps = GetFPS : LibC::Int
  fun get_frame_time = GetFrameTime : LibC::Float
  fun get_time = GetTime : LibC::Double

  # color related functions
  fun color_to_int = ColorToInt(color : Color) : LibC::Int
  fun color_normalize = ColorNormalize(color : Color) : Vector4
  fun color_from_normalized = ColorFromNormalized(normalized : Vector4) : Color
  fun color_to_hsv = ColorToHSV(color : Color) : Vector3
  fun color_from_hsv = ColorFromHSV(hsv : Vector3) : Color
  fun get_color = GetColor(hex_value : LibC::Int) : Color
  fun fade = Fade(color : Color, alpha : LibC::Float) : Color

  # misc functions                         # activate raylib logo on startup
  fun set_config_flags = SetConfigFlags(flags : UInt8) : Void # setup window configuration flags (view FLAG_* in constants.cr)
  fun set_trace_log_level = SetTraceLogLevel(log_type : LibC::Int) : Void
  fun set_trace_log_ext = SetTraceLogExt(log_type : LibC::Int) : Void
  # fun set_trace_log_callback = SetTraceLogCallback(callback : TraceLogCallback) : Void # NOTE: not implemented, not sure on TraceLogCallback in structs.cr
  fun trace_log = TraceLog(log_type : LibC::Int, text : LibC::Char*) : Void           # show trace log messages (INFO, WARNING, ERROR, DEBUG)
  fun take_screenshot = TakeScreenshot(filename : LibC::Char*) : Void                 # takes a screenshot of current screen (saved a .png)
  fun get_random_value = GetRandomValue(min : LibC::Int, max : LibC::Int) : LibC::Int # returns a random value between min and max (both included)

  # files management functions
  fun load_file_data = LoadFileData(filename : LibC::Char*, bytes_read : LibC::Int*) : LibC::Char*
  fun save_file_data = SaveFileData(filename : LibC::Char*, data : Void*, bytes_to_write : LibC::Int) : Void
  fun file_exists? = FileExists(filename : LibC::Char*) : Bool
  fun file_extension? = IsFileExtension(filename : LibC::Char*, ext : LibC::Char*) : Bool # check file extension
  fun directory_exists? = DirectoryExists(dir_path : LibC::Char*) : Bool
  fun get_extension = GetExtension(filename : LibC::Char*) : LibC::Char*
  fun get_filename = GetFileName(file_path : LibC::Char*) : LibC::Char*
  fun get_filename_without_ext = GetFileNameWithoutExt(file_path : LibC::Char*) : LibC::Char*
  fun get_directory_path = GetDirectoryPath(file_path : LibC::Char*) : LibC::Char*
  fun get_prev_directory_path = GetPrevDirectoryPath(filename : LibC::Char*) : LibC::Char*
  fun get_working_directory = GetWorkingDirectory : LibC::Char*
  fun get_directory_files = GetDirectoryFiles(dir_path : LibC::Char*, count : LibC::Int*) : LibC::Char** # get filenames in a directory path (memory should be freed)
  fun clear_directory_files = ClearDirectoryFiles : Void                                                 # clear directory files paths buffers (free memory)
  fun change_directory = ChangeDirectory(dir : LibC::Char*) : Bool                                       # change working directory, returns true if success
  fun file_dropped? = IsFileDropped : Bool                                                               # checks if a file has been dropped into window
  fun get_dropped_files = GetDroppedFiles(count : LibC::Int*) : LibC::Char**                             # get dropped files names
  fun clear_dropped_files = ClearDroppedFiles : Void                                                     # clear dropped files paths buffer
  fun get_file_mod_time = GetFileModTime(filename : LibC::Char*) : LibC::Long                            # get file modification time (last write time)

  fun compress_data = CompressData(data : LibC::Char*, data_length : LibC::Int, comp_data_length : LibC::Int*) : LibC::Char*
  fun decompress_data = CompressData(comp_data : LibC::Char*, comp_data_length : LibC::Int, data_length : LibC::Int*) : LibC::Char*

  # persistent storage management
  fun storage_load_value = StorageLoadValue(position : LibC::Int) : LibC::Int               # load integer value from storage file (from defined position)
  fun storage_save_value = StorageSaveValue(position : LibC::Int, value : LibC::Int) : Void # save integer value to storage file (to defined position)

  fun open_url = OpenURL(url : LibC::Char*) : Void

  # input related functions: keyboard
  fun key_pressed? = IsKeyPressed(key : LibC::Int) : Bool
  fun key_down? = IsKeyDown(key : LibC::Int) : Bool
  fun key_released? = IsKeyReleased(key : LibC::Int) : Bool
  fun key_up? = IsKeyUp(key : LibC::Int) : Bool
  fun get_key_pressed = GetKeyPressed : LibC::Int
  fun set_exit_key = SetExitKey(key : LibC::Int) : Void # set a custom key to exit program (default is ESC)

  # input related functions: gamepad
  fun gamepad_available? = IsGamepadAvailable(gamepad : LibC::Int) : Bool
  fun gamepad_name? = IsGamepadName(gamepad : LibC::Int, name : LibC::Char*) : Bool # check gamepad name (if available)
  fun get_gamepad_name = GetGamepadName(gamepad : LibC::Int) : LibC::Char*
  fun gamepad_button_pressed? = IsGamepadButtonPressed(gamepad : LibC::Int, button : LibC::Int) : Bool
  fun gamepad_button_down? = IsGamepadButtonDown(gamepad : LibC::Int, button : LibC::Int) : Bool
  fun gamepad_button_released? = IsGamepadButtonReleased(gamepad : LibC::Int, button : LibC::Int) : Bool
  fun gamepad_button_up? = IsGamepadButtonUp(gamepad : LibC::Int, button : LibC::Int) : Bool
  fun get_gamepad_button_pressed = GetGamepadButtonPressed : LibC::Int
  fun get_gamepad_axis_count = GetGamepadAxisCount(gamepad : LibC::Int) : LibC::Int
  fun get_gamepad_axis_movement = GetGamepadAxisMovement(gamepad : LibC::Int, axis : LibC::Int) : LibC::Float

  # input related functions: mouse
  fun mouse_button_pressed? = IsMouseButtonPressed(button : LibC::Int) : Bool
  fun mouse_button_down? = IsMouseButtonDown(button : LibC::Int) : Bool
  fun mouse_button_released? = IsMouseButtonReleased(button : LibC::Int) : Bool
  fun mouse_button_up? = IsMouseButtonUp(button : LibC::Int) : Bool
  fun get_mouse_x = GetMouseX : LibC::Int
  fun get_mouse_y = GetMouseY : LibC::Int
  fun get_mouse_position = GetMousePosition : Vector2
  fun set_mouse_position = SetMousePosition(x : LibC::Int, y : LibC::Int) : Void
  fun set_mouse_offset = SetMouseOffset(offset_x : LibC::Int, offset_y : LibC::Int) : Void
  fun set_mouse_scale = SetMouseScale(scale_x : LibC::Int, scale_y : LibC::Int) : Void
  fun get_mouse_wheel_move = GetMouseWheelMove : LibC::Int

  # input related functions: touch
  fun get_touch_x = GetTouchX : LibC::Int
  fun get_touch_y = GetTouchY : LibC::Int
  fun get_touch_position = GetTouchPosition(index : LibC::Int) : Vector2

  # gestures related functions
  fun set_gestures_enabled = SetGesturesEnabled(gesture_flags : LibC::UInt) : Void
  fun gesture_detected? = IsGestureDetected(gesture : LibC::Int) : Bool
  fun get_gesture_detected = GetGestureDetected : LibC::Int
  fun get_touch_points_count = GetTouchPointsCount : LibC::Int
  fun get_gesture_hold_duration = GetGestureHoldDuration : LibC::Float
  fun get_gesture_drag_vector = GetGestureDragVector : Vector2
  fun get_gesture_drag_angle = GetGestureDragAngle : LibC::Float
  fun get_gesture_pinch_vector = GetGesturePinchVector : Vector2
  fun get_gesture_pinch_angle = GetGesturePinchAngle : LibC::Float

  # camera related functions
  fun set_camera_mode = SetCameraMode(camera : Camera, mode : LibC::Int) : Void
  fun update_camera = UpdateCamera(camera : Camera*) : Void
  fun set_camera_pan_control = SetCameraPanControl(pan_key : LibC::Int) : Void
  fun set_camera_alt_control = SetCameraAltControl(alt_key : LibC::Int) : Void
  fun set_camera_smooth_zoom_control = SetCameraSmoothZoomControl(sz_key : LibC::Int) : Void
  fun set_camera_move_controls = SetCameraMoveControls(front_key : LibC::Int, back_key : LibC::Int, right_key : LibC::Int, left_key : LibC::Int, up_key : LibC::Int, down_key : LibC::Int) : Void
end
