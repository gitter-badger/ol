; OpenGL 1.0 (1991-1993)

; OpenGL base profile implementation
(define-library (OpenGL version-1-0)
 (import (otus lisp) (otus pinvoke))
 (export

   GL_VERSION_1_0

      GL_LIBRARY  ;internal variable
;     GL_VERSION

      ; todo: move to the right place
      GL_RGB GL_UNSIGNED_BYTE GL_RGBA

      ; WGL/GLX/CGL universal functions
      gl:GetProcAddress

      gl:CreateContext
      gl:MakeCurrent
      gl:SwapBuffers

      gl:GetVersion
      gl:ExtensionSupported?


      ; GL types
      ; https://www.opengl.org/wiki/OpenGL_Type
      GLenum            ; unsigned 32-bit
      GLboolean         ; unsigned 1+-bit (GL_TRUE or GL_FALSE)
      GLbitfield        ; unsigned 32-bit
      GLbyte            ;   signed  8-bit
      GLshort           ;   signed 16-bit
      GLint    GLint*   ;   signed 32-bit
      GLsizei           ;   signed 32-bit (non negative)
      GLubyte  GLubyte* ; unsigned  8-bit
      GLushort          ; unsigned 16-bit
      GLuint   GLuint*  ; unsigned 32-bit

      GLfloat  GLfloat* ; floating 32-bit
      GLclampf          ; floating 32-bit (clamped to the range [0,1])
      GLdouble          ; floating 64-bit
      GLclampd          ; floating 64-bit (clamped to the range [0,1])

      GLboolean*

      GLvoid   GLvoid*

      GL_TRUE GL_FALSE                 ; 1, 0

   glAccum                             ; void (GLenum op, GLfloat value)
   ; op
      GL_ACCUM
      GL_LOAD
      GL_RETURN
      GL_MULT
      GL_ADD
   ; value

   glAlphaFunc                         ; void (GLenum func, GLclampf ref)
   ; func
      GL_NEVER
      GL_LESS
      GL_EQUAL
      GL_LEQUAL
      GL_GREATER
      GL_NOTEQUAL
      GL_GEQUAL
      GL_ALWAYS
   ; ref

   glBegin                             ; void (GLenum mode)
   ; mode
      GL_POINTS
      GL_LINES
      GL_LINE_LOOP
      GL_LINE_STRIP
      GL_TRIANGLES
      GL_TRIANGLE_STRIP
      GL_TRIANGLE_FAN
      GL_QUADS
      GL_QUAD_STRIP
      GL_POLYGON

   glBitmap                            ; void (GLsizei width, GLsizei height, GLfloat xorig, GLfloat yorig, GLfloat xmove, GLfloat ymove, const GLubyte *bitmap)

   glBlendFunc                         ; void (GLenum sfactor, GLenum dfactor)
   ; sfactor
      GL_ZERO
      GL_ONE
      GL_SRC_COLOR
      GL_ONE_MINUS_SRC_COLOR
      GL_SRC_ALPHA
      GL_ONE_MINUS_SRC_ALPHA
      GL_DST_ALPHA
      GL_ONE_MINUS_DST_ALPHA
   ; dfactor
      GL_ZERO
      GL_ONE
      GL_DST_COLOR
      GL_ONE_MINUS_DST_COLOR
      GL_SRC_ALPHA_SATURATE
      GL_SRC_ALPHA
      GL_ONE_MINUS_SRC_ALPHA
      GL_DST_ALPHA
      GL_ONE_MINUS_DST_ALPHA

   glCallList                          ; void (GLuint list)

   glCallLists                         ; void (GLsizei n, GLenum type, const GLvoid *lists)

   glClear                             ; void (GLbitfield mask)
   ; mask
      GL_COLOR_BUFFER_BIT
      GL_ACCUM_BUFFER_BIT
      GL_STENCIL_BUFFER_BIT
      GL_DEPTH_BUFFER_BIT

   glClearAccum                        ; void (GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)
   glClearColor                        ; void (GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)
   glClearDepth                        ; void (GLclampd depth)
   glClearIndex                        ; void (GLfloat c)
   glClearStencil                      ; void (GLint s)

   glClipPlane                         ; void (GLenum plane, const GLdouble *equation)
   ; plane
      GL_CLIP_PLANE0
      GL_CLIP_PLANE1
      GL_CLIP_PLANE2
      GL_CLIP_PLANE3
      GL_CLIP_PLANE4
      GL_CLIP_PLANE5

   glColor3b    ; void (GLbyte red, GLbyte green, GLbyte blue)
;WINGDIAPI void APIENTRY glColor3bv (const GLbyte *v);
;WINGDIAPI void APIENTRY glColor3d (GLdouble red, GLdouble green, GLdouble blue);
;WINGDIAPI void APIENTRY glColor3dv (const GLdouble *v);
   glColor3f  ; void (GLfloat red, GLfloat green, GLfloat blue)
   glColor3fv ; void (const GLfloat *v)
   glColor3i  ; void (GLint red, GLint green, GLint blue)
;WINGDIAPI void APIENTRY glColor3iv (const GLint *v);
;WINGDIAPI void APIENTRY glColor3s (GLshort red, GLshort green, GLshort blue);
;WINGDIAPI void APIENTRY glColor3sv (const GLshort *v);
   glColor3ub ; void (GLubyte red, GLubyte green, GLubyte blue)
;WINGDIAPI void APIENTRY glColor3ubv (const GLubyte *v);
;WINGDIAPI void APIENTRY glColor3ui (GLuint red, GLuint green, GLuint blue);
;WINGDIAPI void APIENTRY glColor3uiv (const GLuint *v);
;WINGDIAPI void APIENTRY glColor3us (GLushort red, GLushort green, GLushort blue);
;WINGDIAPI void APIENTRY glColor3usv (const GLushort *v);
;WINGDIAPI void APIENTRY glColor4b (GLbyte red, GLbyte green, GLbyte blue, GLbyte alpha);
;WINGDIAPI void APIENTRY glColor4bv (const GLbyte *v);
;WINGDIAPI void APIENTRY glColor4d (GLdouble red, GLdouble green, GLdouble blue, GLdouble alpha);
;WINGDIAPI void APIENTRY glColor4dv (const GLdouble *v);
   glColor4f ; void (GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)
;WINGDIAPI void APIENTRY glColor4fv (const GLfloat *v);
;WINGDIAPI void APIENTRY glColor4i (GLint red, GLint green, GLint blue, GLint alpha);
;WINGDIAPI void APIENTRY glColor4iv (const GLint *v);
;WINGDIAPI void APIENTRY glColor4s (GLshort red, GLshort green, GLshort blue, GLshort alpha);
;WINGDIAPI void APIENTRY glColor4sv (const GLshort *v);
;WINGDIAPI void APIENTRY glColor4ub (GLubyte red, GLubyte green, GLubyte blue, GLubyte alpha);
;WINGDIAPI void APIENTRY glColor4ubv (const GLubyte *v);
;WINGDIAPI void APIENTRY glColor4ui (GLuint red, GLuint green, GLuint blue, GLuint alpha);
;WINGDIAPI void APIENTRY glColor4uiv (const GLuint *v);
;WINGDIAPI void APIENTRY glColor4us (GLushort red, GLushort green, GLushort blue, GLushort alpha);
;WINGDIAPI void APIENTRY glColor4usv (const GLushort *v);

   glColorMask                         ; void (GLboolean red, GLboolean green, GLboolean blue, GLboolean alpha)

   glColorMaterial                     ; void (GLenum face, GLenum mode)
   ; face
      GL_FRONT
      GL_BACK
      GL_FRONT_AND_BACK
   ; mode
      GL_AMBIENT
      GL_DIFFUSE
      GL_SPECULAR
      GL_EMISSION
      GL_SHININESS
      GL_AMBIENT_AND_DIFFUSE

   glCopyPixels                        ; void (GLint x, GLint y, GLsizei width, GLsizei height, GLenum type)

   glCullFace                          ; void (GLenum mode)
   ; mode
      GL_FRONT
      GL_BACK
      GL_FRONT_AND_BACK

   glDeleteLists                       ; void (GLuint list, GLsizei range)

   glDepthFunc                         ; void (GLenum func)
   ; func
      GL_NEVER
      GL_LESS
      GL_EQUAL
      GL_LEQUAL
      GL_GREATER
      GL_NOTEQUAL
      GL_GEQUAL
      GL_ALWAYS

   glDepthMask                         ; void (GLboolean flag)

   glDepthRange                        ; void (GLclampd zNear, GLclampd zFar)

   glDisable                           ; void (GLenum cap)
   ; cap
      GL_FOG
      GL_LIGHTING
      GL_TEXTURE_1D
      GL_TEXTURE_2D
      GL_LINE_STIPPLE
      GL_POLYGON_STIPPLE
      GL_CULL_FACE
      GL_ALPHA_TEST
      GL_BLEND
      GL_LOGIC_OP
      GL_DITHER
      GL_STENCIL_TEST
      GL_DEPTH_TEST
      GL_CLIP_PLANE0
      GL_CLIP_PLANE1
      GL_CLIP_PLANE2
      GL_CLIP_PLANE3
      GL_CLIP_PLANE4
      GL_CLIP_PLANE5
      GL_LIGHT0
      GL_LIGHT1
      GL_LIGHT2
      GL_LIGHT3
      GL_LIGHT4
      GL_LIGHT5
      GL_LIGHT6
      GL_LIGHT7
      GL_TEXTURE_GEN_S
      GL_TEXTURE_GEN_T
      GL_TEXTURE_GEN_R
      GL_TEXTURE_GEN_Q
      GL_MAP1_VERTEX_3
      GL_MAP1_VERTEX_4
      GL_MAP1_COLOR_4
      GL_MAP1_INDEX
      GL_MAP1_NORMAL
      GL_MAP1_TEXTURE_COORD_1
      GL_MAP1_TEXTURE_COORD_2
      GL_MAP1_TEXTURE_COORD_3
      GL_MAP1_TEXTURE_COORD_4
      GL_MAP2_VERTEX_3
      GL_MAP2_VERTEX_4
      GL_MAP2_COLOR_4
      GL_MAP2_INDEX
      GL_MAP2_NORMAL
      GL_MAP2_TEXTURE_COORD_1
      GL_MAP2_TEXTURE_COORD_2
      GL_MAP2_TEXTURE_COORD_3
      GL_MAP2_TEXTURE_COORD_4
      GL_POINT_SMOOTH
      GL_LINE_SMOOTH
      GL_POLYGON_SMOOTH
      GL_SCISSOR_TEST
      GL_COLOR_MATERIAL
      GL_NORMALIZE
      GL_AUTO_NORMAL

   glDrawBuffer                        ; void (GLenum mode)
   ; mode
      GL_NONE
      GL_FRONT_LEFT
      GL_FRONT_RIGHT
      GL_BACK_LEFT
      GL_BACK_RIGHT
      GL_FRONT
      GL_BACK
      GL_LEFT
      GL_RIGHT
      GL_FRONT_AND_BACK
      GL_AUX0
      GL_AUX1
      GL_AUX2
      GL_AUX3

   glDrawPixels                        ; void (GLsizei width, GLsizei height, GLenum format, GLenum type, const GLvoid *pixels)
;WINGDIAPI void APIENTRY glEdgeFlag (GLboolean flag);
;WINGDIAPI void APIENTRY glEdgeFlagv (const GLboolean *flag);
   glEnable ; void (GLenum cap)
   ; cap
      ; SAME as glDisable

   glEnd ; void

   glEndList ; void glEndList (void)
;WINGDIAPI void APIENTRY glEvalCoord1d (GLdouble u);
;WINGDIAPI void APIENTRY glEvalCoord1dv (const GLdouble *u);
;WINGDIAPI void APIENTRY glEvalCoord1f (GLfloat u);
;WINGDIAPI void APIENTRY glEvalCoord1fv (const GLfloat *u);
;WINGDIAPI void APIENTRY glEvalCoord2d (GLdouble u, GLdouble v);
;WINGDIAPI void APIENTRY glEvalCoord2dv (const GLdouble *u);
;WINGDIAPI void APIENTRY glEvalCoord2f (GLfloat u, GLfloat v);
;WINGDIAPI void APIENTRY glEvalCoord2fv (const GLfloat *u);
;WINGDIAPI void APIENTRY glEvalMesh1 (GLenum mode, GLint i1, GLint i2);
;WINGDIAPI void APIENTRY glEvalMesh2 (GLenum mode, GLint i1, GLint i2, GLint j1, GLint j2);
;WINGDIAPI void APIENTRY glEvalPoint1 (GLint i);
;WINGDIAPI void APIENTRY glEvalPoint2 (GLint i, GLint j);

   glFeedbackBuffer                    ; void (GLsizei size, GLenum type, GLfloat *buffer)
   ; type
      GL_2D
      GL_3D
      GL_3D_COLOR
      GL_3D_COLOR_TEXTURE
      GL_4D_COLOR_TEXTURE
   ; token
      GL_PASS_THROUGH_TOKEN
      GL_POINT_TOKEN
      GL_LINE_TOKEN
      GL_POLYGON_TOKEN
      GL_BITMAP_TOKEN
      GL_DRAW_PIXEL_TOKEN
      GL_COPY_PIXEL_TOKEN
      GL_LINE_RESET_TOKEN

   glFinish                            ; void (void)

   glFlush                             ; void (void)

   glFogf                              ; void (GLenum pname, GLfloat param)
   glFogfv                             ; void (GLenum pname, const GLfloat *params)
   glFogi                              ; void (GLenum pname, GLint param)
   glFogiv                             ; void (GLenum pname, const GLint *params)
   ; pname
      GL_LINEAR
      GL_EXP
      GL_EXP2
   ; parameter
      GL_FOG_COLOR
      GL_FOG_DENSITY
      GL_FOG_END
      GL_FOG_INDEX
      GL_FOG_MODE
      GL_FOG_START

   glFrontFace                         ; void (GLenum direction)
   ; direction
      GL_CW
      GL_CCW

;WINGDIAPI void APIENTRY glFrustum (GLdouble left, GLdouble right, GLdouble bottom, GLdouble top, GLdouble zNear, GLdouble zFar);
;WINGDIAPI GLuint APIENTRY glGenLists (GLsizei range);

   glGetBooleanv                       ; void (GLenum pname, GLboolean *params)
   glGetDoublev                        ; void (GLenum pname, GLdouble *params)
   glGetFloatv                         ; void (GLenum pname, GLfloat *params)
   glGetIntegerv                       ; void (GLenum pname, GLint *params)
   ; pname
      GL_CURRENT_COLOR
      GL_CURRENT_INDEX
      GL_CURRENT_NORMAL
      GL_CURRENT_TEXTURE_COORDS
      GL_CURRENT_RASTER_COLOR
      GL_CURRENT_RASTER_INDEX
      GL_CURRENT_RASTER_TEXTURE_COORDS
      GL_CURRENT_RASTER_POSITION
      GL_CURRENT_RASTER_POSITION_VALID
      GL_CURRENT_RASTER_DISTANCE
      GL_POINT_SMOOTH
      GL_POINT_SIZE
      GL_POINT_SIZE_RANGE
      GL_POINT_SIZE_GRANULARITY
      GL_LINE_SMOOTH
      GL_LINE_WIDTH
      GL_LINE_WIDTH_RANGE
      GL_LINE_WIDTH_GRANULARITY
      GL_LINE_STIPPLE
      GL_LINE_STIPPLE_PATTERN
      GL_LINE_STIPPLE_REPEAT
      GL_LIST_MODE
      GL_MAX_LIST_NESTING
      GL_LIST_BASE
      GL_LIST_INDEX
      GL_POLYGON_MODE
      GL_POLYGON_SMOOTH
      GL_POLYGON_STIPPLE
      GL_EDGE_FLAG
      GL_CULL_FACE
      GL_CULL_FACE_MODE
      GL_FRONT_FACE
      GL_LIGHTING
      GL_LIGHT_MODEL_LOCAL_VIEWER
      GL_LIGHT_MODEL_TWO_SIDE
      GL_LIGHT_MODEL_AMBIENT
      GL_SHADE_MODEL
      GL_COLOR_MATERIAL_FACE
      GL_COLOR_MATERIAL_PARAMETER
      GL_COLOR_MATERIAL
      GL_FOG
      GL_FOG_INDEX
      GL_FOG_DENSITY
      GL_FOG_START
      GL_FOG_END
      GL_FOG_MODE
      GL_FOG_COLOR
      GL_DEPTH_RANGE
      GL_DEPTH_TEST
      GL_DEPTH_WRITEMASK
      GL_DEPTH_CLEAR_VALUE
      GL_DEPTH_FUNC
      GL_ACCUM_CLEAR_VALUE
      GL_STENCIL_TEST
      GL_STENCIL_CLEAR_VALUE
      GL_STENCIL_FUNC
      GL_STENCIL_VALUE_MASK
      GL_STENCIL_FAIL
      GL_STENCIL_PASS_DEPTH_FAIL
      GL_STENCIL_PASS_DEPTH_PASS
      GL_STENCIL_REF
      GL_STENCIL_WRITEMASK
      GL_MATRIX_MODE
      GL_NORMALIZE
      GL_VIEWPORT
      GL_MODELVIEW_STACK_DEPTH
      GL_PROJECTION_STACK_DEPTH
      GL_TEXTURE_STACK_DEPTH
      GL_MODELVIEW_MATRIX
      GL_PROJECTION_MATRIX
      GL_TEXTURE_MATRIX
      GL_ATTRIB_STACK_DEPTH
      GL_ALPHA_TEST
      GL_ALPHA_TEST_FUNC
      GL_ALPHA_TEST_REF
      GL_DITHER
      GL_BLEND_DST
      GL_BLEND_SRC
      GL_BLEND
      GL_LOGIC_OP_MODE
      GL_LOGIC_OP
      GL_AUX_BUFFERS
      GL_DRAW_BUFFER
      GL_READ_BUFFER
      GL_SCISSOR_BOX
      GL_SCISSOR_TEST
      GL_INDEX_CLEAR_VALUE
      GL_INDEX_WRITEMASK
      GL_COLOR_CLEAR_VALUE
      GL_COLOR_WRITEMASK
      GL_INDEX_MODE
      GL_RGBA_MODE
      GL_DOUBLEBUFFER
      GL_STEREO
      GL_RENDER_MODE
      GL_PERSPECTIVE_CORRECTION_HINT
      GL_POINT_SMOOTH_HINT
      GL_LINE_SMOOTH_HINT
      GL_POLYGON_SMOOTH_HINT
      GL_FOG_HINT
      GL_TEXTURE_GEN_S
      GL_TEXTURE_GEN_T
      GL_TEXTURE_GEN_R
      GL_TEXTURE_GEN_Q
      GL_PIXEL_MAP_I_TO_I
      GL_PIXEL_MAP_S_TO_S
      GL_PIXEL_MAP_I_TO_R
      GL_PIXEL_MAP_I_TO_G
      GL_PIXEL_MAP_I_TO_B
      GL_PIXEL_MAP_I_TO_A
      GL_PIXEL_MAP_R_TO_R
      GL_PIXEL_MAP_G_TO_G
      GL_PIXEL_MAP_B_TO_B
      GL_PIXEL_MAP_A_TO_A
      GL_PIXEL_MAP_I_TO_I_SIZE
      GL_PIXEL_MAP_S_TO_S_SIZE
      GL_PIXEL_MAP_I_TO_R_SIZE
      GL_PIXEL_MAP_I_TO_G_SIZE
      GL_PIXEL_MAP_I_TO_B_SIZE
      GL_PIXEL_MAP_I_TO_A_SIZE
      GL_PIXEL_MAP_R_TO_R_SIZE
      GL_PIXEL_MAP_G_TO_G_SIZE
      GL_PIXEL_MAP_B_TO_B_SIZE
      GL_PIXEL_MAP_A_TO_A_SIZE
      GL_UNPACK_SWAP_BYTES
      GL_UNPACK_LSB_FIRST
      GL_UNPACK_ROW_LENGTH
      GL_UNPACK_SKIP_ROWS
      GL_UNPACK_SKIP_PIXELS
      GL_UNPACK_ALIGNMENT
      GL_PACK_SWAP_BYTES
      GL_PACK_LSB_FIRST
      GL_PACK_ROW_LENGTH
      GL_PACK_SKIP_ROWS
      GL_PACK_SKIP_PIXELS
      GL_PACK_ALIGNMENT
      GL_MAP_COLOR
      GL_MAP_STENCIL
      GL_INDEX_SHIFT
      GL_INDEX_OFFSET
      GL_RED_SCALE
      GL_RED_BIAS
      GL_ZOOM_X
      GL_ZOOM_Y
      GL_GREEN_SCALE
      GL_GREEN_BIAS
      GL_BLUE_SCALE
      GL_BLUE_BIAS
      GL_ALPHA_SCALE
      GL_ALPHA_BIAS
      GL_DEPTH_SCALE
      GL_DEPTH_BIAS
      GL_MAX_EVAL_ORDER
      GL_MAX_LIGHTS
      GL_MAX_CLIP_PLANES
      GL_MAX_TEXTURE_SIZE
      GL_MAX_PIXEL_MAP_TABLE
      GL_MAX_ATTRIB_STACK_DEPTH
      GL_MAX_MODELVIEW_STACK_DEPTH
      GL_MAX_NAME_STACK_DEPTH
      GL_MAX_PROJECTION_STACK_DEPTH
      GL_MAX_TEXTURE_STACK_DEPTH
      GL_MAX_VIEWPORT_DIMS
      GL_SUBPIXEL_BITS
      GL_INDEX_BITS
      GL_RED_BITS
      GL_GREEN_BITS
      GL_BLUE_BITS
      GL_ALPHA_BITS
      GL_DEPTH_BITS
      GL_STENCIL_BITS
      GL_ACCUM_RED_BITS
      GL_ACCUM_GREEN_BITS
      GL_ACCUM_BLUE_BITS
      GL_ACCUM_ALPHA_BITS
      GL_NAME_STACK_DEPTH
      GL_AUTO_NORMAL
      GL_MAP1_COLOR_4
      GL_MAP1_INDEX
      GL_MAP1_NORMAL
      GL_MAP1_TEXTURE_COORD_1
      GL_MAP1_TEXTURE_COORD_2
      GL_MAP1_TEXTURE_COORD_3
      GL_MAP1_TEXTURE_COORD_4
      GL_MAP1_VERTEX_3
      GL_MAP1_VERTEX_4
      GL_MAP2_COLOR_4
      GL_MAP2_INDEX
      GL_MAP2_NORMAL
      GL_MAP2_TEXTURE_COORD_1
      GL_MAP2_TEXTURE_COORD_2
      GL_MAP2_TEXTURE_COORD_3
      GL_MAP2_TEXTURE_COORD_4
      GL_MAP2_VERTEX_3
      GL_MAP2_VERTEX_4
      GL_MAP1_GRID_DOMAIN
      GL_MAP1_GRID_SEGMENTS
      GL_MAP2_GRID_DOMAIN
      GL_MAP2_GRID_SEGMENTS
      GL_TEXTURE_1D
      GL_TEXTURE_2D

;WINGDIAPI void APIENTRY glGetClipPlane (GLenum plane, GLdouble *equation);
   glGetError ; GLenum  glGetError (void)
      GL_NO_ERROR
      GL_INVALID_ENUM
      GL_INVALID_VALUE
      GL_INVALID_OPERATION
      GL_STACK_OVERFLOW
      GL_STACK_UNDERFLOW
      GL_OUT_OF_MEMORY

;WINGDIAPI void APIENTRY glGetLightfv (GLenum light, GLenum pname, GLfloat *params);
;WINGDIAPI void APIENTRY glGetLightiv (GLenum light, GLenum pname, GLint *params);

;WINGDIAPI void APIENTRY glGetMapdv (GLenum target, GLenum query, GLdouble *v);
;WINGDIAPI void APIENTRY glGetMapfv (GLenum target, GLenum query, GLfloat *v);
;WINGDIAPI void APIENTRY glGetMapiv (GLenum target, GLenum query, GLint *v);
   ; target
      GL_COEFF
      GL_ORDER
      GL_DOMAIN

;WINGDIAPI void APIENTRY glGetMaterialfv (GLenum face, GLenum pname, GLfloat *params);
;WINGDIAPI void APIENTRY glGetMaterialiv (GLenum face, GLenum pname, GLint *params);

;WINGDIAPI void APIENTRY glGetPixelMapfv (GLenum map, GLfloat *values);
;WINGDIAPI void APIENTRY glGetPixelMapuiv (GLenum map, GLuint *values);
;WINGDIAPI void APIENTRY glGetPixelMapusv (GLenum map, GLushort *values);
   ; map
      GL_PIXEL_MAP_I_TO_I
      GL_PIXEL_MAP_S_TO_S
      GL_PIXEL_MAP_I_TO_R
      GL_PIXEL_MAP_I_TO_G
      GL_PIXEL_MAP_I_TO_B
      GL_PIXEL_MAP_I_TO_A
      GL_PIXEL_MAP_R_TO_R
      GL_PIXEL_MAP_G_TO_G
      GL_PIXEL_MAP_B_TO_B
      GL_PIXEL_MAP_A_TO_A

;WINGDIAPI void APIENTRY glGetPolygonStipple (GLubyte *mask);
   glGetString ; GLubyte* (GLenum name)
      GL_VENDOR
      GL_RENDERER
      GL_VERSION
      GL_EXTENSIONS
;WINGDIAPI void APIENTRY glGetTexEnvfv (GLenum target, GLenum pname, GLfloat *params);
;WINGDIAPI void APIENTRY glGetTexEnviv (GLenum target, GLenum pname, GLint *params);
;WINGDIAPI void APIENTRY glGetTexGendv (GLenum coord, GLenum pname, GLdouble *params);
;WINGDIAPI void APIENTRY glGetTexGenfv (GLenum coord, GLenum pname, GLfloat *params);
;WINGDIAPI void APIENTRY glGetTexGeniv (GLenum coord, GLenum pname, GLint *params);
;WINGDIAPI void APIENTRY glGetTexImage (GLenum target, GLint level, GLenum format, GLenum type, GLvoid *pixels);
;WINGDIAPI void APIENTRY glGetTexLevelParameterfv (GLenum target, GLint level, GLenum pname, GLfloat *params);
;WINGDIAPI void APIENTRY glGetTexLevelParameteriv (GLenum target, GLint level, GLenum pname, GLint *params);
;WINGDIAPI void APIENTRY glGetTexParameterfv (GLenum target, GLenum pname, GLfloat *params);
;WINGDIAPI void APIENTRY glGetTexParameteriv (GLenum target, GLenum pname, GLint *params);
   glHint      ; void (GLenum target, GLenum mode)
      GL_DONT_CARE ; mode
      GL_FASTEST
      GL_NICEST
      GL_PERSPECTIVE_CORRECTION_HINT ; target
      GL_POINT_SMOOTH_HINT
      GL_LINE_SMOOTH_HINT
      GL_POLYGON_SMOOTH_HINT
      GL_FOG_HINT
      ; GL_PHONG_HINT (no this constant defined, maybe bug in original headers)

;WINGDIAPI void APIENTRY glIndexMask (GLuint mask);
;WINGDIAPI void APIENTRY glIndexd (GLdouble c);
;WINGDIAPI void APIENTRY glIndexdv (const GLdouble *c);
;WINGDIAPI void APIENTRY glIndexf (GLfloat c);
;WINGDIAPI void APIENTRY glIndexfv (const GLfloat *c);
;WINGDIAPI void APIENTRY glIndexi (GLint c);
;WINGDIAPI void APIENTRY glIndexiv (const GLint *c);
;WINGDIAPI void APIENTRY glIndexs (GLshort c);
;WINGDIAPI void APIENTRY glIndexsv (const GLshort *c);
;WINGDIAPI void APIENTRY glInitNames (void);
;WINGDIAPI GLboolean APIENTRY glIsEnabled (GLenum cap);
;WINGDIAPI GLboolean APIENTRY glIsList (GLuint list);
   glLightModelf  ; void (GLenum pname, GLfloat param)
   ; name
      GL_LIGHT_MODEL_AMBIENT
      GL_LIGHT_MODEL_LOCAL_VIEWER
      GL_LIGHT_MODEL_TWO_SIDE

   ; param
;WINGDIAPI void APIENTRY glLightModelfv (GLenum pname, const GLfloat *params);
;WINGDIAPI void APIENTRY glLightModeli (GLenum pname, GLint param);
;WINGDIAPI void APIENTRY glLightModeliv (GLenum pname, const GLint *params);
;WINGDIAPI void APIENTRY glLightf (GLenum light, GLenum pname, GLfloat param);
   glLightfv ; void (GLenum light, GLenum pname, const GLfloat *params)
;WINGDIAPI void APIENTRY glLighti (GLenum light, GLenum pname, GLint param);
;WINGDIAPI void APIENTRY glLightiv (GLenum light, GLenum pname, const GLint *params);
   ; light
      GL_LIGHT0
      GL_LIGHT1
      GL_LIGHT2
      GL_LIGHT3
      GL_LIGHT4
      GL_LIGHT5
      GL_LIGHT6
      GL_LIGHT7
   ; pname
      GL_AMBIENT
      GL_DIFFUSE
      GL_SPECULAR
      GL_POSITION
      GL_SPOT_DIRECTION
      GL_SPOT_EXPONENT
      GL_SPOT_CUTOFF
      GL_CONSTANT_ATTENUATION
      GL_LINEAR_ATTENUATION
      GL_QUADRATIC_ATTENUATION

;WINGDIAPI void APIENTRY glLineStipple (GLint factor, GLushort pattern);
   glLineWidth ; void (GLfloat width)
;WINGDIAPI void APIENTRY glListBase (GLuint base);
   glLoadIdentity ; void (void);
   glLoadMatrixd  ; void (const GLdouble *m);
   glLoadMatrixf  ; void (const GLfloat *m);
;WINGDIAPI void APIENTRY glLoadName (GLuint name);
;WINGDIAPI void APIENTRY glLogicOp (GLenum opcode);
;WINGDIAPI void APIENTRY glMap1d (GLenum target, GLdouble u1, GLdouble u2, GLint stride, GLint order, const GLdouble *points);
;WINGDIAPI void APIENTRY glMap1f (GLenum target, GLfloat u1, GLfloat u2, GLint stride, GLint order, const GLfloat *points);
;WINGDIAPI void APIENTRY glMap2d (GLenum target, GLdouble u1, GLdouble u2, GLint ustride, GLint uorder, GLdouble v1, GLdouble v2, GLint vstride, GLint vorder, const GLdouble *points);
;WINGDIAPI void APIENTRY glMap2f (GLenum target, GLfloat u1, GLfloat u2, GLint ustride, GLint uorder, GLfloat v1, GLfloat v2, GLint vstride, GLint vorder, const GLfloat *points);
;WINGDIAPI void APIENTRY glMapGrid1d (GLint un, GLdouble u1, GLdouble u2);
;WINGDIAPI void APIENTRY glMapGrid1f (GLint un, GLfloat u1, GLfloat u2);
;WINGDIAPI void APIENTRY glMapGrid2d (GLint un, GLdouble u1, GLdouble u2, GLint vn, GLdouble v1, GLdouble v2);
;WINGDIAPI void APIENTRY glMapGrid2f (GLint un, GLfloat u1, GLfloat u2, GLint vn, GLfloat v1, GLfloat v2);
   glMaterialf  ; void (GLenum face, GLenum pname, GLfloat param)
   glMaterialfv ; void (GLenum face, GLenum pname, const GLfloat *params)
;WINGDIAPI void APIENTRY glMateriali (GLenum face, GLenum pname, GLint param);
;WINGDIAPI void APIENTRY glMaterialiv (GLenum face, GLenum pname, const GLint *params);
   glMatrixMode ; void (GLenum mode)
      GL_PROJECTION
      GL_MODELVIEW
      GL_TEXTURE
   glMultMatrixd ; void (const GLdouble *m)
   glMultMatrixf ; void (const GLfloat *m)
   glNewList ; void (GLuint list, GLenum mode)
   ; mode
      GL_COMPILE
      GL_COMPILE_AND_EXECUTE
;WINGDIAPI void APIENTRY glNormal3b (GLbyte nx, GLbyte ny, GLbyte nz);
;WINGDIAPI void APIENTRY glNormal3bv (const GLbyte *v);
;WINGDIAPI void APIENTRY glNormal3d (GLdouble nx, GLdouble ny, GLdouble nz);
;WINGDIAPI void APIENTRY glNormal3dv (const GLdouble *v);
   glNormal3f ; void (GLfloat nx, GLfloat ny, GLfloat nz)
;WINGDIAPI void APIENTRY glNormal3fv (const GLfloat *v);
;WINGDIAPI void APIENTRY glNormal3i (GLint nx, GLint ny, GLint nz);
;WINGDIAPI void APIENTRY glNormal3iv (const GLint *v);
;WINGDIAPI void APIENTRY glNormal3s (GLshort nx, GLshort ny, GLshort nz);
;WINGDIAPI void APIENTRY glNormal3sv (const GLshort *v);
   glOrtho ; void (GLdouble left, GLdouble right, GLdouble bottom, GLdouble top, GLdouble zNear, GLdouble zFar)
;WINGDIAPI void APIENTRY glPassThrough (GLfloat token);
;WINGDIAPI void APIENTRY glPixelMapfv (GLenum map, GLsizei mapsize, const GLfloat *values);
;WINGDIAPI void APIENTRY glPixelMapuiv (GLenum map, GLsizei mapsize, const GLuint *values);
;WINGDIAPI void APIENTRY glPixelMapusv (GLenum map, GLsizei mapsize, const GLushort *values);
;WINGDIAPI void APIENTRY glPixelStoref (GLenum pname, GLfloat param);
;WINGDIAPI void APIENTRY glPixelStorei (GLenum pname, GLint param);
;WINGDIAPI void APIENTRY glPixelTransferf (GLenum pname, GLfloat param);
;WINGDIAPI void APIENTRY glPixelTransferi (GLenum pname, GLint param);
;WINGDIAPI void APIENTRY glPixelZoom (GLfloat xfactor, GLfloat yfactor);
   glPointSize ; void (GLfloat size)
   glPolygonMode ; void (GLenum face, GLenum mode)
;WINGDIAPI void APIENTRY glPolygonStipple (const GLubyte *mask);
;WINGDIAPI void APIENTRY glPopAttrib (void);
   glPopMatrix ; void glPopMatrix (void)
;WINGDIAPI void APIENTRY glPopName (void);
;WINGDIAPI void APIENTRY glPushAttrib (GLbitfield mask);
   glPushAttrib
      GL_CURRENT_BIT                   ;0x00000001
      GL_POINT_BIT                     ;0x00000002
      GL_LINE_BIT                      ;0x00000004
      GL_POLYGON_BIT                   ;0x00000008
      GL_POLYGON_STIPPLE_BIT           ;0x00000010
      GL_PIXEL_MODE_BIT                ;0x00000020
      GL_LIGHTING_BIT                  ;0x00000040
      GL_FOG_BIT                       ;0x00000080
      GL_DEPTH_BUFFER_BIT              ;0x00000100
      GL_ACCUM_BUFFER_BIT              ;0x00000200
      GL_STENCIL_BUFFER_BIT            ;0x00000400
      GL_VIEWPORT_BIT                  ;0x00000800
      GL_TRANSFORM_BIT                 ;0x00001000
      GL_ENABLE_BIT                    ;0x00002000
      GL_COLOR_BUFFER_BIT              ;0x00004000
      GL_HINT_BIT                      ;0x00008000
      GL_EVAL_BIT                      ;0x00010000
      GL_LIST_BIT                      ;0x00020000
      GL_TEXTURE_BIT                   ;0x00040000
      GL_SCISSOR_BIT                   ;0x00080000
      GL_ALL_ATTRIB_BITS               ;0x000fffff

   glPushMatrix   ; void glPushMatrix (void)
;WINGDIAPI void APIENTRY glPushName (GLuint name);
;WINGDIAPI void APIENTRY glRasterPos2d (GLdouble x, GLdouble y);
;WINGDIAPI void APIENTRY glRasterPos2dv (const GLdouble *v);
;WINGDIAPI void APIENTRY glRasterPos2f (GLfloat x, GLfloat y);
;WINGDIAPI void APIENTRY glRasterPos2fv (const GLfloat *v);
;WINGDIAPI void APIENTRY glRasterPos2i (GLint x, GLint y);
;WINGDIAPI void APIENTRY glRasterPos2iv (const GLint *v);
;WINGDIAPI void APIENTRY glRasterPos2s (GLshort x, GLshort y);
;WINGDIAPI void APIENTRY glRasterPos2sv (const GLshort *v);
;WINGDIAPI void APIENTRY glRasterPos3d (GLdouble x, GLdouble y, GLdouble z);
;WINGDIAPI void APIENTRY glRasterPos3dv (const GLdouble *v);
;WINGDIAPI void APIENTRY glRasterPos3f (GLfloat x, GLfloat y, GLfloat z);
;WINGDIAPI void APIENTRY glRasterPos3fv (const GLfloat *v);
;WINGDIAPI void APIENTRY glRasterPos3i (GLint x, GLint y, GLint z);
;WINGDIAPI void APIENTRY glRasterPos3iv (const GLint *v);
;WINGDIAPI void APIENTRY glRasterPos3s (GLshort x, GLshort y, GLshort z);
;WINGDIAPI void APIENTRY glRasterPos3sv (const GLshort *v);
;WINGDIAPI void APIENTRY glRasterPos4d (GLdouble x, GLdouble y, GLdouble z, GLdouble w);
;WINGDIAPI void APIENTRY glRasterPos4dv (const GLdouble *v);
;WINGDIAPI void APIENTRY glRasterPos4f (GLfloat x, GLfloat y, GLfloat z, GLfloat w);
;WINGDIAPI void APIENTRY glRasterPos4fv (const GLfloat *v);
;WINGDIAPI void APIENTRY glRasterPos4i (GLint x, GLint y, GLint z, GLint w);
;WINGDIAPI void APIENTRY glRasterPos4iv (const GLint *v);
;WINGDIAPI void APIENTRY glRasterPos4s (GLshort x, GLshort y, GLshort z, GLshort w);
;WINGDIAPI void APIENTRY glRasterPos4sv (const GLshort *v);
;WINGDIAPI void APIENTRY glReadBuffer (GLenum mode);
;WINGDIAPI void APIENTRY glReadPixels (GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid *pixels);
;WINGDIAPI void APIENTRY glRectd (GLdouble x1, GLdouble y1, GLdouble x2, GLdouble y2);
;WINGDIAPI void APIENTRY glRectdv (const GLdouble *v1, const GLdouble *v2);
;WINGDIAPI void APIENTRY glRectf (GLfloat x1, GLfloat y1, GLfloat x2, GLfloat y2);
;WINGDIAPI void APIENTRY glRectfv (const GLfloat *v1, const GLfloat *v2);
;WINGDIAPI void APIENTRY glRecti (GLint x1, GLint y1, GLint x2, GLint y2);
;WINGDIAPI void APIENTRY glRectiv (const GLint *v1, const GLint *v2);
;WINGDIAPI void APIENTRY glRects (GLshort x1, GLshort y1, GLshort x2, GLshort y2);
;WINGDIAPI void APIENTRY glRectsv (const GLshort *v1, const GLshort *v2);
;WINGDIAPI GLint APIENTRY glRenderMode (GLenum mode);
;WINGDIAPI void APIENTRY glRotated (GLdouble angle, GLdouble x, GLdouble y, GLdouble z);
   glRotatef ; void (GLfloat angle, GLfloat x, GLfloat y, GLfloat z)
;WINGDIAPI void APIENTRY glScaled (GLdouble x, GLdouble y, GLdouble z);
   glScalef  ; void (GLfloat x, GLfloat y, GLfloat z)
;WINGDIAPI void APIENTRY glScissor (GLint x, GLint y, GLsizei width, GLsizei height);
;WINGDIAPI void APIENTRY glSelectBuffer (GLsizei size, GLuint *buffer);
   glShadeModel ; void (GLenum model)
      GL_FLAT
      GL_SMOOTH

;WINGDIAPI void APIENTRY glStencilFunc (GLenum func, GLint ref, GLuint mask);
;WINGDIAPI void APIENTRY glStencilMask (GLuint mask);
;WINGDIAPI void APIENTRY glStencilOp (GLenum fail, GLenum zfail, GLenum zpass);
;WINGDIAPI void APIENTRY glTexCoord1d (GLdouble s);
;WINGDIAPI void APIENTRY glTexCoord1dv (const GLdouble *v);
;WINGDIAPI void APIENTRY glTexCoord1f (GLfloat s);
;WINGDIAPI void APIENTRY glTexCoord1fv (const GLfloat *v);
;WINGDIAPI void APIENTRY glTexCoord1i (GLint s);
;WINGDIAPI void APIENTRY glTexCoord1iv (const GLint *v);
;WINGDIAPI void APIENTRY glTexCoord1s (GLshort s);
;WINGDIAPI void APIENTRY glTexCoord1sv (const GLshort *v);
;WINGDIAPI void APIENTRY glTexCoord2d (GLdouble s, GLdouble t);
;WINGDIAPI void APIENTRY glTexCoord2dv (const GLdouble *v);
   glTexCoord2f ; void (GLfloat GLfloat)
;WINGDIAPI void APIENTRY glTexCoord2fv (const GLfloat *v);
;WINGDIAPI void APIENTRY glTexCoord2i (GLint s, GLint t);
;WINGDIAPI void APIENTRY glTexCoord2iv (const GLint *v);
;WINGDIAPI void APIENTRY glTexCoord2s (GLshort s, GLshort t);
;WINGDIAPI void APIENTRY glTexCoord2sv (const GLshort *v);
;WINGDIAPI void APIENTRY glTexCoord3d (GLdouble s, GLdouble t, GLdouble r);
;WINGDIAPI void APIENTRY glTexCoord3dv (const GLdouble *v);
;WINGDIAPI void APIENTRY glTexCoord3f (GLfloat s, GLfloat t, GLfloat r);
;WINGDIAPI void APIENTRY glTexCoord3fv (const GLfloat *v);
;WINGDIAPI void APIENTRY glTexCoord3i (GLint s, GLint t, GLint r);
;WINGDIAPI void APIENTRY glTexCoord3iv (const GLint *v);
;WINGDIAPI void APIENTRY glTexCoord3s (GLshort s, GLshort t, GLshort r);
;WINGDIAPI void APIENTRY glTexCoord3sv (const GLshort *v);
;WINGDIAPI void APIENTRY glTexCoord4d (GLdouble s, GLdouble t, GLdouble r, GLdouble q);
;WINGDIAPI void APIENTRY glTexCoord4dv (const GLdouble *v);
;WINGDIAPI void APIENTRY glTexCoord4f (GLfloat s, GLfloat t, GLfloat r, GLfloat q);
;WINGDIAPI void APIENTRY glTexCoord4fv (const GLfloat *v);
;WINGDIAPI void APIENTRY glTexCoord4i (GLint s, GLint t, GLint r, GLint q);
;WINGDIAPI void APIENTRY glTexCoord4iv (const GLint *v);
;WINGDIAPI void APIENTRY glTexCoord4s (GLshort s, GLshort t, GLshort r, GLshort q);
;WINGDIAPI void APIENTRY glTexCoord4sv (const GLshort *v);
;WINGDIAPI void APIENTRY glTexEnvf (GLenum target, GLenum pname, GLfloat param);
;WINGDIAPI void APIENTRY glTexEnvfv (GLenum target, GLenum pname, const GLfloat *params);
;WINGDIAPI void APIENTRY glTexEnvi (GLenum target, GLenum pname, GLint param);
;WINGDIAPI void APIENTRY glTexEnviv (GLenum target, GLenum pname, const GLint *params);
;WINGDIAPI void APIENTRY glTexGend (GLenum coord, GLenum pname, GLdouble param);
;WINGDIAPI void APIENTRY glTexGendv (GLenum coord, GLenum pname, const GLdouble *params);
;WINGDIAPI void APIENTRY glTexGenf (GLenum coord, GLenum pname, GLfloat param);
;WINGDIAPI void APIENTRY glTexGenfv (GLenum coord, GLenum pname, const GLfloat *params);
;WINGDIAPI void APIENTRY glTexGeni (GLenum coord, GLenum pname, GLint param);
;WINGDIAPI void APIENTRY glTexGeniv (GLenum coord, GLenum pname, const GLint *params);
   glTexImage1D ; void (GLenum target, GLint level, GLint internalformat, GLsizei width, GLint border, GLenum format, GLenum type, const GLvoid *pixels)
   glTexImage2D ; void (GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const GLvoid *pixels)
;WINGDIAPI void APIENTRY glTexParameterf (GLenum target, GLenum pname, GLfloat param);
;WINGDIAPI void APIENTRY glTexParameterfv (GLenum target, GLenum pname, const GLfloat *params);
   glTexParameteri ; void (GLenum target, GLenum pname, GLint param)
      GL_TEXTURE_MAG_FILTER GL_TEXTURE_MIN_FILTER
      GL_NEAREST GL_LINEAR
;WINGDIAPI void APIENTRY glTexParameteriv (GLenum target, GLenum pname, const GLint *params);
;WINGDIAPI void APIENTRY glTranslated (GLdouble x, GLdouble y, GLdouble z);
   glTranslatef ; void (GLfloat x, GLfloat y, GLfloat z)
   glVertex2d ; void (GLdouble x, GLdouble y)
   glVertex2dv; void (const GLdouble *v)
   glVertex2f ; void (GLfloat x, GLfloat y)
   glVertex2fv; void (const GLfloat *v)
   glVertex2i ; void (GLint x, GLint y)
;WINGDIAPI void APIENTRY glVertex2iv (const GLint *v);
;WINGDIAPI void APIENTRY glVertex2s (GLshort x, GLshort y);
;WINGDIAPI void APIENTRY glVertex2sv (const GLshort *v);
   glVertex3d ; void (GLdouble x, GLdouble y, GLdouble z)
;WINGDIAPI void APIENTRY glVertex3dv (const GLdouble *v);
   glVertex3f ; void (GLfloat x, GLfloat y, GLfloat z)
   glVertex3fv; void (const GLfloat *v)
   glVertex3i ; void (GLint x, GLint y, GLint z)
;WINGDIAPI void APIENTRY glVertex3iv (const GLint *v);
;WINGDIAPI void APIENTRY glVertex3s (GLshort x, GLshort y, GLshort z);
;WINGDIAPI void APIENTRY glVertex3sv (const GLshort *v);
;WINGDIAPI void APIENTRY glVertex4d (GLdouble x, GLdouble y, GLdouble z, GLdouble w);
;WINGDIAPI void APIENTRY glVertex4dv (const GLdouble *v);
;WINGDIAPI void APIENTRY glVertex4f (GLfloat x, GLfloat y, GLfloat z, GLfloat w);
;WINGDIAPI void APIENTRY glVertex4fv (const GLfloat *v);
;WINGDIAPI void APIENTRY glVertex4i (GLint x, GLint y, GLint z, GLint w);
;WINGDIAPI void APIENTRY glVertex4iv (const GLint *v);
;WINGDIAPI void APIENTRY glVertex4s (GLshort x, GLshort y, GLshort z, GLshort w);
;WINGDIAPI void APIENTRY glVertex4sv (const GLshort *v);
   glViewport ; void (GLint x, GLint y, GLsizei width, GLsizei height)


      GLU_VERSION_1_0
      GLU_VERSION_1_1

   gluErrorString
   gluOrtho2D
   gluPerspective
   gluLookAt

   gluNewQuadric gluDeleteQuadric gluQuadricDrawStyle
      GLU_FILL GLU_LINE GLU_SILHOUETTE GLU_POINT
   gluQuadricOrientation
      GLU_OUTSIDE GLU_INSIDE

   gluSphere
   gluCylinder

;   gluNewTess gluBeginPolygon gluTessVertex

   gluNewNurbsRenderer gluNurbsSurface gluBeginSurface gluEndSurface
   gluNurbsProperty
      GLU_OUTLINE_POLYGON GLU_OUTLINE_PATCH

   GLU_U_STEP GLU_V_STEP GLU_DISPLAY_MODE

   GL_MAP1_VERTEX_3 GL_MAP2_VERTEX_3
   GL_LINE GL_FILL GL_POINT

   (exports (otus lisp))
   (exports (otus pinvoke))
)
; ============================================================================
; == implementation ==========================================================
(begin
   (define GL_VERSION_1_0 1)

; https://en.wikipedia.org/wiki/Uname
(define uname (syscall 63 #f #f #f))

(define win32? (string-ci=? (ref uname 1) "Windows")) ;
(define linux? (string-ci=? (ref uname 1) "Linux"))   ;
(define apple? (string-ci=? (ref uname 1) "Darwin")) ; https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CGL_OpenGL/index.html


(define GL_LIBRARY (c-string
   (cond
      (win32? "opengl32")
      (linux? "libGL.so")
      ;"HP-UX"
      ;"SunOS"
      ;"Darwin"
      ;"FreeBSD"
      ;"CYGWIN_NT-5.2-WOW64"
      ;"MINGW32_NT-5.2"
      ;...
      (else   (runtime-error "Unknown platform" uname)))))

(define $ (or
   (dlopen GL_LIBRARY)
   (runtime-error "Can't load OpenGL library")))
(define WGL $)
(define GLX (if linux? (dlopen "libGLX.so")))
(define GDI (if win32? (dlopen "gdi32.dll")))
;define EGL

;  Ð‘Ð°Ð·Ð¾Ð²Ð°Ñ ÑÐ¸ÑÑ‚ÐµÐ¼Ð° ÐºÐ¾Ð¾Ñ€Ð´Ð¸Ð½Ð°Ñ‚ OpenGL: http://www.intuit.ru/department/se/prcsharp/21/
; ÐŸÑ€Ð°Ð²Ð°Ñ. x-Ð½Ð°Ð¿Ñ€Ð°Ð²Ð¾, y-Ð²Ð²ÐµÑ€Ñ…, z-Ðº ÑÐµÐ±Ðµ
; Ð’ Ð¸ÑÑ…Ð¾Ð´Ð½Ð¾Ð¼ ÑÐ¾ÑÑ‚Ð¾ÑÐ½Ð¸Ð¸ OpenGL ÐºÐ°Ð¼ÐµÑ€Ð° Ð½Ð°Ñ…Ð¾Ð´Ð¸Ñ‚ÑÑ Ð² Ð½Ð°Ñ‡Ð°Ð»Ðµ Ð¼Ð¸Ñ€Ð¾Ð²Ñ‹Ñ… ÐºÐ¾Ð¾Ñ€Ð´Ð¸Ð½Ð°Ñ‚, ÑÐ¼Ð¾Ñ‚Ñ€Ð¸Ñ‚ Ð²
; Ð¾Ñ‚Ñ€Ð¸Ñ†Ð°Ñ‚ÐµÐ»ÑŒÐ½ÑƒÑŽ ÑÑ‚Ð¾Ñ€Ð¾Ð½Ñƒ Ð¾ÑÐ¸ z, Ð½Ð°Ð¿Ñ€Ð°Ð²Ð»ÑÑŽÑ‰Ð¸Ð¹ Ð²ÐµÐºÑ‚Ð¾Ñ€ ÐºÐ°Ð¼ÐµÑ€Ñ‹ (Ð½Ð¾Ñ€Ð¼Ð°Ð»ÑŒ) ÑÐ¾Ð²Ð¿Ð°Ð´Ð°ÐµÑ‚ Ñ Ð¾ÑÑŒÑŽ
; Oy (ÐºÐ°Ð¼ÐµÑ€Ð° ÑÑ‚Ð¾Ð¸Ñ‚ Ð½Ð° Ð¿Ð»Ð¾ÑÐºÐ¾ÑÑ‚Ð¸ xOz).
;  GL_MODELVIEW: ÐœÐ¾Ð´ÐµÐ»ÑŒÐ½Ñ‹Ðµ Ð¿Ñ€ÐµÐ¾Ð±Ñ€Ð°Ð·Ð¾Ð²Ð°Ð½Ð¸Ñ (Ð¼Ð¾Ð´ÐµÐ»ÑŒÐ½Ð¾-Ð²Ð¸Ð´Ð¾Ð²Ð°Ñ Ð¼Ð°Ñ‚Ñ€Ð¸Ñ†Ð°) - Ð¿Ñ€Ð¸Ð¼ÐµÐ½ÑÑŽÑ‚ÑÑ Ðº Ñ€Ð°Ð·Ð¼ÐµÑ‰ÐµÐ½Ð¸ÑŽ Ð¾Ð±ÑŠÐµÐºÑ‚Ð¾Ð² Ð½Ð° ÑÑ†ÐµÐ½Ðµ.
;  GL_PROJECTION: Ð’Ð¸Ð´Ð¾Ð²Ñ‹Ðµ Ð¿Ñ€ÐµÐ¾Ð±Ñ€Ð°Ð·Ð¾Ð²Ð°Ð½Ð¸Ñ (Ð¿Ñ€Ð¾ÐµÐºÑ†Ð¸Ð¾Ð½Ð½Ð°Ñ Ð¼Ð°Ñ‚Ñ€Ð¸Ñ†Ð°) - Ð¿Ñ€Ð¸Ð¼ÐµÐ½ÑÑŽÑ‚ÑÑ Ðº Ñ€Ð°Ð·Ð¼ÐµÑ‰ÐµÐ½Ð¸ÑŽ Ð¸ Ð¾Ñ€Ð¸ÐµÐ½Ñ‚Ð°Ñ†Ð¸Ð¸ Ñ‚Ð¾Ñ‡ÐºÐ¸ Ð¾Ð±Ð·Ð¾Ñ€Ð° (Ð½Ð°ÑÑ‚Ñ€Ð¾Ð¹ÐºÐ° ÐºÐ°Ð¼ÐµÑ€Ñ‹).
;  GL_TEXTURE: Ð¢ÐµÐºÑÑ‚ÑƒÑ€Ð½Ñ‹Ðµ Ð¿Ñ€ÐµÐ¾Ð±Ñ€Ð°Ð·Ð¾Ð²Ð°Ð½Ð¸Ñ (Ñ‚ÐµÐºÑÑ‚ÑƒÑ€Ð½Ð°Ñ Ð¼Ð°Ñ‚Ñ€Ð¸Ñ†Ð°) - Ð¿Ñ€Ð¸Ð¼ÐµÐ½ÑÑŽÑ‚ÑÑ Ð´Ð»Ñ ÑƒÐ¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ñ Ñ‚ÐµÐºÑÑ‚ÑƒÑ€Ð°Ð¼Ð¸ Ð·Ð°Ð¿Ð¾Ð»Ð½ÐµÐ½Ð¸Ñ Ð¾Ð±ÑŠÐµÐºÑ‚Ð¾Ð². (?)

   (define GLvoid   type-void)   ; void GLvoid
   (define GLvoid*  type-void*)

   (define GLenum   type-fix+)   ; typedef unsigned int GLenum
   (define GLboolean  type-fix+) ; typedef unsigned char GLboolean
   (define GLboolean* type-void*)
   (define GLbitfield type-fix+) ; typedef unsigned int GLbitfield

   (define GLbyte   type-fix+)   ; typedef signed char
   (define GLshort  type-fix+)   ; typedef short
   (define GLint    type-fix+)   ; typedef int GLint
   (define GLint*   type-void*)
   (define GLsizei  type-fix+)   ; typedef int GLsizei
   (define GLubyte  type-fix+)   ; typedef unsigned char
   (define GLushort type-fix+)   ; typedef unsigned chort
   (define GLuint   type-fix+)   ; typedef unsigned int
   (define GLuint*  type-void*)

   (define GLfloat  type-float)  ; typedef float GLfloat
   (define GLclampf type-float)  ; typedef float GLclampf
   (define GLdouble type-double) ; typedef double GLdouble
   (define GLclampd type-double) ; typedef dluble GLclampd

   (define GLubyte* type-string)

   ; references
   (define GLfloat*  (vm:or GLfloat  #x40))
   (define GLdouble* (vm:or GLdouble #x40))


   (define GL_TRUE  1)
   (define GL_FALSE 0)

   (define GL_ACCUM               #x0100)
   (define GL_LOAD                #x0101)
   (define GL_RETURN              #x0102)
   (define GL_MULT                #x0103)
   (define GL_ADD                 #x0104)

   (define GL_NEVER               #x0200)
   (define GL_LESS                #x0201)
   (define GL_EQUAL               #x0202)
   (define GL_LEQUAL              #x0203)
   (define GL_GREATER             #x0204)
   (define GL_NOTEQUAL            #x0205)
   (define GL_GEQUAL              #x0206)
   (define GL_ALWAYS              #x0207)

   (define GL_CURRENT_BIT         #x00000001)
   (define GL_POINT_BIT           #x00000002)
   (define GL_LINE_BIT            #x00000004)
   (define GL_POLYGON_BIT         #x00000008)
   (define GL_POLYGON_STIPPLE_BIT #x00000010)
   (define GL_PIXEL_MODE_BIT      #x00000020)
   (define GL_LIGHTING_BIT        #x00000040)
   (define GL_FOG_BIT             #x00000080)
   (define GL_DEPTH_BUFFER_BIT    #x00000100)
   (define GL_ACCUM_BUFFER_BIT    #x00000200)
   (define GL_STENCIL_BUFFER_BIT  #x00000400)
   (define GL_VIEWPORT_BIT        #x00000800)
   (define GL_TRANSFORM_BIT       #x00001000)
   (define GL_ENABLE_BIT          #x00002000)
   (define GL_COLOR_BUFFER_BIT    #x00004000)
   (define GL_HINT_BIT            #x00008000)
   (define GL_EVAL_BIT            #x00010000)
   (define GL_LIST_BIT            #x00020000)
   (define GL_TEXTURE_BIT         #x00040000)
   (define GL_SCISSOR_BIT         #x00080000)
   (define GL_ALL_ATTRIB_BITS     #x000FFFFF)

   (define GL_POINTS              #x0000)
   (define GL_LINES               #x0001)
   (define GL_LINE_LOOP           #x0002)
   (define GL_LINE_STRIP          #x0003)
   (define GL_TRIANGLES           #x0004)
   (define GL_TRIANGLE_STRIP      #x0005)
   (define GL_TRIANGLE_FAN        #x0006)
   (define GL_QUADS               #x0007)
   (define GL_QUAD_STRIP          #x0008)
   (define GL_POLYGON             #x0009)

   (define GL_ZERO                0)
   (define GL_ONE                 1)
   (define GL_SRC_COLOR           #x0300)
   (define GL_ONE_MINUS_SRC_COLOR #x0301)
   (define GL_SRC_ALPHA           #x0302)
   (define GL_ONE_MINUS_SRC_ALPHA #x0303)
   (define GL_DST_ALPHA           #x0304)
   (define GL_ONE_MINUS_DST_ALPHA #x0305)

   (define GL_DST_COLOR           #x0306)
   (define GL_ONE_MINUS_DST_COLOR #x0307)
   (define GL_SRC_ALPHA_SATURATE  #x0308)

   (define GL_CLIP_PLANE0 #x3000)
   (define GL_CLIP_PLANE1 #x3001)
   (define GL_CLIP_PLANE2 #x3002)
   (define GL_CLIP_PLANE3 #x3003)
   (define GL_CLIP_PLANE4 #x3004)
   (define GL_CLIP_PLANE5 #x3005)

   (define GL_NONE 0)
   (define GL_FRONT_LEFT #x0400)
   (define GL_FRONT_RIGHT #x0401)
   (define GL_BACK_LEFT #x0402)
   (define GL_BACK_RIGHT #x0403)
   (define GL_FRONT #x0404)
   (define GL_BACK #x0405)
   (define GL_LEFT #x0406)
   (define GL_RIGHT #x0407)
   (define GL_FRONT_AND_BACK #x0408)
   (define GL_AUX0 #x0409)
   (define GL_AUX1 #x040A)
   (define GL_AUX2 #x040B)
   (define GL_AUX3 #x040C)

   (define GL_NO_ERROR 0)
   (define GL_INVALID_ENUM #x0500)
   (define GL_INVALID_VALUE #x0501)
   (define GL_INVALID_OPERATION #x0502)
   (define GL_STACK_OVERFLOW #x0503)
   (define GL_STACK_UNDERFLOW #x0504)
   (define GL_OUT_OF_MEMORY #x0505)

   (define GL_2D #x0600)
   (define GL_3D #x0601)
   (define GL_3D_COLOR #x0602)
   (define GL_3D_COLOR_TEXTURE #x0603)
   (define GL_4D_COLOR_TEXTURE #x0604)

   (define GL_PASS_THROUGH_TOKEN #x0700)
   (define GL_POINT_TOKEN #x0701)
   (define GL_LINE_TOKEN #x0702)
   (define GL_POLYGON_TOKEN #x0703)
   (define GL_BITMAP_TOKEN #x0704)
   (define GL_DRAW_PIXEL_TOKEN #x0705)
   (define GL_COPY_PIXEL_TOKEN #x0706)
   (define GL_LINE_RESET_TOKEN #x0707)

   (define GL_EXP #x0800)
   (define GL_EXP2 #x0801)

   (define GL_CW #x0900)
   (define GL_CCW #x0901)

   (define GL_COEFF #x0A00)
   (define GL_ORDER #x0A01)
   (define GL_DOMAIN #x0A02)

   (define GL_CURRENT_COLOR #x0B00)
   (define GL_CURRENT_INDEX #x0B01)
   (define GL_CURRENT_NORMAL #x0B02)
   (define GL_CURRENT_TEXTURE_COORDS #x0B03)
   (define GL_CURRENT_RASTER_COLOR #x0B04)
   (define GL_CURRENT_RASTER_INDEX #x0B05)
   (define GL_CURRENT_RASTER_TEXTURE_COORDS #x0B06)
   (define GL_CURRENT_RASTER_POSITION #x0B07)
   (define GL_CURRENT_RASTER_POSITION_VALID #x0B08)
   (define GL_CURRENT_RASTER_DISTANCE #x0B09)
   (define GL_POINT_SMOOTH #x0B10)
   (define GL_POINT_SIZE #x0B11)
   (define GL_POINT_SIZE_RANGE #x0B12)
   (define GL_POINT_SIZE_GRANULARITY #x0B13)
   (define GL_LINE_SMOOTH #x0B20)
   (define GL_LINE_WIDTH #x0B21)
   (define GL_LINE_WIDTH_RANGE #x0B22)
   (define GL_LINE_WIDTH_GRANULARITY #x0B23)
   (define GL_LINE_STIPPLE #x0B24)
   (define GL_LINE_STIPPLE_PATTERN #x0B25)
   (define GL_LINE_STIPPLE_REPEAT #x0B26)
   (define GL_LIST_MODE #x0B30)
   (define GL_MAX_LIST_NESTING #x0B31)
   (define GL_LIST_BASE #x0B32)
   (define GL_LIST_INDEX #x0B33)
   (define GL_POLYGON_MODE #x0B40)
   (define GL_POLYGON_SMOOTH #x0B41)
   (define GL_POLYGON_STIPPLE #x0B42)
   (define GL_EDGE_FLAG #x0B43)
   (define GL_CULL_FACE #x0B44)
   (define GL_CULL_FACE_MODE #x0B45)
   (define GL_FRONT_FACE #x0B46)
   (define GL_LIGHTING #x0B50)
   (define GL_LIGHT_MODEL_LOCAL_VIEWER #x0B51)
   (define GL_LIGHT_MODEL_TWO_SIDE #x0B52)
   (define GL_LIGHT_MODEL_AMBIENT #x0B53)
   (define GL_SHADE_MODEL #x0B54)
   (define GL_COLOR_MATERIAL_FACE #x0B55)
   (define GL_COLOR_MATERIAL_PARAMETER #x0B56)
   (define GL_COLOR_MATERIAL #x0B57)
   (define GL_FOG #x0B60)
   (define GL_FOG_INDEX #x0B61)
   (define GL_FOG_DENSITY #x0B62)
   (define GL_FOG_START #x0B63)
   (define GL_FOG_END #x0B64)
   (define GL_FOG_MODE #x0B65)
   (define GL_FOG_COLOR #x0B66)
   (define GL_DEPTH_RANGE #x0B70)
   (define GL_DEPTH_TEST #x0B71)
   (define GL_DEPTH_WRITEMASK #x0B72)
   (define GL_DEPTH_CLEAR_VALUE #x0B73)
   (define GL_DEPTH_FUNC #x0B74)
   (define GL_ACCUM_CLEAR_VALUE #x0B80)
   (define GL_STENCIL_TEST #x0B90)
   (define GL_STENCIL_CLEAR_VALUE #x0B91)
   (define GL_STENCIL_FUNC #x0B92)
   (define GL_STENCIL_VALUE_MASK #x0B93)
   (define GL_STENCIL_FAIL #x0B94)
   (define GL_STENCIL_PASS_DEPTH_FAIL #x0B95)
   (define GL_STENCIL_PASS_DEPTH_PASS #x0B96)
   (define GL_STENCIL_REF #x0B97)
   (define GL_STENCIL_WRITEMASK #x0B98)
   (define GL_MATRIX_MODE #x0BA0)
   (define GL_NORMALIZE #x0BA1)
   (define GL_VIEWPORT #x0BA2)
   (define GL_MODELVIEW_STACK_DEPTH #x0BA3)
   (define GL_PROJECTION_STACK_DEPTH #x0BA4)
   (define GL_TEXTURE_STACK_DEPTH #x0BA5)
   (define GL_MODELVIEW_MATRIX #x0BA6)
   (define GL_PROJECTION_MATRIX #x0BA7)
   (define GL_TEXTURE_MATRIX #x0BA8)
   (define GL_ATTRIB_STACK_DEPTH #x0BB0)
   (define GL_ALPHA_TEST #x0BC0)
   (define GL_ALPHA_TEST_FUNC #x0BC1)
   (define GL_ALPHA_TEST_REF #x0BC2)
   (define GL_DITHER #x0BD0)
   (define GL_BLEND_DST #x0BE0)
   (define GL_BLEND_SRC #x0BE1)
   (define GL_BLEND #x0BE2)
   (define GL_LOGIC_OP_MODE #x0BF0)
   (define GL_LOGIC_OP #x0BF1) ; was: INDEX_LOGIC_OP
   (define GL_AUX_BUFFERS #x0C00)
   (define GL_DRAW_BUFFER #x0C01)
   (define GL_READ_BUFFER #x0C02)
   (define GL_SCISSOR_BOX #x0C10)
   (define GL_SCISSOR_TEST #x0C11)
   (define GL_INDEX_CLEAR_VALUE #x0C20)
   (define GL_INDEX_WRITEMASK #x0C21)
   (define GL_COLOR_CLEAR_VALUE #x0C22)
   (define GL_COLOR_WRITEMASK #x0C23)
   (define GL_INDEX_MODE #x0C30)
   (define GL_RGBA_MODE #x0C31)
   (define GL_DOUBLEBUFFER #x0C32)
   (define GL_STEREO #x0C33)
   (define GL_RENDER_MODE #x0C40)
   (define GL_PERSPECTIVE_CORRECTION_HINT #x0C50)
   (define GL_POINT_SMOOTH_HINT #x0C51)
   (define GL_LINE_SMOOTH_HINT #x0C52)
   (define GL_POLYGON_SMOOTH_HINT #x0C53)
   (define GL_FOG_HINT #x0C54)
   (define GL_TEXTURE_GEN_S #x0C60)
   (define GL_TEXTURE_GEN_T #x0C61)
   (define GL_TEXTURE_GEN_R #x0C62)
   (define GL_TEXTURE_GEN_Q #x0C63)
   (define GL_PIXEL_MAP_I_TO_I #x0C70)
   (define GL_PIXEL_MAP_S_TO_S #x0C71)
   (define GL_PIXEL_MAP_I_TO_R #x0C72)
   (define GL_PIXEL_MAP_I_TO_G #x0C73)
   (define GL_PIXEL_MAP_I_TO_B #x0C74)
   (define GL_PIXEL_MAP_I_TO_A #x0C75)
   (define GL_PIXEL_MAP_R_TO_R #x0C76)
   (define GL_PIXEL_MAP_G_TO_G #x0C77)
   (define GL_PIXEL_MAP_B_TO_B #x0C78)
   (define GL_PIXEL_MAP_A_TO_A #x0C79)
   (define GL_PIXEL_MAP_I_TO_I_SIZE #x0CB0)
   (define GL_PIXEL_MAP_S_TO_S_SIZE #x0CB1)
   (define GL_PIXEL_MAP_I_TO_R_SIZE #x0CB2)
   (define GL_PIXEL_MAP_I_TO_G_SIZE #x0CB3)
   (define GL_PIXEL_MAP_I_TO_B_SIZE #x0CB4)
   (define GL_PIXEL_MAP_I_TO_A_SIZE #x0CB5)
   (define GL_PIXEL_MAP_R_TO_R_SIZE #x0CB6)
   (define GL_PIXEL_MAP_G_TO_G_SIZE #x0CB7)
   (define GL_PIXEL_MAP_B_TO_B_SIZE #x0CB8)
   (define GL_PIXEL_MAP_A_TO_A_SIZE #x0CB9)
   (define GL_UNPACK_SWAP_BYTES #x0CF0)
   (define GL_UNPACK_LSB_FIRST #x0CF1)
   (define GL_UNPACK_ROW_LENGTH #x0CF2)
   (define GL_UNPACK_SKIP_ROWS #x0CF3)
   (define GL_UNPACK_SKIP_PIXELS #x0CF4)
   (define GL_UNPACK_ALIGNMENT #x0CF5)
   (define GL_PACK_SWAP_BYTES #x0D00)
   (define GL_PACK_LSB_FIRST #x0D01)
   (define GL_PACK_ROW_LENGTH #x0D02)
   (define GL_PACK_SKIP_ROWS #x0D03)
   (define GL_PACK_SKIP_PIXELS #x0D04)
   (define GL_PACK_ALIGNMENT #x0D05)
   (define GL_MAP_COLOR #x0D10)
   (define GL_MAP_STENCIL #x0D11)
   (define GL_INDEX_SHIFT #x0D12)
   (define GL_INDEX_OFFSET #x0D13)
   (define GL_RED_SCALE #x0D14)
   (define GL_RED_BIAS #x0D15)
   (define GL_ZOOM_X #x0D16)
   (define GL_ZOOM_Y #x0D17)
   (define GL_GREEN_SCALE #x0D18)
   (define GL_GREEN_BIAS #x0D19)
   (define GL_BLUE_SCALE #x0D1A)
   (define GL_BLUE_BIAS #x0D1B)
   (define GL_ALPHA_SCALE #x0D1C)
   (define GL_ALPHA_BIAS #x0D1D)
   (define GL_DEPTH_SCALE #x0D1E)
   (define GL_DEPTH_BIAS #x0D1F)
   (define GL_MAX_EVAL_ORDER #x0D30)
   (define GL_MAX_LIGHTS #x0D31)
   (define GL_MAX_CLIP_PLANES #x0D32)
   (define GL_MAX_TEXTURE_SIZE #x0D33)
   (define GL_MAX_PIXEL_MAP_TABLE #x0D34)
   (define GL_MAX_ATTRIB_STACK_DEPTH #x0D35)
   (define GL_MAX_MODELVIEW_STACK_DEPTH #x0D36)
   (define GL_MAX_NAME_STACK_DEPTH #x0D37)
   (define GL_MAX_PROJECTION_STACK_DEPTH #x0D38)
   (define GL_MAX_TEXTURE_STACK_DEPTH #x0D39)
   (define GL_MAX_VIEWPORT_DIMS #x0D3A)
   (define GL_SUBPIXEL_BITS #x0D50)
   (define GL_INDEX_BITS #x0D51)
   (define GL_RED_BITS #x0D52)
   (define GL_GREEN_BITS #x0D53)
   (define GL_BLUE_BITS #x0D54)
   (define GL_ALPHA_BITS #x0D55)
   (define GL_DEPTH_BITS #x0D56)
   (define GL_STENCIL_BITS #x0D57)
   (define GL_ACCUM_RED_BITS #x0D58)
   (define GL_ACCUM_GREEN_BITS #x0D59)
   (define GL_ACCUM_BLUE_BITS #x0D5A)
   (define GL_ACCUM_ALPHA_BITS #x0D5B)
   (define GL_NAME_STACK_DEPTH #x0D70)
   (define GL_AUTO_NORMAL #x0D80)
   (define GL_MAP1_COLOR_4 #x0D90)
   (define GL_MAP1_INDEX #x0D91)
   (define GL_MAP1_NORMAL #x0D92)
   (define GL_MAP1_TEXTURE_COORD_1 #x0D93)
   (define GL_MAP1_TEXTURE_COORD_2 #x0D94)
   (define GL_MAP1_TEXTURE_COORD_3 #x0D95)
   (define GL_MAP1_TEXTURE_COORD_4 #x0D96)
   (define GL_MAP1_VERTEX_3 #x0D97)
   (define GL_MAP1_VERTEX_4 #x0D98)
   (define GL_MAP2_COLOR_4 #x0DB0)
   (define GL_MAP2_INDEX #x0DB1)
   (define GL_MAP2_NORMAL #x0DB2)
   (define GL_MAP2_TEXTURE_COORD_1 #x0DB3)
   (define GL_MAP2_TEXTURE_COORD_2 #x0DB4)
   (define GL_MAP2_TEXTURE_COORD_3 #x0DB5)
   (define GL_MAP2_TEXTURE_COORD_4 #x0DB6)
   (define GL_MAP2_VERTEX_3 #x0DB7)
   (define GL_MAP2_VERTEX_4 #x0DB8)
   (define GL_MAP1_GRID_DOMAIN #x0DD0)
   (define GL_MAP1_GRID_SEGMENTS #x0DD1)
   (define GL_MAP2_GRID_DOMAIN #x0DD2)
   (define GL_MAP2_GRID_SEGMENTS #x0DD3)
   (define GL_TEXTURE_1D #x0DE0)
   (define GL_TEXTURE_2D #x0DE1)

   (define GL_TEXTURE_WIDTH #x1000)
   (define GL_TEXTURE_HEIGHT #x1001)
   (define GL_TEXTURE_INTERNAL_FORMAT #x1003)
   (define GL_TEXTURE_BORDER_COLOR #x1004)
   (define GL_TEXTURE_BORDER #x1005)

   (define GL_DONT_CARE #x1100)
   (define GL_FASTEST #x1101)
   (define GL_NICEST #x1102)

   (define GL_LIGHT0 #x4000)
   (define GL_LIGHT1 #x4001)
   (define GL_LIGHT2 #x4002)
   (define GL_LIGHT3 #x4003)
   (define GL_LIGHT4 #x4004)
   (define GL_LIGHT5 #x4005)
   (define GL_LIGHT6 #x4006)
   (define GL_LIGHT7 #x4007)

   (define GL_AMBIENT #x1200)
   (define GL_DIFFUSE #x1201)
   (define GL_SPECULAR #x1202)
   (define GL_POSITION #x1203)
   (define GL_SPOT_DIRECTION #x1204)
   (define GL_SPOT_EXPONENT #x1205)
   (define GL_SPOT_CUTOFF #x1206)
   (define GL_CONSTANT_ATTENUATION #x1207)
   (define GL_LINEAR_ATTENUATION #x1208)
   (define GL_QUADRATIC_ATTENUATION #x1209)

   (define GL_COMPILE #x1300)
   (define GL_COMPILE_AND_EXECUTE #x1301)

   (define GL_BYTE #x1400)
   (define GL_UNSIGNED_BYTE #x1401)
   (define GL_SHORT #x1402)
   (define GL_UNSIGNED_SHORT #x1403)
   (define GL_INT #x1404)
   (define GL_UNSIGNED_INT #x1405)
   (define GL_FLOAT #x1406)
   (define GL_2_BYTES #x1407)
   (define GL_3_BYTES #x1408)
   (define GL_4_BYTES #x1409)

   (define GL_CLEAR #x1500)
   (define GL_AND #x1501)
   (define GL_AND_REVERSE #x1502)
   (define GL_COPY #x1503)
   (define GL_AND_INVERTED #x1504)
   (define GL_NOOP #x1505)
   (define GL_XOR #x1506)
   (define GL_OR #x1507)
   (define GL_NOR #x1508)
   (define GL_EQUIV #x1509)
   (define GL_INVERT #x150A)
   (define GL_OR_REVERSE #x150B)
   (define GL_COPY_INVERTED #x150C)
   (define GL_OR_INVERTED #x150D)
   (define GL_NAND #x150E)
   (define GL_SET #x150F)

   (define GL_EMISSION #x1600)
   (define GL_SHININESS #x1601)
   (define GL_AMBIENT_AND_DIFFUSE #x1602)
   (define GL_COLOR_INDEXES #x1603)

   (define GL_MODELVIEW #x1700)
   (define GL_PROJECTION #x1701)
   (define GL_TEXTURE #x1702)

   (define GL_COLOR #x1800)
   (define GL_DEPTH #x1801)
   (define GL_STENCIL #x1802)

   (define GL_COLOR_INDEX #x1900)
   (define GL_STENCIL_INDEX #x1901)
   (define GL_DEPTH_COMPONENT #x1902)
   (define GL_RED #x1903)
   (define GL_GREEN #x1904)
   (define GL_BLUE #x1905)
   (define GL_ALPHA #x1906)
   (define GL_RGB #x1907)
   (define GL_RGBA #x1908)
   (define GL_LUMINANCE #x1909)
   (define GL_LUMINANCE_ALPHA #x190A)

   (define GL_BITMAP #x1A00)

   (define GL_POINT #x1B00)
   (define GL_LINE #x1B01)
   (define GL_FILL #x1B02)

   (define GL_RENDER #x1C00)
   (define GL_FEEDBACK #x1C01)
   (define GL_SELECT #x1C02)

   (define GL_FLAT #x1D00)
   (define GL_SMOOTH #x1D01)

   (define GL_KEEP #x1E00)
   (define GL_REPLACE #x1E01)
   (define GL_INCR #x1E02)
   (define GL_DECR #x1E03)

   (define GL_VENDOR #x1F00)
   (define GL_RENDERER #x1F01)
   (define GL_VERSION #x1F02)
   (define GL_EXTENSIONS #x1F03)

   (define GL_S #x2000)
   (define GL_T #x2001)
   (define GL_R #x2002)
   (define GL_Q #x2003)

   (define GL_MODULATE #x2100)
   (define GL_DECAL #x2101)

   (define GL_TEXTURE_ENV_MODE #x2200)
   (define GL_TEXTURE_ENV_COLOR #x2201)

   (define GL_TEXTURE_ENV #x2300)

   (define GL_EYE_LINEAR #x2400)
   (define GL_OBJECT_LINEAR #x2401)
   (define GL_SPHERE_MAP #x2402)

   (define GL_TEXTURE_GEN_MODE #x2500)
   (define GL_OBJECT_PLANE #x2501)
   (define GL_EYE_PLANE #x2502)

   (define GL_NEAREST #x2600)
   (define GL_LINEAR #x2601)

   (define GL_NEAREST_MIPMAP_NEAREST #x2700)
   (define GL_LINEAR_MIPMAP_NEAREST #x2701)
   (define GL_NEAREST_MIPMAP_LINEAR #x2702)
   (define GL_LINEAR_MIPMAP_LINEAR #x2703)

   (define GL_TEXTURE_MAG_FILTER #x2800)
   (define GL_TEXTURE_MIN_FILTER #x2801)
   (define GL_TEXTURE_WRAP_S #x2802)
   (define GL_TEXTURE_WRAP_T #x2803)

   (define GL_CLAMP #x2900)
   (define GL_REPEAT #x2901)


   (define glAccum       (dlsym $ GLvoid "glAccum"      GLenum GLfloat))
   (define glAlphaFunc   (dlsym $ GLvoid "glAlphaFunc"  GLenum GLclampf))
   (define glBegin       (dlsym $ GLvoid "glBegin"      GLenum))
   (define glBitmap      (dlsym $ GLvoid "glBitmap"     GLsizei GLsizei GLfloat GLfloat GLfloat GLfloat GLubyte*))
   (define glBlendFunc   (dlsym $ GLvoid "glBlendFunc"  GLenum GLenum))
   (define glCallList    (dlsym $ GLvoid "glCallList"   GLuint))
   (define glCallLists   (dlsym $ GLvoid "glCallLists"  GLsizei GLenum GLvoid*))
   (define glClear       (dlsym $ GLvoid "glClear"      GLbitfield))
   (define glClearAccum  (dlsym $ GLvoid "glClearAccum" GLfloat GLfloat GLfloat GLfloat))
   (define glClearColor  (dlsym $ GLvoid "glClearColor" GLfloat GLfloat GLfloat GLfloat))
   (define glClearDepth  (dlsym $ GLvoid "glClearDepth" GLclampd))
   (define glClearIndex  (dlsym $ GLvoid "glClearIndex" GLfloat))
   (define glClearStencil(dlsym $ GLvoid "glClearStencil" GLint))
   (define glClipPlane   (dlsym $ GLvoid "glClipPlane"  GLenum GLdouble*))
   ; glColor:
   (define glColor3b     (dlsym $ GLvoid "glColor3b"    GLbyte GLbyte GLbyte))
;WINGDIAPI void APIENTRY glColor3bv (const GLbyte *v);
;WINGDIAPI void APIENTRY glColor3d (GLdouble red, GLdouble green, GLdouble blue);
;WINGDIAPI void APIENTRY glColor3dv (const GLdouble *v);
   (define glColor3f     (dlsym $ GLvoid "glColor3f"    GLfloat GLfloat GLfloat))
   (define glColor3fv    (dlsym $ GLvoid "glColor3fv"   GLfloat*))
   (define glColor3i     (dlsym $ GLvoid "glColor3i"    GLint GLint GLint))
;WINGDIAPI void APIENTRY glColor3iv (const GLint *v);
;WINGDIAPI void APIENTRY glColor3s (GLshort red, GLshort green, GLshort blue);
;WINGDIAPI void APIENTRY glColor3sv (const GLshort *v);
   (define glColor3ub    (dlsym $ GLvoid "glColor3ub"   GLubyte GLubyte GLubyte))
;WINGDIAPI void APIENTRY glColor3ubv (const GLubyte *v);
;WINGDIAPI void APIENTRY glColor3ui (GLuint red, GLuint green, GLuint blue);
;WINGDIAPI void APIENTRY glColor3uiv (const GLuint *v);
;WINGDIAPI void APIENTRY glColor3us (GLushort red, GLushort green, GLushort blue);
;WINGDIAPI void APIENTRY glColor3usv (const GLushort *v);
;WINGDIAPI void APIENTRY glColor4b (GLbyte red, GLbyte green, GLbyte blue, GLbyte alpha);
;WINGDIAPI void APIENTRY glColor4bv (const GLbyte *v);
;WINGDIAPI void APIENTRY glColor4d (GLdouble red, GLdouble green, GLdouble blue, GLdouble alpha);
;WINGDIAPI void APIENTRY glColor4dv (const GLdouble *v);
   (define glColor4f     (dlsym $ GLvoid "glColor4f"    GLfloat GLfloat GLfloat GLfloat))
;WINGDIAPI void APIENTRY glColor4f (GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha);
;WINGDIAPI void APIENTRY glColor4fv (const GLfloat *v);
;WINGDIAPI void APIENTRY glColor4i (GLint red, GLint green, GLint blue, GLint alpha);
;WINGDIAPI void APIENTRY glColor4iv (const GLint *v);
;WINGDIAPI void APIENTRY glColor4s (GLshort red, GLshort green, GLshort blue, GLshort alpha);
;WINGDIAPI void APIENTRY glColor4sv (const GLshort *v);
;WINGDIAPI void APIENTRY glColor4ub (GLubyte red, GLubyte green, GLubyte blue, GLubyte alpha);
;WINGDIAPI void APIENTRY glColor4ubv (const GLubyte *v);
;WINGDIAPI void APIENTRY glColor4ui (GLuint red, GLuint green, GLuint blue, GLuint alpha);
;WINGDIAPI void APIENTRY glColor4uiv (const GLuint *v);
;WINGDIAPI void APIENTRY glColor4us (GLushort red, GLushort green, GLushort blue, GLushort alpha);
;WINGDIAPI void APIENTRY glColor4usv (const GLushort *v);

   (define glColorMask   (dlsym $ GLvoid "glColorMask"  GLboolean GLboolean GLboolean GLboolean))
   (define glColorMaterial (dlsym $ GLvoid "glColorMaterial" GLenum GLenum))
   (define glCopyPixels  (dlsym $ GLvoid "glCopyPixels" GLint GLint GLsizei GLsizei GLenum))
   (define glCullFace    (dlsym $ GLvoid "glCullFace"   GLenum))
   (define glDeleteLists (dlsym $ GLvoid "glDeleteLists" GLuint GLsizei))
   (define glDepthFunc   (dlsym $ GLvoid "glDepthFunc"  GLenum))
   (define glDepthMask   (dlsym $ GLvoid "glDepthMask"  GLboolean))
   (define glDepthRange  (dlsym $ GLvoid "glDepthRange" GLclampd GLclampd))
   (define glDisable     (dlsym $ GLvoid "glDisable"    GLenum))
   (define glDrawBuffer  (dlsym $ GLvoid "glDrawBuffer" GLenum))
   (define glDrawPixels  (dlsym $ GLvoid "glDrawPixels" GLsizei GLsizei GLenum GLenum GLvoid*))
   (define glEdgeFlag    (dlsym $ GLvoid "glEdgeFlag"   GLboolean))
   (define glEdgeFlagv   (dlsym $ GLvoid "glEdgeFlagv"  GLboolean*))
   (define glEnable      (dlsym $ GLvoid "glEnable"     GLenum))
   (define glEnd         (dlsym $ GLvoid "glEnd"))
   (define glEndList     (dlsym $ GLvoid "glEndList"))
;WINGDIAPI void APIENTRY glEvalCoord1d (GLdouble u);
;WINGDIAPI void APIENTRY glEvalCoord1dv (const GLdouble *u);
;WINGDIAPI void APIENTRY glEvalCoord1f (GLfloat u);
;WINGDIAPI void APIENTRY glEvalCoord1fv (const GLfloat *u);
;WINGDIAPI void APIENTRY glEvalCoord2d (GLdouble u, GLdouble v);
;WINGDIAPI void APIENTRY glEvalCoord2dv (const GLdouble *u);
;WINGDIAPI void APIENTRY glEvalCoord2f (GLfloat u, GLfloat v);
;WINGDIAPI void APIENTRY glEvalCoord2fv (const GLfloat *u);
;WINGDIAPI void APIENTRY glEvalMesh1 (GLenum mode, GLint i1, GLint i2);
;WINGDIAPI void APIENTRY glEvalMesh2 (GLenum mode, GLint i1, GLint i2, GLint j1, GLint j2);
;WINGDIAPI void APIENTRY glEvalPoint1 (GLint i);
;WINGDIAPI void APIENTRY glEvalPoint2 (GLint i, GLint j);
   (define glFeedbackBuffer (dlsym $ GLvoid "glFeedbackBuffer" GLsizei GLenum GLfloat*))
   (define glFinish      (dlsym $ GLvoid "glFinish"))
   (define glFlush       (dlsym $ GLvoid "glFlush"))
   (define glFogf        (dlsym $ GLvoid "glFogf" GLenum GLfloat))
   (define glFogfv       (dlsym $ GLvoid "glFogfv" GLenum GLfloat*))
   (define glFogi        (dlsym $ GLvoid "glFogi" GLenum GLint))
   (define glFogiv       (dlsym $ GLvoid "glFogiv" GLenum GLint*))
   (define glFrontFace   (dlsym $ GLvoid "glFrontFace" GLenum))
   (define glFrustum     (dlsym $ GLvoid "glFrustum" GLdouble GLdouble GLdouble GLdouble GLdouble GLdouble))
;WINGDIAPI GLuint APIENTRY glGenLists (GLsizei range);
   (define glGetBooleanv (dlsym $ GLvoid "glGetBooleanv" GLenum GLboolean*))
   (define glGetDoublev  (dlsym $ GLvoid "glGetDoublev"  GLenum GLdouble*))
   (define glGetError    (dlsym $ GLenum "glGetError"))
   (define glGetFloatv   (dlsym $ GLvoid "glGetFloatv"   GLenum GLfloat*))
   (define glGetIntegerv (dlsym $ GLvoid "glGetIntegerv" GLenum GLint*))
;WINGDIAPI void APIENTRY glGetClipPlane (GLenum plane, GLdouble *equation);
;WINGDIAPI void APIENTRY glGetLightfv (GLenum light, GLenum pname, GLfloat *params);
;WINGDIAPI void APIENTRY glGetLightiv (GLenum light, GLenum pname, GLint *params);
;WINGDIAPI void APIENTRY glGetMapdv (GLenum target, GLenum query, GLdouble *v);
;WINGDIAPI void APIENTRY glGetMapfv (GLenum target, GLenum query, GLfloat *v);
;WINGDIAPI void APIENTRY glGetMapiv (GLenum target, GLenum query, GLint *v);
;WINGDIAPI void APIENTRY glGetMaterialfv (GLenum face, GLenum pname, GLfloat *params);
;WINGDIAPI void APIENTRY glGetMaterialiv (GLenum face, GLenum pname, GLint *params);
;WINGDIAPI void APIENTRY glGetPixelMapfv (GLenum map, GLfloat *values);
;WINGDIAPI void APIENTRY glGetPixelMapuiv (GLenum map, GLuint *values);
;WINGDIAPI void APIENTRY glGetPixelMapusv (GLenum map, GLushort *values);
;WINGDIAPI void APIENTRY glGetPolygonStipple (GLubyte *mask);
   (define glGetString (dlsym $ GLubyte* "glGetString" GLenum))
;WINGDIAPI void APIENTRY glGetTexEnvfv (GLenum target, GLenum pname, GLfloat *params);
;WINGDIAPI void APIENTRY glGetTexEnviv (GLenum target, GLenum pname, GLint *params);
;WINGDIAPI void APIENTRY glGetTexGendv (GLenum coord, GLenum pname, GLdouble *params);
;WINGDIAPI void APIENTRY glGetTexGenfv (GLenum coord, GLenum pname, GLfloat *params);
;WINGDIAPI void APIENTRY glGetTexGeniv (GLenum coord, GLenum pname, GLint *params);
   (define glHint (dlsym $ GLvoid "glHint" GLenum GLenum))
;WINGDIAPI void APIENTRY glIndexMask (GLuint mask);
;WINGDIAPI void APIENTRY glIndexd (GLdouble c);
;WINGDIAPI void APIENTRY glIndexdv (const GLdouble *c);
;WINGDIAPI void APIENTRY glIndexf (GLfloat c);
;WINGDIAPI void APIENTRY glIndexfv (const GLfloat *c);
;WINGDIAPI void APIENTRY glIndexi (GLint c);
;WINGDIAPI void APIENTRY glIndexiv (const GLint *c);
;WINGDIAPI void APIENTRY glIndexs (GLshort c);
;WINGDIAPI void APIENTRY glIndexsv (const GLshort *c);
;WINGDIAPI void APIENTRY glInitNames (void);
;WINGDIAPI GLboolean APIENTRY glIsList (GLuint list);
   (define glLightModelf (dlsym $ GLvoid "glLightModelf" GLenum GLfloat))
;WINGDIAPI void APIENTRY glLightModelfv (GLenum pname, const GLfloat *params);
;WINGDIAPI void APIENTRY glLightModeli (GLenum pname, GLint param);
;WINGDIAPI void APIENTRY glLightModeliv (GLenum pname, const GLint *params);
;WINGDIAPI void APIENTRY glLightf (GLenum light, GLenum pname, GLfloat param);
   (define glLightfv (dlsym $ GLvoid "glLightfv" GLenum GLenum GLfloat*))
;WINGDIAPI void APIENTRY glLighti (GLenum light, GLenum pname, GLint param);
;WINGDIAPI void APIENTRY glLightiv (GLenum light, GLenum pname, const GLint *params);
;WINGDIAPI void APIENTRY glLineStipple (GLint factor, GLushort pattern);
   (define glLineWidth (dlsym $ GLvoid "glLineWidth" GLfloat))
;WINGDIAPI void APIENTRY glListBase (GLuint base);
   (define glLoadIdentity (dlsym $ GLvoid "glLoadIdentity"))
   (define glLoadMatrixd (dlsym $ GLvoid "glLoadMatrixd" GLdouble*))
   (define glLoadMatrixf (dlsym $ GLvoid "glLoadMatrixf" GLfloat*))
;WINGDIAPI void APIENTRY glLoadName (GLuint name);
;WINGDIAPI void APIENTRY glMap1d (GLenum target, GLdouble u1, GLdouble u2, GLint stride, GLint order, const GLdouble *points);
;WINGDIAPI void APIENTRY glMap1f (GLenum target, GLfloat u1, GLfloat u2, GLint stride, GLint order, const GLfloat *points);
;WINGDIAPI void APIENTRY glMap2d (GLenum target, GLdouble u1, GLdouble u2, GLint ustride, GLint uorder, GLdouble v1, GLdouble v2, GLint vstride, GLint vorder, const GLdouble *points);
;WINGDIAPI void APIENTRY glMap2f (GLenum target, GLfloat u1, GLfloat u2, GLint ustride, GLint uorder, GLfloat v1, GLfloat v2, GLint vstride, GLint vorder, const GLfloat *points);
;WINGDIAPI void APIENTRY glMapGrid1d (GLint un, GLdouble u1, GLdouble u2);
;WINGDIAPI void APIENTRY glMapGrid1f (GLint un, GLfloat u1, GLfloat u2);
;WINGDIAPI void APIENTRY glMapGrid2d (GLint un, GLdouble u1, GLdouble u2, GLint vn, GLdouble v1, GLdouble v2);
;WINGDIAPI void APIENTRY glMapGrid2f (GLint un, GLfloat u1, GLfloat u2, GLint vn, GLfloat v1, GLfloat v2);
   (define glMaterialf  (dlsym $ GLvoid "glMaterialf"  GLenum GLenum GLfloat))
   (define glMaterialfv (dlsym $ GLvoid "glMaterialfv" GLenum GLenum GLfloat*))
;WINGDIAPI void APIENTRY glMateriali (GLenum face, GLenum pname, GLint param);
;WINGDIAPI void APIENTRY glMaterialiv (GLenum face, GLenum pname, const GLint *params);
   (define glMatrixMode (dlsym $ GLvoid "glMatrixMode" GLenum))
   (define glMultMatrixd (dlsym $ GLvoid "glMultMatrixd" GLdouble*))
   (define glMultMatrixf (dlsym $ GLvoid "glMultMatrixf" GLfloat*))
   (define glNewList (dlsym $ GLvoid "glNewList" GLuint GLenum))
;WINGDIAPI void APIENTRY glNormal3b (GLbyte nx, GLbyte ny, GLbyte nz);
;WINGDIAPI void APIENTRY glNormal3bv (const GLbyte *v);
;WINGDIAPI void APIENTRY glNormal3d (GLdouble nx, GLdouble ny, GLdouble nz);
;WINGDIAPI void APIENTRY glNormal3dv (const GLdouble *v);
   (define glNormal3f (dlsym $ GLvoid "glNormal3f" GLfloat GLfloat GLfloat))
;WINGDIAPI void APIENTRY glNormal3fv (const GLfloat *v);
;WINGDIAPI void APIENTRY glNormal3i (GLint nx, GLint ny, GLint nz);
;WINGDIAPI void APIENTRY glNormal3iv (const GLint *v);
;WINGDIAPI void APIENTRY glNormal3s (GLshort nx, GLshort ny, GLshort nz);
;WINGDIAPI void APIENTRY glNormal3sv (const GLshort *v);
;WINGDIAPI void APIENTRY glOrtho (GLdouble left, GLdouble right, GLdouble bottom, GLdouble top, GLdouble zNear, GLdouble zFar);
   (define glOrtho (dlsym $ GLvoid "glOrtho" GLdouble GLdouble  GLdouble GLdouble  GLdouble GLdouble))
;WINGDIAPI void APIENTRY glPassThrough (GLfloat token);
;WINGDIAPI void APIENTRY glPixelMapfv (GLenum map, GLsizei mapsize, const GLfloat *values);
;WINGDIAPI void APIENTRY glPixelMapuiv (GLenum map, GLsizei mapsize, const GLuint *values);
;WINGDIAPI void APIENTRY glPixelMapusv (GLenum map, GLsizei mapsize, const GLushort *values);
;WINGDIAPI void APIENTRY glPixelTransferf (GLenum pname, GLfloat param);
;WINGDIAPI void APIENTRY glPixelTransferi (GLenum pname, GLint param);
;WINGDIAPI void APIENTRY glPixelZoom (GLfloat xfactor, GLfloat yfactor);
   (define glPointSize (dlsym $ GLvoid "glPointSize" GLfloat))
   (define glPolygonMode (dlsym $ GLvoid "glPolygonMode" GLenum GLenum)) ; opengl 1.1 ?
;WINGDIAPI void APIENTRY glPolygonStipple (const GLubyte *mask);
;WINGDIAPI void APIENTRY glPopAttrib (void);
;WINGDIAPI void APIENTRY glPopMatrix (void);
   (define glPopMatrix  (dlsym $ GLvoid "glPopMatrix"))
;WINGDIAPI void APIENTRY glPopName (void);
   (define glPushAttrib (dlsym $ GLvoid "glPushAttrib" GLbitfield))
   (define glPushMatrix (dlsym $ GLvoid "glPushMatrix"))
;WINGDIAPI void APIENTRY glPushName (GLuint name);
;WINGDIAPI void APIENTRY glRasterPos2d (GLdouble x, GLdouble y);
;WINGDIAPI void APIENTRY glRasterPos2dv (const GLdouble *v);
;WINGDIAPI void APIENTRY glRasterPos2f (GLfloat x, GLfloat y);
;WINGDIAPI void APIENTRY glRasterPos2fv (const GLfloat *v);
;WINGDIAPI void APIENTRY glRasterPos2i (GLint x, GLint y);
;WINGDIAPI void APIENTRY glRasterPos2iv (const GLint *v);
;WINGDIAPI void APIENTRY glRasterPos2s (GLshort x, GLshort y);
;WINGDIAPI void APIENTRY glRasterPos2sv (const GLshort *v);
;WINGDIAPI void APIENTRY glRasterPos3d (GLdouble x, GLdouble y, GLdouble z);
;WINGDIAPI void APIENTRY glRasterPos3dv (const GLdouble *v);
;WINGDIAPI void APIENTRY glRasterPos3f (GLfloat x, GLfloat y, GLfloat z);
;WINGDIAPI void APIENTRY glRasterPos3fv (const GLfloat *v);
;WINGDIAPI void APIENTRY glRasterPos3i (GLint x, GLint y, GLint z);
;WINGDIAPI void APIENTRY glRasterPos3iv (const GLint *v);
;WINGDIAPI void APIENTRY glRasterPos3s (GLshort x, GLshort y, GLshort z);
;WINGDIAPI void APIENTRY glRasterPos3sv (const GLshort *v);
;WINGDIAPI void APIENTRY glRasterPos4d (GLdouble x, GLdouble y, GLdouble z, GLdouble w);
;WINGDIAPI void APIENTRY glRasterPos4dv (const GLdouble *v);
;WINGDIAPI void APIENTRY glRasterPos4f (GLfloat x, GLfloat y, GLfloat z, GLfloat w);
;WINGDIAPI void APIENTRY glRasterPos4fv (const GLfloat *v);
;WINGDIAPI void APIENTRY glRasterPos4i (GLint x, GLint y, GLint z, GLint w);
;WINGDIAPI void APIENTRY glRasterPos4iv (const GLint *v);
;WINGDIAPI void APIENTRY glRasterPos4s (GLshort x, GLshort y, GLshort z, GLshort w);
;WINGDIAPI void APIENTRY glRasterPos4sv (const GLshort *v);
;WINGDIAPI void APIENTRY glRectd (GLdouble x1, GLdouble y1, GLdouble x2, GLdouble y2);
;WINGDIAPI void APIENTRY glRectdv (const GLdouble *v1, const GLdouble *v2);
;WINGDIAPI void APIENTRY glRectf (GLfloat x1, GLfloat y1, GLfloat x2, GLfloat y2);
;WINGDIAPI void APIENTRY glRectfv (const GLfloat *v1, const GLfloat *v2);
;WINGDIAPI void APIENTRY glRecti (GLint x1, GLint y1, GLint x2, GLint y2);
;WINGDIAPI void APIENTRY glRectiv (const GLint *v1, const GLint *v2);
;WINGDIAPI void APIENTRY glRects (GLshort x1, GLshort y1, GLshort x2, GLshort y2);
;WINGDIAPI void APIENTRY glRectsv (const GLshort *v1, const GLshort *v2);
;WINGDIAPI GLint APIENTRY glRenderMode (GLenum mode);
;WINGDIAPI void APIENTRY glRotated (GLdouble angle, GLdouble x, GLdouble y, GLdouble z);
   (define glRotatef (dlsym $ GLvoid "glRotatef" GLfloat GLfloat GLfloat GLfloat))
;WINGDIAPI void APIENTRY glScaled (GLdouble x, GLdouble y, GLdouble z);
   (define glScalef (dlsym $ GLvoid "glScalef" GLfloat GLfloat GLfloat))
;WINGDIAPI void APIENTRY glSelectBuffer (GLsizei size, GLuint *buffer);
   (define glShadeModel (dlsym $ GLvoid "glShadeModel" GLenum))
;WINGDIAPI void APIENTRY glTexCoord1d (GLdouble s);
;WINGDIAPI void APIENTRY glTexCoord1dv (const GLdouble *v);
;WINGDIAPI void APIENTRY glTexCoord1f (GLfloat s);
;WINGDIAPI void APIENTRY glTexCoord1fv (const GLfloat *v);
;WINGDIAPI void APIENTRY glTexCoord1i (GLint s);
;WINGDIAPI void APIENTRY glTexCoord1iv (const GLint *v);
;WINGDIAPI void APIENTRY glTexCoord1s (GLshort s);
;WINGDIAPI void APIENTRY glTexCoord1sv (const GLshort *v);
;WINGDIAPI void APIENTRY glTexCoord2d (GLdouble s, GLdouble t);
;WINGDIAPI void APIENTRY glTexCoord2dv (const GLdouble *v);
  (define glTexCoord2f (dlsym $ GLvoid "glTexCoord2f" GLfloat GLfloat))
;WINGDIAPI void APIENTRY glTexCoord2fv (const GLfloat *v);
;WINGDIAPI void APIENTRY glTexCoord2i (GLint s, GLint t);
;WINGDIAPI void APIENTRY glTexCoord2iv (const GLint *v);
;WINGDIAPI void APIENTRY glTexCoord2s (GLshort s, GLshort t);
;WINGDIAPI void APIENTRY glTexCoord2sv (const GLshort *v);
;WINGDIAPI void APIENTRY glTexCoord3d (GLdouble s, GLdouble t, GLdouble r);
;WINGDIAPI void APIENTRY glTexCoord3dv (const GLdouble *v);
;WINGDIAPI void APIENTRY glTexCoord3f (GLfloat s, GLfloat t, GLfloat r);
;WINGDIAPI void APIENTRY glTexCoord3fv (const GLfloat *v);
;WINGDIAPI void APIENTRY glTexCoord3i (GLint s, GLint t, GLint r);
;WINGDIAPI void APIENTRY glTexCoord3iv (const GLint *v);
;WINGDIAPI void APIENTRY glTexCoord3s (GLshort s, GLshort t, GLshort r);
;WINGDIAPI void APIENTRY glTexCoord3sv (const GLshort *v);
;WINGDIAPI void APIENTRY glTexCoord4d (GLdouble s, GLdouble t, GLdouble r, GLdouble q);
;WINGDIAPI void APIENTRY glTexCoord4dv (const GLdouble *v);
;WINGDIAPI void APIENTRY glTexCoord4f (GLfloat s, GLfloat t, GLfloat r, GLfloat q);
;WINGDIAPI void APIENTRY glTexCoord4fv (const GLfloat *v);
;WINGDIAPI void APIENTRY glTexCoord4i (GLint s, GLint t, GLint r, GLint q);
;WINGDIAPI void APIENTRY glTexCoord4iv (const GLint *v);
;WINGDIAPI void APIENTRY glTexCoord4s (GLshort s, GLshort t, GLshort r, GLshort q);
;WINGDIAPI void APIENTRY glTexCoord4sv (const GLshort *v);
;WINGDIAPI void APIENTRY glTexEnvf (GLenum target, GLenum pname, GLfloat param);
;WINGDIAPI void APIENTRY glTexEnvfv (GLenum target, GLenum pname, const GLfloat *params);
;WINGDIAPI void APIENTRY glTexEnvi (GLenum target, GLenum pname, GLint param);
;WINGDIAPI void APIENTRY glTexEnviv (GLenum target, GLenum pname, const GLint *params);
;WINGDIAPI void APIENTRY glTexGend (GLenum coord, GLenum pname, GLdouble param);
;WINGDIAPI void APIENTRY glTexGendv (GLenum coord, GLenum pname, const GLdouble *params);
;WINGDIAPI void APIENTRY glTexGenf (GLenum coord, GLenum pname, GLfloat param);
;WINGDIAPI void APIENTRY glTexGenfv (GLenum coord, GLenum pname, const GLfloat *params);
;WINGDIAPI void APIENTRY glTexGeni (GLenum coord, GLenum pname, GLint param);
;WINGDIAPI void APIENTRY glTexGeniv (GLenum coord, GLenum pname, const GLint *params);
   (define glTexImage1D (dlsym $ GLvoid "glTexImage1D" GLenum GLint GLint GLsizei GLint GLenum GLenum GLvoid*))
   (define glTexImage2D (dlsym $ GLvoid "glTexImage2D" GLenum GLint GLint GLsizei GLsizei GLint GLenum GLenum GLvoid*))
   (define glTexParameteri (dlsym $ GLvoid "glTexParameteri" GLenum GLenum GLint))

;WINGDIAPI void APIENTRY glTranslated (GLdouble x, GLdouble y, GLdouble z);
   (define glTranslatef (dlsym $ GLvoid "glTranslatef" GLfloat GLfloat GLfloat))
   (define glVertex2d  (dlsym $ GLvoid "glVertex2d"  GLdouble GLdouble))
   (define glVertex2dv (dlsym $ GLvoid "glVertex2dv" GLdouble*))
   (define glVertex2f  (dlsym $ GLvoid "glVertex2f"  GLfloat GLfloat))
   (define glVertex2fv (dlsym $ GLvoid "glVertex2fv" GLfloat*))
           ;(define (glVertex2f a b) (glVertex2fv (list a b)))
   (define glVertex2i (dlsym $ GLvoid "glVertex2i" GLint GLint))
;WINGDIAPI void APIENTRY glVertex2iv (const GLint *v);
;WINGDIAPI void APIENTRY glVertex2s (GLshort x, GLshort y);
;WINGDIAPI void APIENTRY glVertex2sv (const GLshort *v);
   (define glVertex3d (dlsym $ GLvoid "glVertex3d" GLdouble GLdouble GLdouble))
;WINGDIAPI void APIENTRY glVertex3dv (const GLdouble *v);
   (define glVertex3f  (dlsym $ GLvoid "glVertex3f"  GLfloat GLfloat GLfloat))
   (define glVertex3fv (dlsym $ GLvoid "glVertex3fv" GLfloat*))
;WINGDIAPI void APIENTRY glVertex3fv (const GLfloat *v);
   (define glVertex3i (dlsym $ GLvoid "glVertex3i" GLint GLint GLint))
;WINGDIAPI void APIENTRY glVertex3iv (const GLint *v);
;WINGDIAPI void APIENTRY glVertex3s (GLshort x, GLshort y, GLshort z);
;WINGDIAPI void APIENTRY glVertex3sv (const GLshort *v);
;WINGDIAPI void APIENTRY glVertex4d (GLdouble x, GLdouble y, GLdouble z, GLdouble w);
;WINGDIAPI void APIENTRY glVertex4dv (const GLdouble *v);
;WINGDIAPI void APIENTRY glVertex4f (GLfloat x, GLfloat y, GLfloat z, GLfloat w);
;WINGDIAPI void APIENTRY glVertex4fv (const GLfloat *v);
;WINGDIAPI void APIENTRY glVertex4i (GLint x, GLint y, GLint z, GLint w);
;WINGDIAPI void APIENTRY glVertex4iv (const GLint *v);
;WINGDIAPI void APIENTRY glVertex4s (GLshort x, GLshort y, GLshort z, GLshort w);
;WINGDIAPI void APIENTRY glVertex4sv (const GLshort *v);
   (define glViewport (dlsym $ GLvoid "glViewport" GLint GLint GLsizei GLsizei))


; WGL context creation https://www.opengl.org/wiki/Creating_an_OpenGL_Context_(WGL)
; GLX context creation https://www.opengl.org/wiki/Tutorial:_OpenGL_3.0_Context_Creation_(GLX)

;(define lib1 (cond
;   (win32? (dlopen "kernel32.dll"))
;   (linux? (dlopen "libX11.so"))
;   (else (runtime-error "Unknown platform" uname))))
;
;(define lib2 (cond
;   (win32? (dlopen "opengl32.dll"))
;   (linux? (dlopen "libX11.so"))
;   (else   (runtime-error "Unknown platform" uname))))

; Ð¿Ð¾Ð´Ð´ÐµÑ€Ð¶ÐºÐ° Ñ€Ð°ÑÑˆÐ¸Ñ€ÐµÐ½Ð¸Ð¹ :
(define GetProcAddress (cond ; internal function
   (win32? (dlsym WGL type-vptr "wglGetProcAddress" type-string))
   (linux? (dlsym GLX type-vptr "glXGetProcAddress" type-string))
   (else   (runtime-error "Unknown platform" uname))))

(define (gl:GetProcAddress type name . prototype)
   (let ((rtty (cons type prototype))
         (function (GetProcAddress (c-string name))))
      ;(print name ": " function)
      (if function
      (lambda args
         ;(print "> " name)
         (exec pinvoke function rtty args)))))

; Ð¾ÑÑ‚Ð°Ð»ÑŒÐ½Ñ‹Ðµ WGL/GLX/... Ñ„ÑƒÐ½ÐºÑ†Ð¸Ð¸
(define Display* type-void*)
(define XVisualInfo* type-void*)
;glXChooseVisual      ChoosePixelFormat
;glXCopyContext       wglCopyContext

;glXCreateContext     wglCreateContext
(define gl:CreateContext (cond
   (win32? (dlsym WGL type-void* "wglCreateContext" type-void*))
   (linux? (dlsym GLX type-void* "glXCreateContext" Display* XVisualInfo* type-void* type-int+))
   ;apple? (dlsym $ type-void* "CGLCreateContext" ...)
   (else   (runtime-error "Unknown platform" uname))))

;glXCreateGLXPixmap  CreateDIBitmap / CreateDIBSection
;glXDestroyContext   wglDeleteContext
;glXDestroyGLXPixmap DeleteObject
;glXGetConfig  DescribePixelFormat
;glXGetCurrentContext   wglGetCurrentContext
;glXGetCurrentDrawable  wglGetCurrentDC
;glXMakeCurrent   wglMakeCurrent
;glXQueryExtension   GetVersion
;glXQueryVersion  GetVersion
;glXSwapBuffers   SwapBuffers
;glXUseXFont   wglUseFontBitmaps / wglUseFontOutlines
;XGetVisualInfo   GetPixelFormat
;XCreateWindow CreateWindow / CreateWindowEx and GetDC / BeginPaint
;XSync   GdiFlush

(define gl:MakeCurrent (cond
   (win32? (dlsym WGL type-fix+ "wglMakeCurrent" type-void* type-void*))
   (linux? (dlsym GLX type-int+ "glXMakeCurrent" type-void* type-void* type-void*))
   (else   (runtime-error "Unknown platform" uname))))

(define gl:SwapBuffers (cond
   (win32? (dlsym GDI type-fix+ "SwapBuffers"    type-void*))
   (linux? (dlsym GLX type-vptr "glXSwapBuffers" type-void* type-void*))
   (else   (runtime-error "Unknown platform" uname))))

;   (let*((display (XOpenDisplay null))
;         (screen  (XDefaultScreen display))
;         (window  (XCreateSimpleWindow display (XRootWindow display screen)
;                     0 0 640 480  1
;                     (XBlackPixel display screen) (XWhitePixel display screen))))
;   (let*((vi (glXChooseVisual display screen
;                     (vm:raw type-vector-raw '(
;                        4 0 0 0 ; GLX_RGBA
;                        8 0 0 0  1 0 0 0 ; GLX_RED_SIZE
;                        9 0 0 0  1 0 0 0 ; GLX_GREEN_SIZE
;                       10 0 0 0  1 0 0 0 ; GLX_BLUE_SIZE
;                       12 0 0 0  1 0 0 0 ; GLX_DEPTH_SIZE
;                        0 0 0 0)))); None
;            (cx (glXCreateContext display vi 0 1)))
;      (XStoreName display window (c-string title))
;      (XSelectInput display window ExposureMask)
;      (XMapWindow display window)
;
;      (glXMakeCurrent display window cx)
;      (print "OpenGL version: " (glGetString GL_VERSION))
;      (print "OpenGL vendor: " (glGetString GL_VENDOR))
;      (print "OpenGL renderer: " (glGetString GL_RENDERER))
;      (glXMakeCurrent display null null)
;
;      (tuple display screen window cx))))



; GLX versions 1.0 and 1.1 supported
;(let .....
;   (init GLX context etc.
;)
;define (glx:create-context major minor)



;(import (lib platform))
;
;; todo: "(if (defined? parameters...)
;(fork-server 'opengl (lambda ()
;(let ((win32? (string-ci=? (ref uname 1) "Windows"))
;      (linux? (string-ci=? (ref uname 1) "Linux")))
;
;(let ((lib1 (dlopen (if win32? "user32.dll"
;                    (if linux? "libX11.so"
;                    (runtime-error "Unknown platform" uname))))))
;
;(let ((open-display (if win32? (lambda (name) #f)
;                    (if linux? (dlsym lib1 type-void* "XOpenDisplay" type-string)
;                    (runtime-error "Unknown platform" uname)))))
;
;(let this ((context null))
;   ; Ð¾Ð±Ñ€Ð°Ð±Ð¾Ñ‚Ñ‡Ð¸Ðº ÐºÐ¾Ð¼Ð°Ð½Ð´ ÑÐµÑ€Ð²ÐµÑ€Ð° opengl
;   (let* ((envelope (wait-mail))
;          (sender message envelope))
;      (tuple-case message
;         ; ÑÐ¾Ð·Ð´Ð°Ñ‚ÑŒ Ð¾ÐºÐ½Ð¾ Ð´Ð»Ñ Ñ€ÐµÐ½Ð´ÐµÑ€Ð¸Ð½Ð³Ð°, Ð¿Ñ€Ð¾Ð¸Ð½Ð¸Ñ†Ð¸Ð°Ð»Ð¸Ð·Ð¸Ñ€Ð¾Ð²Ð°Ñ‚ÑŒ Ð² Ð½ÐµÐ¼ opengl ÐºÐ¾Ð½Ñ‚ÐµÐºÑÑ‚
;         ((create-gl-context)
;            (let*((display (open-display null))
;                  (screen  (XDefaultScreen display))
;                  (window  (XCreateSimpleWindow display (XRootWindow display screen)
;                     0 0 640 480  1
;                     (XBlackPixel display screen) (XWhitePixel display screen))))
;            (let*((vi (glXChooseVisual display screen
;                           (vm:raw type-vector-raw '(
;                              4 0 0 0 ; GLX_RGBA
;                              8 0 0 0  1 0 0 0 ; GLX_RED_SIZE
;                              9 0 0 0  1 0 0 0 ; GLX_GREEN_SIZE
;                             10 0 0 0  1 0 0 0 ; GLX_BLUE_SIZE
;                             12 0 0 0  1 0 0 0 ; GLX_DEPTH_SIZE
;                              0 0 0 0)))); None
;                  (cx (glXCreateContext display vi 0 1)))
;            (glXMakeCurrent display window cx)
;            (print "OpenGL version: " (glGetString GL_VERSION))
;            (print "OpenGL vendor: " (glGetString GL_VENDOR))
;            (print "OpenGL renderer: " (glGetString GL_RENDERER))
;            (glXMakeCurrent display null null)
;
;            (this (tuple display screen window cx)))))
;         ((get-context)
;            (mail sender context)
;            (this context))
;         ((make-current)
;            (let ((display (ref context 1))
;                  (screen  (ref context 2))
;                  (window  (ref context 3))
;                  (cx      (ref context 4)))
;               (glXMakeCurrent display window cx))
;               (mail sender #true)
;            (this context))
;         ((stop-current)
;            (let ((display (ref context 1)))
;               (glXMakeCurrent display null null))
;               (mail sender #true)
;            (this context))
;;         ((create-new-window title)
;;            (let ((display (ref context 1))
;;                  (window  (ref context 3)))
;;               (XSelectInput display window ExposureMask)
;;               (XMapWindow display window)
;;               (XStoreName display window (c-string title)))
;;            (this context))
;         (else
;            (runtime-error "Unknown opengl server command" message))))))))))
;
;(mail 'opengl (tuple 'create-gl-context))
;
;(define (gl:make-current)
;   (interact 'opengl (tuple 'make-current)))
;(define (gl:stop-current)
;   (interact 'opengl (tuple 'stop-current)))


(define (gl:GetVersion)
   (cons 1 0))

; GLU
(define GLU_VERSION_1_0 1)
(define GLU_VERSION_1_1 1)

(define GLU_LIBRARY
   (cond
      (win32? "glu32")
      (linux? "libGLU.so")
      ;"HP-UX"
      ;"SunOS"
      ;"Darwin"
      ;"FreeBSD"
      ;"CYGWIN_NT-5.2-WOW64"
      ;"MINGW32_NT-5.2"
      ;...
      (else  (runtime-error "Unknown platform" uname))))
(define GLU (or
   (dlopen GLU_LIBRARY)
   (runtime-error "Can't find glu library" #f)))

(define GLUquadric* type-void*)

   (define gluErrorString (dlsym GLU GLubyte* "gluErrorString" GLenum))
   (define gluOrtho2D     (dlsym GLU GLvoid   "gluOrtho2D"     GLdouble GLdouble GLdouble GLdouble))
   (define gluPerspective (dlsym GLU GLvoid   "gluPerspective" GLdouble GLdouble GLdouble GLdouble))
   (define gluLookAt      (dlsym GLU GLvoid   "gluLookAt"      GLdouble GLdouble GLdouble GLdouble GLdouble GLdouble GLdouble GLdouble GLdouble))

   (define gluNewQuadric    (dlsym GLU GLUquadric* "gluNewQuadric"))
   (define gluDeleteQuadric (dlsym GLU GLvoid "gluDeleteQuadric" GLUquadric*))
   (define gluQuadricDrawStyle (dlsym GLU GLvoid "gluQuadricDrawStyle" GLUquadric* GLenum))
      (define GLU_POINT               100010)
      (define GLU_LINE                100011)
      (define GLU_FILL                100012)
      (define GLU_SILHOUETTE          100013)
   (define gluQuadricOrientation (dlsym GLU GLvoid "gluQuadricOrientation" GLUquadric* GLenum))
      (define GLU_OUTSIDE             100020)
      (define GLU_INSIDE              100021)

   (define gluSphere (dlsym GLU GLvoid "gluSphere" GLUquadric* GLdouble GLint GLint))
   (define gluCylinder (dlsym GLU GLvoid "gluCylinder" GLUquadric* GLdouble GLdouble GLdouble GLint GLint))

(define GLUnurbs* type-void*)
   (define gluNewNurbsRenderer (dlsym GLU GLUnurbs* "gluNewNurbsRenderer"))
   (define gluBeginSurface (dlsym GLU GLvoid "gluBeginSurface" GLUnurbs*))
   (define gluNurbsSurface (dlsym GLU GLvoid "gluNurbsSurface" GLUnurbs* GLint GLfloat* GLint GLfloat* GLint GLint GLfloat* GLint GLint GLenum))
   (define gluEndSurface   (dlsym GLU GLvoid "gluEndSurface" GLUnurbs*))
   (define gluNurbsProperty(dlsym GLU GLvoid "gluNurbsProperty" GLUnurbs* GLenum GLfloat))
      ;/*     GLU_FILL                100012
      (define GLU_OUTLINE_POLYGON     100240)
      (define GLU_OUTLINE_PATCH       100241)

(define GLU_AUTO_LOAD_MATRIX    100200)
(define GLU_CULLING             100201)
(define GLU_SAMPLING_TOLERANCE  100203)
(define GLU_DISPLAY_MODE        100204)
(define GLU_PARAMETRIC_TOLERANCE        100202)
(define GLU_SAMPLING_METHOD             100205)
(define GLU_U_STEP                      100206)
(define GLU_V_STEP                      100207)

; поддержка расширений:
(import (owl string))

(define (gl:ExtensionSupported? extension)
(let ((string (append '(#x20) (string->bytes (glGetString GL_EXTENSIONS)) '(#x20)))
      (substr (append '(#x20) (string->bytes extension) '(#x20))))
(for-each (λ (s) (display-to stderr s)) (list "Checking " extension " support..."))

(if
(let iter ((string string))
   (or
      (let loop ((one string) (two substr))
         (if (null? two)
            #true
            (if (not (null? one))
               (if (eq? (car one) (car two))
                  (loop (cdr one) (cdr two))))))
      (if (not (null? string))
         (iter (cdr string)))))
(begin (print " ok.") #true)
(begin (print " not found.") #false))))

))