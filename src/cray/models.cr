require "./structs"

lib LibRay
  # basic geometric 3d shapes drawing functions
  fun draw_line_3d = DrawLine3D(start_pos : Vector3, end_pos : Vector3, color : Color) : Void
  fun draw_circle_3d = DrawCircle3D(start_pos : Vector3, end_pos : Vector3, color : Color) : Void
  fun draw_cube = DrawCube(position : Vector3, width : LibC::Float, height : LibC::Float, length : LibC::Float, color : Color) : Void
  fun draw_cube_v = DrawCubeV(position : Vector3, size : Vector3, color : Color) : Void
  fun draw_cube_wires = DrawCubeWires(position : Vector3, width : LibC::Float, height : LibC::Float, length : LibC::Float, color : Color) : Void
  fun draw_cube_texture = DrawCubeTexture(texture : Texture2D, position : Vector3, width : LibC::Float, height : LibC::Float, length : LibC::Float, color : Color) : Void
  fun draw_sphere = DrawSphere(center_pos : Vector3, radius : LibC::Float, color : Color) : Void
  fun draw_sphere_ex = DrawSphereEx(center_pos : Vector3, radius : LibC::Float, rings : LibC::Int, slices : LibC::Int, color : Color) : Void
  fun draw_sphere_wires = DrawSphereWires(center_pos : Vector3, radius : LibC::Float, rings : LibC::Int, slices : LibC::Int, color : Color) : Void
  fun draw_cylinder = DrawCylinder(position : Vector3, radius_top : LibC::Float, radius_bottom : LibC::Float, height : LibC::Float, slices : LibC::Int, color : Color) : Void
  fun draw_cylinder_wires = DrawCylinderWires(position : Vector3, radius_top : LibC::Float, radius_bottom : LibC::Float, height : LibC::Float, slices : LibC::Int, color : Color) : Void
  fun draw_plane = DrawPlane(center_pos : Vector3, size : Vector2, color : Color) : Void
  fun draw_ray = DrawRay(ray : Ray, color : Color) : Void
  fun draw_grid = DrawGrid(slices : LibC::Int, spacing : LibC::Float) : Void
  fun draw_gizmo = DrawGizmo(position : Vector3) : Void

  # module loading/unloading functions
  fun load_model = LoadModel(filename : LibC::Char*) : Model
  fun load_model_from_mesh = LoadModelFromMesh(mesh : Mesh) : Model
  fun unload_model = UnloadModel(model : Model) : Void

  # mesh loading/unloading functions
  fun load_mesh = LoadMesh(filename : LibC::Char*) : Mesh
  fun unload_mesh = UnloadMesh(mesh : Mesh*) : Void

  # mesh generation functions
  fun gen_mesh_plane = GenMeshPlane(width : LibC::Float, length : LibC::Float, res_x : LibC::Int, res_z : LibC::Int) : Mesh
  fun gen_mesh_cube = GenMeshCube(width : LibC::Float, height : LibC::Float, lenght : LibC::Float) : Mesh
  fun gen_mesh_sphere = GenMeshSphere(radius : LibC::Float, rings : LibC::Int, slices : LibC::Int) : Mesh
  fun gen_mesh_hemi_sphere = GenMeshHemiSphere(radius : LibC::Float, rings : LibC::Int, slices : LibC::Int) : Mesh
  fun gen_mesh_cylinder = GenMeshCylinder(radius : LibC::Float, height : LibC::Float, slices : LibC::Int) : Mesh
  fun gen_mesh_torus = GenMeshTorus(radius : LibC::Float, size : LibC::Float, rad_seg : LibC::Int, sides : LibC::Int) : Mesh
  fun gen_mesh_knot = GenMeshKnot(radius : LibC::Float, size : LibC::Float, rad_seg : LibC::Int, sides : LibC::Int) : Mesh
  fun gen_mesh_heightmap = GenMeshHeightmap(heightmap : Image, size : Vector3) : Mesh
  fun gen_mesh_cubicmap = GenMeshCubicmap(cubicmap : Image, cube_size : Vector3) : Mesh

  # material loading/unloading functions
  fun load_material = LoadMaterial(filename : LibC::Char*) : Material
  fun load_material_default = LoadMaterialDefault : Material
  fun unload_material = UnloadMaterial(material : Material) : Void

  # model drawing functions
  fun draw_model = DrawModel(model : Model, position : Vector3, scale : LibC::Float, tint : Color) : Void
  fun draw_model_ex = DrawModelEx(model : Model, position : Vector3, rotation_axis : Vector3, rotation_angle : LibC::Float, scale : Vector3, tint : Color) : Void
  fun draw_model_wires = DrawModelWires(model : Model, position : Vector3, scale : LibC::Float, tint : Color) : Void
  fun draw_model_wires_ex = DrawModelWiresEx(model : Model, position : Vector3, rotation_axis : Vector3, rotation_angle : LibC::Float, scale : Vector3, tint : Color) : Void
  fun draw_bounding_box = DrawBoundingBox(box : BoundingBox, color : Color) : Void
  fun draw_billboard = DrawBillboard(camera : Camera, texture : Texture2D, center : Vector3, size : LibC::Float, tint : Color) : Void
  fun draw_billboard_rec = DrawBillboardRec(camera : Camera, texture : Texture2D, source_rec : Rectangle, center : Vector3, size : LibC::Float, tint : Color) : Void

  # collision detection functions
  fun check_collision_spheres = CheckCollisionSpheres(center_a : Vector3, radius_a : LibC::Float, center_b : Vector3, radius_b : LibC::Float) : Bool
  fun check_collision_boxes = CheckCollisionBoxes(min_bbox_1 : Vector3, max_bbox_1 : Vector3, min_bbox_2 : Vector3, max_bbox_2 : Vector3) : Bool
  fun check_collision_box_sphere = CheckCollisionBoxSphere(min_bbox : Vector3, max_bbox : Vector3, center_sphere : Vector3, radius_sphere : LibC::Float) : Bool
  fun check_collision_ray_sphere = CheckCollisionRaySphere(ray : Ray, sphere_position : Vector3, sphere_radius : LibC::Float) : Bool
  fun check_collision_ray_sphere_ex = CheckCollisionRaySphereEx(ray : Ray, sphere_position : Vector3, sphere_radius : LibC::Float, collision_point : Vector3*) : Bool
  fun check_collision_ray_box = CheckCollisionRayBox(ray : Ray, min_bbox : Vector3, max_bbox : Vector3) : Bool
  fun calculate_bounding_box = CalculateBoundingBox(mesh : Mesh) : BoundingBox
  fun get_collision_ray_mesh = GetCollisionRayMesh(ray : Ray, mesh : Mesh*) : RayHitInfo
  fun get_collision_ray_triangle = GetCollisionRayTriangle(ray : Ray, p1 : Vector3, p2 : Vector3, p3 : Vector3) : RayHitInfo
  fun get_collision_ray_ground = GetCollisionRayGround(ray : Ray, ground_height : LibC::Float) : RayHitInfo
end
