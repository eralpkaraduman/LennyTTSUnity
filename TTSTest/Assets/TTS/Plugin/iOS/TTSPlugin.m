//
//  TTSPlugin.m
//  Unity3DTTSPlugin
//
//  Created by Eralp Karaduman on 12/5/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "TTSPlugin.h"

#ifdef UNITY_DEV
void UnitySendMessage( const char * className, const char * methodName, const char * param ) {
    // Do nothing
}
#endif

TTSPlugin *pluginInstance;

static char* UnityObjectName = "TTSPlugin";
static NSString* const DidStartSpeakingFunctionName = @"DidStartSpeaking";
static NSString* const DidFinishSpeakingFunctionName = @"DidFinishSpeaking";
static NSString* const WillSpeakSubStringFunctionName = @"WillSpeakSubString";
static NSString* const VoiceName = @"Aaron";

#pragma mark - Exposed to Unity

void Setup() {
    pluginInstance = [[TTSPlugin alloc] init];
}

void BeginSpeaking(char* text) {

    NSString *utf8String = [NSString stringWithCString:text encoding:NSUTF8StringEncoding];
    [pluginInstance beginSpeakingWithString:utf8String];
}

#pragma mark - AVSpeechSynthesizer implementation

@interface TTSPlugin () <AVSpeechSynthesizerDelegate>
@property (nonatomic, strong) AVSpeechSynthesizer *synthesizer;
@end

@implementation TTSPlugin

- (instancetype)init {
    
    self = [super init];
    if (self) {
        _synthesizer = [[AVSpeechSynthesizer alloc] init];
        _synthesizer.delegate = self;
    }
    return self;
}

- (void)beginSpeakingWithString: (NSString*)textString {
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:textString];
    utterance.pitchMultiplier = 0.3f;
    utterance.rate = 0.4f;

    for (AVSpeechSynthesisVoice *voice in [AVSpeechSynthesisVoice speechVoices]) {

        if ([voice.name isEqualToString:VoiceName]) {
            utterance.voice = voice;
            break;
        }
    }

    [_synthesizer speakUtterance:utterance];
}

#pragma mark - Calling Unity functions

- (void)callUnityFunction: (NSString*)unityFunction withParam: (NSString*)param {

    char *utf8FunctionName = (char*)[param UTF8String];
    char *utf8param = nil;

    if (param != nil) {
        utf8param = (char*)[param UTF8String];
    }

    UnitySendMessage(UnityObjectName, utf8FunctionName, utf8param);
}

- (void)didFinishSpeaking {
    [self callUnityFunction:DidFinishSpeakingFunctionName withParam:nil];
}

- (void)didStartSpeakingString: (NSString*)string {
    [self callUnityFunction:DidStartSpeakingFunctionName withParam:string];
}

- (void)willSpeakSubString:(NSString*)subString ofString:(NSString*)string atLocation:(unsigned long)location inLength:(unsigned long)length {

    NSString *stringLocation = [NSString stringWithFormat:@"%ld", location];
    NSString *stringLength = [NSString stringWithFormat:@"%ld", length];
    NSArray *paramsArray = @[subString, string, stringLocation, stringLength];
    NSString *csvParam = [paramsArray componentsJoinedByString:@", "];

    [self callUnityFunction:WillSpeakSubStringFunctionName withParam:csvParam];

    NSLog(@"%@", csvParam);
}

#pragma mark - AVSpeechSynthesizerDelegate

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance {

    [self didStartSpeakingString:utterance.speechString];
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance {

    [self didFinishSpeaking];
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer willSpeakRangeOfSpeechString:(NSRange)characterRange utterance:(AVSpeechUtterance *)utterance {

    NSString *string = [utterance.speechString substringWithRange:NSMakeRange(0, characterRange.location + characterRange.length)];
    NSString *subString = [utterance.speechString substringWithRange:characterRange];

    [self willSpeakSubString:subString
                    ofString:string
                  atLocation:characterRange.location
                    inLength:characterRange.length];

}

@end
