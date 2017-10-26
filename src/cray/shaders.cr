require "./structs"

lib LibRay
  # shader loading/unloading functions
  fun load_text = LoadText(filename : LibC::Char*) : LibC::Char*
  fun load_shader = LoadShader(vertex_filename : LibC::Char*, fragment_filename : LibC::Char*) : Shader
  fun unload_shader = UnloadShader(shader : Shader) : Void

  fun get_default_shader = GetDefaultShader : Shader
  fun get_default_texture = GetDefaultTexture : Texture2D

  # shader access functions
  fun get_shader_location = GetShaderLocation(shader : Shader, uniform_name : LibC::Char*) : LibC::Int
  fun set_shader_value = SetShaderValue(shader : Shader, uniform_loc : LibC::Int, value : LibC::Float*, size : LibC::Int) : Void
  fun set_shader_value_int = SetShaderValuei(shader : Shader, uniform_loc : LibC::Int, value : LibC::Int*, size : LibC::Int) : Void
  fun set_shader_value_matrix = SetShaderValueMatrix(shader : Shader, uniform_loc : LibC::Int, mat : Matrix) : Void
  fun set_matrix_projection = SetMatrixProjection(proj : Matrix) : Void
  fun set_matrix_modelview = SetMatrixModelview(view : Matrix) : Void

  # shading begin/end functions
  fun begin_shader_mode = BeginShaderMode(shader : Shader) : Void
  fun end_shader_mode = EndShaderMode : Void
  fun begin_blend_mode = BeginBlendMode(mode : LibC::Int) : Void
  fun end_blend_mode = EndBlendMode : Void

  # vr control functions
  fun get_vr_device_info = GetVrDeviceInfo(vr_device_type : LibC::Int) : VrDeviceInfo
  fun init_vr_simulator = InitVrSimulator(info : VrDeviceInfo) : Void
  fun close_vr_simulator = CloseVrSimulator : Void
  fun vr_simulator_ready? = IsVrSimulatorReady : Bool
  fun update_vr_tracking = UpdateVrTracking(camera : Camera*) : Void
  fun toggle_vr_mode = ToggleVrMode : Void
  fun begin_vr_drawing = BeginVrDrawing : Void
  fun end_vr_drawing = EndVrDrawing : Void
end
