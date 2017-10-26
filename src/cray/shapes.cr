require "./structs"

lib LibRay
  # basic shapes drawing functions
  fun draw_pixel = DrawPixel(pos_x : LibC::Int, pos_y : LibC::Int, color : Color) : Void
  fun draw_pixel_v = DrawPixelV(position : Vector2, color : Color) : Void

  fun draw_line = DrawLine(start_pos_x : LibC::Int, start_pos_y : LibC::Int, end_pos_x : LibC::Int, end_pos_y : LibC::Int, color : Color) : Void
  fun draw_line_v = DrawLineV(start_pos : Vector2, end_pos : Vector2, color : Color) : Void
  fun draw_line_bezier = DrawLineBezier(start_pos : Vector2, end_pos : Vector2, thick : LibC::Float, color : Color) : Void

  fun draw_circle = DrawCircle(center_x : LibC::Int, center_y : LibC::Int, radius : LibC::Float, color : Color) : Void
  fun draw_circle_gradient = DrawCircleGradient(center_x : LibC::Int, center_y : LibC::Int, radius : LibC::Float, color1 : Color, color2 : Color) : Void
  fun draw_circle_v = DrawCircleV(center : Vector2, radius : LibC::Float, color : Color) : Void
  fun draw_circle_lines = DrawCircleLines(center_x : LibC::Int, center_y : LibC::Int, radius : LibC::Float, color : Color) : Void

  fun draw_rectangle = DrawRectangle(pos_x : LibC::Int, pos_y : LibC::Int, width : LibC::Int, height : LibC::Int, color : Color) : Void
  fun draw_rectangle_rec = DrawRectangleRec(rec : Rectangle, color : Color) : Void
  fun draw_rectangle_pro = DrawRectanglePro(rec : Rectangle, origin : Vector2, rotation : LibC::Float, color : Color) : Void
  fun draw_rectangle_gradient_v = DrawRectangleGradientV(pos_x : LibC::Int, pos_y : LibC::Int, width : LibC::Int, height : LibC::Int, color1 : Color, color2 : Color) : Void
  fun draw_rectangle_gradient_h = DrawRectangleGradientH(pos_x : LibC::Int, pos_y : LibC::Int, width : LibC::Int, height : LibC::Int, color1 : Color, color2 : Color) : Void
  fun draw_rectangle_gradient_ex = DrawRectangleGradientEx(rec : Rectangle, color1 : Color, color2 : Color, color3 : Color, color4 : Color) : Void
  fun draw_rectangle_v = DrawRectangleV(position : Vector2, size : Vector2, color : Color) : Void
  fun draw_rectangle_lines = DrawRectangleLines(pos_x : LibC::Int, pos_y : LibC::Int, width : LibC::Int, height : LibC::Int, color : Color) : Void
  fun draw_rectangle_t = DrawRectangleT(pos_x : LibC::Int, pos_y : LibC::Int, width : LibC::Int, height : LibC::Int, color : Color) : Void

  fun draw_triangle = DrawTriangle(v1 : Vector2, v2 : Vector2, v3 : Vector2, color : Color) : Void
  fun draw_triangle_lines = DrawTriangleLines(v1 : Vector2, v2 : Vector2, v3 : Vector2, color : Color) : Void

  fun draw_poly = DrawPoly(center : Vector2, sides : LibC::Int, radius : LibC::Float, rotation : LibC::Float, color : Color) : Void
  fun draw_poly_ex = DrawPolyEx(points : Vector2*, num_points : LibC::Int, color : Color) : Void
  fun draw_poly_ex_lines = DrawPolyExLines(points : Vector2*, num_points : LibC::Int, color : Color) : Void

  # basic shapes collision detection functions
  fun check_collision_recs = CheckCollisionRecs(rec1 : Rectangle, rec2 : Rectangle) : Bool
  fun check_collision_circles = CheckCollisionCircles(center1 : Vector2, radius1 : LibC::Float, center2 : Vector2, radius2 : LibC::Float) : Bool
  fun check_collision_circle_rec = CheckCollisionCircleRec(center : Vector2, radius : LibC::Float, rec : Rectangle) : Void
  fun get_collision_rec = GetCollisionRec(rec1 : Rectangle, rec2 : Rectangle) : Rectangle
  fun check_collision_point_rec = CheckCollisionPointRec(point : Vector2, rec : Rectangle) : Bool
  fun check_collision_point_circle = CheckCollisionPointCircle(point : Vector2, center : Vector2, radius : LibC::Float) : Bool
  fun check_collision_point_triangle = CheckCollisionPointTriangle(point : Vector2, v1 : Vector2, v2 : Vector2, v3 : Vector2) : Bool
end
