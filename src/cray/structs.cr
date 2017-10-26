require "./constants"

lib LibRay
  struct Vector2
    x : LibC::Float
    y : LibC::Float
  end

  struct Vector3
    x : LibC::Float
    y : LibC::Float
    z : LibC::Float
  end

  struct Matrix
    m0 : LibC::Float
    m4 : LibC::Float
    m8 : LibC::Float
    m12 : LibC::Float

    m1 : LibC::Float
    m5 : LibC::Float
    m9 : LibC::Float
    m13 : LibC::Float

    m2 : LibC::Float
    m6 : LibC::Float
    m10 : LibC::Float
    m14 : LibC::Float

    m3 : LibC::Float
    m7 : LibC::Float
    m11 : LibC::Float
    m15 : LibC::Float
  end

  struct Color
    r : UInt8
    g : UInt8
    b : UInt8
    a : UInt8
  end

  struct Rectangle
    x : LibC::Int
    y : LibC::Int
    width : LibC::Int
    height : LibC::Int
  end

  struct Image
    data : Void*        # image raw data
    width : LibC::Int   # image base width
    height : LibC::Int  # image base height
    mipmaps : LibC::Int # mipmap levels, 1 by default
    format : LibC::Int  # data format (TextureFormat type)
  end

  struct Texture2D
    id : LibC::UInt     # opengl texture id
    width : LibC::Int   # texture base width
    height : LibC::Int  # texture base height
    mipmaps : LibC::Int # mipmap levels, 1 by default
    format : LibC::Int  # data format (TextureFormat type)
  end

  struct RenderTexture2D
    id : LibC::UInt     # opengl framebuffer object (FBO) id
    texture : Texture2D # color buffer attachment texture
    depth : Texture2D   # depth buffer attachment texture
  end

  struct CharInfo
    value : LibC::Int     # character value (Unicode)
    rec : Rectangle       # character rectangle in sprite font
    offset_x : LibC::Int  # character offset X when drawing
    offset_y : LibC::Int  # character offset Y when drawing
    advance_x : LibC::Int # character advance position X
  end

  struct SpriteFont
    texture : Texture2D     # font texture
    base_size : LibC::Int   # base size (default chars height)
    chars_count : LibC::Int # number of characters
    chars : CharInfo*       # characters info data
  end

  struct Camera
    position : Vector3 # camera position
    target : Vector3   # camera target it looks-at
    up : Vector3       # camera up vector (rotation over its axis)
    fovy : LibC::Float # camera field-of-view apperture in Y (degrees)
  end

  struct Camera2D
    offset : Vector2       # camera offset (displacement from target)
    target : Vector2       # camera target (rotation and zoom origin)
    rotation : LibC::Float # camera rotation in degrees
    zoom : LibC::Float     # camera zoom (scaling), should be 1.0f by default
  end

  struct BoundingBox
    min : Vector3 # minimum vertex box-corner
    max : Vector3 # maximum vertex box-corner
  end

  struct Mesh
    vertex_count : LibC::Int   # number of vertices stored in arrays
    triangle_count : LibC::Int # number of triangles stored (indexed or not)

    vertices : LibC::Float*   # vertex position (xyz - 3 components per vertex) (shader-location = 0)
    texcoords : LibC::Float*  # vertex texture coordinates (uv - 2 components per vertex) (shader-location = 1)
    texcoords2 : LibC::Float* # vertex second texture coordinates (useful for lightmaps) (shader-location = 5)
    normals : LibC::Float*    # vertex normals (xyz - 3 components per vertex) (shader-location = 2)
    tangents : LibC::Float*   # vertex tangents (xyz - 3 components per vertex) (shader-location = 4)
    colors : UInt8*           # vertex colors (rgba - 4 components per vertex) (shader-location = 3)
    indices : LibC::UShort*   # vertex indices (in case vertex data comes indexed)

    vao_id : LibC::UInt    # opengl vertex array object id
    vbo_id : LibC::UInt[7] # opengl vertex buffer objects id (7 types of vertex data)
  end

  struct Shader
    id : LibC::UInt                        # shader program id
    locs : LibC::Int[MAX_SHADER_LOCATIONS] # shader locations array
  end

  struct MaterialMap
    texture : Texture2D # material map texture
    color : Color       # material map color
    value : LibC::Float # material map value
  end

  struct Material
    shader : Shader                       # material shader
    maps : MaterialMap[MAX_MATERIAL_MAPS] # material maps
    params : LibC::Float*                 # material generic parameters (if required)
  end

  struct Model
    mesh : Mesh         # vertex data buffers (ram and vram)
    transform : Matrix  # local transform matrix
    material : Material # shader and textures data
  end

  struct Ray
    position : Vector3  # ray position (origin)
    direction : Vector3 # ray direction
  end

  struct RayHitInfo
    hit : Bool             # did the ray hit something?
    distance : LibC::Float # distance to nearest hit
    position : Vector3     # position of nearest hit
    normal : Vector3       # surface normal of hit
  end

  struct Wave
    sample_count : LibC::UInt # number of samples
    sample_rate : LibC::UInt  # frequency (samples per second)
    sample_size : LibC::UInt  # bit depth (bits per sample): 8, 16, 32 (24 not supported)
    channels : LibC::UInt     # number of channels (1-mono, 2-stereo)
    data : Void*              # buffer data pointer
  end

  struct Sound
    source : LibC::UInt # openal audio source id
    buffer : LibC::UInt # openal audio buffer id
    format : LibC::Int  # openal audio format specifier
  end

  type Music = Void*

  struct AudioStream
    sample_rate : LibC::UInt # frequency (samples per second)
    sample_size : LibC::UInt # bit depth (bits per sample): 8, 16, 32 (24 not supported)
    channels : LibC::UInt    # number of channels (1-mono, 2-stereo)

    format : LibC::Int      # openal audio format specifier
    source : LibC::UInt     # openal audio source id
    buffers : LibC::UInt[2] # openal audio buffers (double buffering)
  end

  struct RRESData
    type : LibC::UInt # resource type (4 byte)

    param1 : LibC::UInt # resouce parameter 1 (4 byte)
    param2 : LibC::UInt # resouce parameter 2 (4 byte)
    param3 : LibC::UInt # resouce parameter 3 (4 byte)
    param4 : LibC::UInt # resouce parameter 4 (4 byte)

    data : Void* # resource data pointer (4 byte)
  end

  type RRES = Void*

  struct VrDeviceInfo
    h_resolution : LibC::Int                # hmd horizontal resolution in pixels
    v_resolution : LibC::Int                # hmd vertical resolution in pixels
    h_screen_size : LibC::Float             # hmd horizontal size in meters
    v_screen_size : LibC::Float             # hmd vertical size in meters
    v_screen_center : LibC::Float           # hmd screen center in meters
    eye_to_screen_distance : LibC::Float    # hmd distance between eye and display in meters
    lens_separation_distance : LibC::Float  # hmd lens separation distance in meters
    interpupillary_distance : LibC::Float   # hmd ipd (distance between pupils) in meters
    lens_distortion_values : LibC::Float[4] # hmd lens distortion constant parameters
    chroma_ab_correction : LibC::Float[4]   # hmd chromatic aberration correction parameters
  end
end
