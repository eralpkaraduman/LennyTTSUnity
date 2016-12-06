//
//  TTSPlugin.m
//  Unity3DTTSPlugin
//
//  Created by Eralp Karaduman on 12/5/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "TTSPlugin.h"

// This is to allow test native iOS project to build properly. UNITY_DEV preprocessor flag is only
// effective in iOS App Unity3DTTSPlugin target, not in Unity env

#ifdef UNITY_DEV
void UnitySendMessage( const char * className, const char * methodName, const char * param ) {
    // Do nothing
}
#endif

static TTSPlugin *pluginInstance;

// Name of the tts plugin util prefab game object
static char* UnityObjectName = "TTSPlugin";

// Names of the functions called from Unity3D by UnitySendMessage

static NSString* const DidStartSpeakingFunctionName = @"DidStartSpeaking";
static NSString* const DidFinishSpeakingFunctionName = @"DidFinishSpeaking";
static NSString* const WillSpeakSubStringFunctionName = @"WillSpeakSubString";
static NSString* const parameterDelimiter = @"<#>";

#pragma mark - Exposed to Unity

// Exposed to untity, called from TTSTest/Assets/TTS/TTSPlugin.cs public void Begin(string text)

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

    // Finds the requested voice name, if succeeds, sets it. Else it just uses the default one

    if (voiceName != nil) {

        for (AVSpeechSynthesisVoice *voice in [AVSpeechSynthesisVoice speechVoices]) {

            if ([voice.name isEqualToString:voiceName]) {
                utterance.voice = voice;
                break;
            }
        }
    }

    [_synthesizer speakUtterance:utterance];
}

#pragma mark - Calling Unity functions

- (void)callUnityFunction:(NSString*)unityFunction withParam:(NSString*)param {

    char *utf8FunctionName = (char*)[unityFunction UTF8String];

    // Sends empty string if there are is parameter to avoid possible null pointer errors
    char *utf8param = (char*)[@"" UTF8String];

    // If param was provided, converts to c string
    if (param != nil) {
        utf8param = (char*)[param UTF8String];
    }

    UnitySendMessage(UnityObjectName, utf8FunctionName, utf8param);
}

- (void)didFinishSpeaking {

    [self callUnityFunction:DidFinishSpeakingFunctionName withParam:nil];
}

- (void)didStartSpeakingString:(NSString*)string {

    [self callUnityFunction:DidStartSpeakingFunctionName withParam:string];
}

- (void)willSpeakSubString:(NSString*)subString
                  ofString:(NSString*)string
                atLocation:(unsigned long)location
                  inLength:(unsigned long)length {

    NSString *stringLocation = [NSString stringWithFormat:@"%ld", location];
    NSString *stringLength = [NSString stringWithFormat:@"%ld", length];
    NSArray *paramsArray = @[subString, string, stringLocation, stringLength];

    // encodes params to one string by joining with delimiter, this should be preferable encoded
    // to JSON or some other standard format, but for demo purposes
    // i decided that should be sufficient

    NSString *joinedParams = [paramsArray componentsJoinedByString:parameterDelimiter];

    [self callUnityFunction:WillSpeakSubStringFunctionName withParam:joinedParams];
}

#pragma mark - AVSpeechSynthesizerDelegate

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer
  didStartSpeechUtterance:(AVSpeechUtterance *)utterance {

    [self didStartSpeakingString:utterance.speechString];
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer
 didFinishSpeechUtterance:(AVSpeechUtterance *)utterance {

    [self didFinishSpeaking];
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer
willSpeakRangeOfSpeechString:(NSRange)characterRange
                utterance:(AVSpeechUtterance *)utterance {

    NSString *subString = [utterance.speechString substringWithRange:characterRange];

    [self willSpeakSubString:subString
                    ofString:utterance.speechString
                  atLocation:characterRange.location
                    inLength:characterRange.length];

}

@end
