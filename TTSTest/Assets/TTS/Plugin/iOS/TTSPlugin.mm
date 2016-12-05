//
//  TTSPlugin.m
//  Unity3DTTSPlugin
//
//  Created by Eralp Karaduman on 12/5/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

#import "TTSPlugin.h"

@implementation TTSPlugin
@end

extern "C" {
    void FooPluginFunction();
}

void FooPluginFunction() {
    NSLog(@"hello unity");
}
