﻿#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// System.Byte[]
struct ByteU5BU5D_t4260760469;

#include "mscorlib_System_Object4170816371.h"

#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// System.Collections.Generic.List`1<System.Byte>
struct  List_1_t4230795212  : public Il2CppObject
{
public:
	// T[] System.Collections.Generic.List`1::_items
	ByteU5BU5D_t4260760469* ____items_0;
	// System.Int32 System.Collections.Generic.List`1::_size
	int32_t ____size_1;
	// System.Int32 System.Collections.Generic.List`1::_version
	int32_t ____version_2;

public:
	inline static int32_t get_offset_of__items_0() { return static_cast<int32_t>(offsetof(List_1_t4230795212, ____items_0)); }
	inline ByteU5BU5D_t4260760469* get__items_0() const { return ____items_0; }
	inline ByteU5BU5D_t4260760469** get_address_of__items_0() { return &____items_0; }
	inline void set__items_0(ByteU5BU5D_t4260760469* value)
	{
		____items_0 = value;
		Il2CppCodeGenWriteBarrier(&____items_0, value);
	}

	inline static int32_t get_offset_of__size_1() { return static_cast<int32_t>(offsetof(List_1_t4230795212, ____size_1)); }
	inline int32_t get__size_1() const { return ____size_1; }
	inline int32_t* get_address_of__size_1() { return &____size_1; }
	inline void set__size_1(int32_t value)
	{
		____size_1 = value;
	}

	inline static int32_t get_offset_of__version_2() { return static_cast<int32_t>(offsetof(List_1_t4230795212, ____version_2)); }
	inline int32_t get__version_2() const { return ____version_2; }
	inline int32_t* get_address_of__version_2() { return &____version_2; }
	inline void set__version_2(int32_t value)
	{
		____version_2 = value;
	}
};

struct List_1_t4230795212_StaticFields
{
public:
	// T[] System.Collections.Generic.List`1::EmptyArray
	ByteU5BU5D_t4260760469* ___EmptyArray_3;

public:
	inline static int32_t get_offset_of_EmptyArray_3() { return static_cast<int32_t>(offsetof(List_1_t4230795212_StaticFields, ___EmptyArray_3)); }
	inline ByteU5BU5D_t4260760469* get_EmptyArray_3() const { return ___EmptyArray_3; }
	inline ByteU5BU5D_t4260760469** get_address_of_EmptyArray_3() { return &___EmptyArray_3; }
	inline void set_EmptyArray_3(ByteU5BU5D_t4260760469* value)
	{
		___EmptyArray_3 = value;
		Il2CppCodeGenWriteBarrier(&___EmptyArray_3, value);
	}
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
