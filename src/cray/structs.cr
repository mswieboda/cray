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

  struct Vector4
    x : LibC::Float
    y : LibC::Float
    z : LibC::Float
    w : LibC::Float
  end

  alias Quaternion = Vector4

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
    x : LibC::Float
    y : LibC::Float
    width : LibC::Float
    height : LibC::Float
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

  struct Font
    base_size : LibC::Int   # base size (default chars height)
    chars_count : LibC::Int # number of characters
    texture : Texture2D     # characters texture atlas
    recs : Rectangle*       # characters rectangles in texture
    chars : CharInfo*       # characters info data
  end

  alias SpriteFont = Font

  struct Camera3D
    position : Vector3 # camera position
    target : Vector3   # camera target it looks-at
    up : Vector3       # camera up vector (rotation over its axis)
    fovy : LibC::Float # camera field-of-view apperture in Y (degrees) in perspective, used as near plane width in orthographic
    type : LibC::Int   # camera type, defines projection type: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
  end

  alias Camera = Camera3D

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

    anim_vertices : LibC::Float* # animated vertex positions (after bones transformations)
    anim_normals : LibC::Float* # animated normals (after bones transformations)
    bone_ids : LibC::Int* # vertex bone ids, up to 4 bones influence by vertex (skinning)
    bone_weights : LibC::Float* # vertex bone weight, up to 4 bones influence by vertex (skinning)

    vao_id : LibC::UInt    # opengl vertex array object id
    vbo_id : LibC::UInt* # opengl vertex buffer objects id (default vertex data)
  end

  struct Shader
    id : LibC::UInt # shader program id
    locs : LibC::Int* # shader locations array
  end

  struct MaterialMap
    texture : Texture2D # material map texture
    color : Color       # material map color
    value : LibC::Float # material map value
  end

  struct Material
    shader : Shader       # material shader
    maps : MaterialMap*   # material maps
    params : LibC::Float* # material generic parameters (if required)
  end

  struct Transform
    translation : Vector3
    rotation : Quaternion
    scale : Vector3
  end

  struct BoneInfo
    name : Int8[32]
    parent : LibC::Int
  end

  struct Model
    transform : Matrix  # local transform matrix
    mesh_count : LibC::Int
    meshes : Mesh*         # vertex data buffers (ram and vram)
    material_count : LibC::Int
    materials : Material* # shader and textures data
    mesh_material : LibC::Int*
    bone_count : LibC::Int
    bones : BoneInfo* # bones information (skeleton)
    bind_pose : Transform # bones base transformation (pose)
  end

  struct ModelAnimation
    bone_count : LibC::Int    # number of bones
    bones : BoneInfo*         # bones information (skeleton)
    frame_count : LibC::Int   # number of animation frames
    frame_poses : Transform** # poses array by frame
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

  struct AudioStream
    sample_rate : LibC::UInt # frequency (samples per second)
    sample_size : LibC::UInt # bit depth (bits per sample): 8, 16, 32 (24 not supported)
    channels : LibC::UInt    # number of channels (1-mono, 2-stereo)

    buffer : AudioBuffer*   # pointer to internal data used by the audio system
  end

  type AudioBuffer = Void*

  struct Sound
    sample_count : LibC::UInt # total number of samples
    stream : AudioStream      # audio stream
  end

  struct Music
    ctx_type : LibC::Int      # type of music context (audio filetype)
    ctx_data : Void*          # audio context data, depends on type

    sample_count : LibC::UInt # total number of samples
    loop_count : LibC::UInt   # loops count (times music will play)

    stream : AudioStream      # audio stream
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
