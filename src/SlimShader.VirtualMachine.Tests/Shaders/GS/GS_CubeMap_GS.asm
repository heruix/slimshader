//
// Generated by Microsoft (R) HLSL Shader Compiler 9.30.9200.20789
//
//
///
// Buffer Definitions: 
//
// cbuffer $Globals
// {
//
//   float4x4 TransformMatrixArray[6];  // Offset:    0 Size:   384
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim Slot Elements
// ------------------------------ ---------- ------- ----------- ---- --------
// $Globals                          cbuffer      NA          NA    0        1
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// TEXCOORD                 0   xyz         0     NONE   float   xyz 
// TEXCOORD                 1   xyz         1     NONE   float   xyz 
// TEXCOORD                 2   xyz         2     NONE   float   xyz 
// TEXCOORD                 3   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyz         1     NONE   float   xyz 
// TEXCOORD                 1   xyz         2     NONE   float   xyz 
// TEXCOORD                 2   xy          3     NONE   float   xy  
// SV_RenderTargetArrayIndex     0   x           4  RTINDEX    uint   x   
//
gs_4_0
dcl_constantbuffer cb0[24], dynamicIndexed
dcl_input v[3][0].xyz
dcl_input v[3][1].xyz
dcl_input v[3][2].xyz
dcl_input v[3][3].xy
dcl_temps 2
dcl_inputprimitive triangle 
dcl_outputtopology trianglestrip 
dcl_output_siv o0.xyzw, position
dcl_output o1.xyz
dcl_output o2.xyz
dcl_output o3.xy
dcl_output_siv o4.x, rendertarget_array_index
dcl_maxout 24
mov r0.x, l(0)
loop 
  ige r0.y, r0.x, l(6)
  breakc_nz r0.y
  ishl r0.y, r0.x, l(2)
  mov r0.z, l(0)
  loop 
    ige r0.w, r0.z, l(3)
    breakc_nz r0.w
    mul r1.xyzw, cb0[r0.y + 1].xyzw, v[r0.z + 0][0].yyyy
    mad r1.xyzw, cb0[r0.y + 0].xyzw, v[r0.z + 0][0].xxxx, r1.xyzw
    mad r1.xyzw, cb0[r0.y + 2].xyzw, v[r0.z + 0][0].zzzz, r1.xyzw
    add r1.xyzw, r1.xyzw, cb0[r0.y + 3].xyzw
    mov o0.xyzw, r1.xyzw
    mov o1.xyz, v[r0.z + 0][1].xyzx
    mov o2.xyz, v[r0.z + 0][2].xyzx
    mov o3.xy, v[r0.z + 0][3].xyxx
    mov o4.x, r0.x
    emit 
    iadd r0.z, r0.z, l(1)
  endloop 
  cut 
  iadd r0.x, r0.x, l(1)
endloop 
ret 
// Approximately 25 instruction slots used