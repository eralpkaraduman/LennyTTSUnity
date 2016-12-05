//
//  TTSPlugin.m
//  Unity3DTTSPlugin
//
//  Created by Eralp Karaduman on 12/5/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "TTSPlugin.h"

void UnitySendMessage( const char * className, const char * methodName, const char * param );

@interface TTSPlugin ()
@property (nonatomic, strong) AVSpeechSynthesizer *synthesizer;
@end

@implementation TTSPlugin

- (instancetype)init {
    self = [super init];
    if (self) {
        _synthesizer = [[AVSpeechSynthesizer alloc] init];
    }
    return self;
}

- (void) beginSpeakingWithString: (NSString*)textString {
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:textString];
    [_synthesizer speakUtterance:utterance];
}

@end

extern "C" {
    void FooPluginFunction(char* text);
}

static TTSPlugin *tts = nil;

void FooPluginFunction(char* text) {

    if (tts == nil) {
        tts = [[TTSPlugin alloc] init];
    }

    NSString *utf8String = [NSString stringWithCString:text encoding:NSUTF8StringEncoding];

    [tts beginSpeakingWithString:utf8String];

    UnitySendMessage( "TTSPlugin", "HelloUnity", "Hello Unity!" );
}

#ifdef UNITY_DEV

void UnitySendMessage( const char * className, const char * methodName, const char * param ) {
    // Do nothing
}

#endif
