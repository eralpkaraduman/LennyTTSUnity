﻿#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>
#include <assert.h>
#include <exception>

// System.String
struct String_t;
// System.Object
struct Il2CppObject;
// UnityEngine.Rect
struct Rect_t4241904616;
struct Rect_t4241904616_marshaled_pinvoke;
struct Rect_t4241904616_marshaled_com;

#include "codegen/il2cpp-codegen.h"
#include "UnityEngine_UnityEngine_Rect4241904616.h"
#include "UnityEngine_UnityEngine_Vector34282066566.h"
#include "mscorlib_System_Object4170816371.h"

// System.Single UnityEngine.Rect::get_x()
extern "C"  float Rect_get_x_m982385354 (Rect_t4241904616 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Single UnityEngine.Rect::get_y()
extern "C"  float Rect_get_y_m982386315 (Rect_t4241904616 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Single UnityEngine.Rect::get_width()
extern "C"  float Rect_get_width_m2824209432 (Rect_t4241904616 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Single UnityEngine.Rect::get_height()
extern "C"  float Rect_get_height_m2154960823 (Rect_t4241904616 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Single UnityEngine.Rect::get_xMin()
extern "C"  float Rect_get_xMin_m371109962 (Rect_t4241904616 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Single UnityEngine.Rect::get_yMin()
extern "C"  float Rect_get_yMin_m399739113 (Rect_t4241904616 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Single UnityEngine.Rect::get_xMax()
extern "C"  float Rect_get_xMax_m370881244 (Rect_t4241904616 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Single UnityEngine.Rect::get_yMax()
extern "C"  float Rect_get_yMax_m399510395 (Rect_t4241904616 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.String UnityEngine.Rect::ToString()
extern "C"  String_t* Rect_ToString_m2093687658 (Rect_t4241904616 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.Rect::Contains(UnityEngine.Vector3)
extern "C"  bool Rect_Contains_m3556594041 (Rect_t4241904616 * __this, Vector3_t4282066566  ___point0, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 UnityEngine.Rect::GetHashCode()
extern "C"  int32_t Rect_GetHashCode_m89026168 (Rect_t4241904616 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.Rect::Equals(System.Object)
extern "C"  bool Rect_Equals_m1091722644 (Rect_t4241904616 * __this, Il2CppObject * ___other0, const MethodInfo* method) IL2CPP_METHOD_ATTR;

// Methods for marshaling
struct Rect_t4241904616;
struct Rect_t4241904616_marshaled_pinvoke;

extern "C" void Rect_t4241904616_marshal_pinvoke(const Rect_t4241904616& unmarshaled, Rect_t4241904616_marshaled_pinvoke& marshaled);
extern "C" void Rect_t4241904616_marshal_pinvoke_back(const Rect_t4241904616_marshaled_pinvoke& marshaled, Rect_t4241904616& unmarshaled);
extern "C" void Rect_t4241904616_marshal_pinvoke_cleanup(Rect_t4241904616_marshaled_pinvoke& marshaled);

// Methods for marshaling
struct Rect_t4241904616;
struct Rect_t4241904616_marshaled_com;

extern "C" void Rect_t4241904616_marshal_com(const Rect_t4241904616& unmarshaled, Rect_t4241904616_marshaled_com& marshaled);
extern "C" void Rect_t4241904616_marshal_com_back(const Rect_t4241904616_marshaled_com& marshaled, Rect_t4241904616& unmarshaled);
extern "C" void Rect_t4241904616_marshal_com_cleanup(Rect_t4241904616_marshaled_com& marshaled);
