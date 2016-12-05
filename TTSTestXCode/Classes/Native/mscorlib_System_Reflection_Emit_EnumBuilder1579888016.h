#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// System.Reflection.Emit.TypeBuilder
struct TypeBuilder_t1918497079;
// System.Type
struct Type_t;

#include "mscorlib_System_Type2863145774.h"

#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// System.Reflection.Emit.EnumBuilder
struct  EnumBuilder_t1579888016  : public Type_t
{
public:
	// System.Reflection.Emit.TypeBuilder System.Reflection.Emit.EnumBuilder::_tb
	TypeBuilder_t1918497079 * ____tb_7;
	// System.Type System.Reflection.Emit.EnumBuilder::_underlyingType
	Type_t * ____underlyingType_8;

public:
	inline static int32_t get_offset_of__tb_7() { return static_cast<int32_t>(offsetof(EnumBuilder_t1579888016, ____tb_7)); }
	inline TypeBuilder_t1918497079 * get__tb_7() const { return ____tb_7; }
	inline TypeBuilder_t1918497079 ** get_address_of__tb_7() { return &____tb_7; }
	inline void set__tb_7(TypeBuilder_t1918497079 * value)
	{
		____tb_7 = value;
		Il2CppCodeGenWriteBarrier(&____tb_7, value);
	}

	inline static int32_t get_offset_of__underlyingType_8() { return static_cast<int32_t>(offsetof(EnumBuilder_t1579888016, ____underlyingType_8)); }
	inline Type_t * get__underlyingType_8() const { return ____underlyingType_8; }
	inline Type_t ** get_address_of__underlyingType_8() { return &____underlyingType_8; }
	inline void set__underlyingType_8(Type_t * value)
	{
		____underlyingType_8 = value;
		Il2CppCodeGenWriteBarrier(&____underlyingType_8, value);
	}
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
