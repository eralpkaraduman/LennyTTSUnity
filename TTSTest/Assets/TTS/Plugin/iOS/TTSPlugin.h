//
//  TTSPlugin.h
//  Unity3DTTSPlugin
//
//  Created by Eralp Karaduman on 12/5/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

@interface TTSPlugin: NSObject

- (void)beginSpeakingWithString:(NSString*)textString withVoice:(NSString*)voiceName;

@end
