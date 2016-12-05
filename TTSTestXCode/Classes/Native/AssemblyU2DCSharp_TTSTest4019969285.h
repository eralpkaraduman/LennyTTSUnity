#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// TTSPlugin
struct TTSPlugin_t1906882278;

#include "UnityEngine_UnityEngine_MonoBehaviour667441552.h"

#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// TTSTest
struct  TTSTest_t4019969285  : public MonoBehaviour_t667441552
{
public:
	// TTSPlugin TTSTest::tts
	TTSPlugin_t1906882278 * ___tts_2;

public:
	inline static int32_t get_offset_of_tts_2() { return static_cast<int32_t>(offsetof(TTSTest_t4019969285, ___tts_2)); }
	inline TTSPlugin_t1906882278 * get_tts_2() const { return ___tts_2; }
	inline TTSPlugin_t1906882278 ** get_address_of_tts_2() { return &___tts_2; }
	inline void set_tts_2(TTSPlugin_t1906882278 * value)
	{
		___tts_2 = value;
		Il2CppCodeGenWriteBarrier(&___tts_2, value);
	}
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
