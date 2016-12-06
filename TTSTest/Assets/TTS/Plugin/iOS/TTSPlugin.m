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

static TTSPlugin *pluginInstance;

static char* UnityObjectName = "TTSPlugin";
static NSString* const DidStartSpeakingFunctionName = @"DidStartSpeaking";
static NSString* const DidFinishSpeakingFunctionName = @"DidFinishSpeaking";
static NSString* const WillSpeakSubStringFunctionName = @"WillSpeakSubString";

#pragma mark - Exposed to Unity

void BeginSpeaking(char* text, char* voice) {

    if (pluginInstance == nil) {
        pluginInstance = [[TTSPlugin alloc] init];
    }

    NSString *utf8String = [NSString stringWithCString:text encoding:NSUTF8StringEncoding];
    NSString *utf8Voice = [NSString stringWithCString:voice encoding:NSUTF8StringEncoding];
    [pluginInstance beginSpeakingWithString:utf8String withVoice:utf8Voice];
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

- (void)beginSpeakingWithString: (NSString*)textString withVoice: (NSString*)voiceName {

    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:textString];
    utterance.preUtteranceDelay = 0.6f;
    utterance.postUtteranceDelay = 0.6f;
    utterance.pitchMultiplier = 0.3f;
    utterance.rate = 0.4f;

    if (voiceName != nil) {

        for (AVSpeechSynthesisVoice *voice in [AVSpeechSynthesisVoice speechVoices]) {

            if ([voice.name isEqualToString:voiceName]) {
                utterance.voice = voice;
                break;
            }
        }
    }

    [_synthesizer speakUtterance:utterance];

    NSLog(@"begin speaking");
}

#pragma mark - Calling Unity functions

- (void)callUnityFunction: (NSString*)unityFunction withParam: (NSString*)param {

    char *utf8FunctionName = (char*)[unityFunction UTF8String];
    char *utf8param = (char*)[@"" UTF8String];

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
    NSString *csvParam = [paramsArray componentsJoinedByString:@"<#>"];

    [self callUnityFunction:WillSpeakSubStringFunctionName withParam:csvParam];
}

#pragma mark - AVSpeechSynthesizerDelegate

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance {

    [self didStartSpeakingString:utterance.speechString];
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance {

    [self didFinishSpeaking];
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer willSpeakRangeOfSpeechString:(NSRange)characterRange utterance:(AVSpeechUtterance *)utterance {

    NSString *subString = [utterance.speechString substringWithRange:characterRange];

    [self willSpeakSubString:subString
                    ofString:utterance.speechString
                  atLocation:characterRange.location
                    inLength:characterRange.length];

}

@end
