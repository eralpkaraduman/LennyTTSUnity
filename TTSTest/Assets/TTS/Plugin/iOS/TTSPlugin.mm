//
//  TTSPlugin.m
//  Unity3DTTSPlugin
//
//  Created by Eralp Karaduman on 12/5/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

#import "TTSPlugin.h"

void UnitySendMessage( const char * className, const char * methodName, const char * param );

@implementation TTSPlugin
@end

extern "C" {
    void FooPluginFunction();
}

void FooPluginFunction() {
    NSLog(@"hello unity");

    UnitySendMessage( "TTSPlugin", "HelloUnity", "Hello Unity!" );
}

#ifdef UNITY_DEV

void UnitySendMessage( const char * className, const char * methodName, const char * param ) { }

#endif
