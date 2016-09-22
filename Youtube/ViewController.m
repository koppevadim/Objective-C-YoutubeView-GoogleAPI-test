//
//  ViewController.m
//  Youtube
//
//  Created by Вадим Коппе on 21.09.16.
//  Copyright © 2016 Вадим Коппе. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

YoutubeView *youtube;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    youtube = [[YoutubeView alloc] init];
    
    youtube.delegate = self;
    
    [self addChildViewController:youtube];
    [self.view addSubview:youtube.view];
    [youtube didMoveToParentViewController:self];
    
    [youtube setupVideoId:@"GBa2sS2EKAg"];
}

- (void) onYoutubeBecomeReady:(YoutubeView *)setter
{
    [youtube playVideo];
    
    [youtube fullscreenVideo:YES];
    
    [youtube qualityVideo:kYTPlaybackQualityAuto];
}

- (void) onYoutubeDidChangeToState:(YoutubeView *)setter state:(YTPlayerState)state
{
}


@end
