#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <cstring>
#include <string.h>
#include <stdio.h>
#include <cmath>
#include <limits>
#include <assert.h>

// TTSPlugin
struct TTSPlugin_t1906882278;
// System.String
struct String_t;
// TTSTest
struct TTSTest_t4019969285;

#include "class-internals.h"
#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_Array1146569071.h"
#include "AssemblyU2DCSharp_U3CModuleU3E86524790.h"
#include "AssemblyU2DCSharp_U3CModuleU3E86524790MethodDeclarations.h"
#include "AssemblyU2DCSharp_TTSPlugin1906882278.h"
#include "AssemblyU2DCSharp_TTSPlugin1906882278MethodDeclarations.h"
#include "mscorlib_System_Void2863195528.h"
#include "UnityEngine_UnityEngine_MonoBehaviour667441552MethodDeclarations.h"
#include "UnityEngine_UnityEngine_Debug4195163081MethodDeclarations.h"
#include "mscorlib_System_String7231557.h"
#include "mscorlib_System_Object4170816371.h"
#include "AssemblyU2DCSharp_TTSTest4019969285.h"
#include "AssemblyU2DCSharp_TTSTest4019969285MethodDeclarations.h"

#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// System.Void TTSPlugin::.ctor()
extern "C"  void TTSPlugin__ctor_m416989509 (TTSPlugin_t1906882278 * __this, const MethodInfo* method)
{
	{
		MonoBehaviour__ctor_m2022291967(__this, /*hidden argument*/NULL);
		return;
	}
}
extern "C" void DEFAULT_CALL FooPluginFunction();
// System.Void TTSPlugin::FooPluginFunction()
extern "C"  void TTSPlugin_FooPluginFunction_m2070457780 (Il2CppObject * __this /* static, unused */, const MethodInfo* method)
{
	typedef void (DEFAULT_CALL *PInvokeFunc) ();

	// Native function invocation
	reinterpret_cast<PInvokeFunc>(FooPluginFunction)();

}
// System.Void TTSPlugin::CallNativePlugin()
extern Il2CppClass* Debug_t4195163081_il2cpp_TypeInfo_var;
extern Il2CppCodeGenString* _stringLiteral1292533319;
extern const uint32_t TTSPlugin_CallNativePlugin_m2024306695_MetadataUsageId;
extern "C"  void TTSPlugin_CallNativePlugin_m2024306695 (TTSPlugin_t1906882278 * __this, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		il2cpp_codegen_initialize_method (TTSPlugin_CallNativePlugin_m2024306695_MetadataUsageId);
		s_Il2CppMethodIntialized = true;
	}
	{
		IL2CPP_RUNTIME_CLASS_INIT(Debug_t4195163081_il2cpp_TypeInfo_var);
		Debug_Log_m1731103628(NULL /*static, unused*/, _stringLiteral1292533319, /*hidden argument*/NULL);
		TTSPlugin_FooPluginFunction_m2070457780(NULL /*static, unused*/, /*hidden argument*/NULL);
		return;
	}
}
// System.Void TTSPlugin::HelloUnity(System.String)
extern Il2CppClass* Debug_t4195163081_il2cpp_TypeInfo_var;
extern Il2CppCodeGenString* _stringLiteral2267153550;
extern const uint32_t TTSPlugin_HelloUnity_m2437525600_MetadataUsageId;
extern "C"  void TTSPlugin_HelloUnity_m2437525600 (TTSPlugin_t1906882278 * __this, String_t* ___message0, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		il2cpp_codegen_initialize_method (TTSPlugin_HelloUnity_m2437525600_MetadataUsageId);
		s_Il2CppMethodIntialized = true;
	}
	{
		IL2CPP_RUNTIME_CLASS_INIT(Debug_t4195163081_il2cpp_TypeInfo_var);
		Debug_Log_m1731103628(NULL /*static, unused*/, _stringLiteral2267153550, /*hidden argument*/NULL);
		return;
	}
}
// System.Void TTSTest::.ctor()
extern "C"  void TTSTest__ctor_m1292183558 (TTSTest_t4019969285 * __this, const MethodInfo* method)
{
	{
		MonoBehaviour__ctor_m2022291967(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void TTSTest::Start()
extern "C"  void TTSTest_Start_m239321350 (TTSTest_t4019969285 * __this, const MethodInfo* method)
{
	{
		TTSPlugin_t1906882278 * L_0 = __this->get_tts_2();
		NullCheck(L_0);
		TTSPlugin_CallNativePlugin_m2024306695(L_0, /*hidden argument*/NULL);
		return;
	}
}
// System.Void TTSTest::Update()
extern "C"  void TTSTest_Update_m3129846727 (TTSTest_t4019969285 * __this, const MethodInfo* method)
{
	{
		return;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
