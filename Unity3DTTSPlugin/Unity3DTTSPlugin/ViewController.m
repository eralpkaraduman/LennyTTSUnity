//
//  ViewController.m
//  Unity3DTTSPlugin
//
//  Created by Eralp Karaduman on 12/5/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

#import "ViewController.h"
#import "TTSPlugin.h"

@interface ViewController ()
@property (nonatomic, strong) TTSPlugin *tts;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _tts = [[TTSPlugin alloc] init];
    [_tts beginSpeakingWithString:@"Hello Unity"];
}

@end
