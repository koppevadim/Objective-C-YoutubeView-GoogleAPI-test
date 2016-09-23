//
//  ViewController.m
//  Youtube
//
//  Created by Вадим Коппе on 23.09.16.
//  Copyright © 2016 Вадим Коппе. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) YoutubeView *youtube;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.youtube = [[YoutubeView alloc] init];
    
    self.youtube.delegate = self;
    
    [self.view addSubview:self.youtube];
    
    [self.youtube setupVideoId:@"GBa2sS2EKAg"];
    
    // Setting up left constraint
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.youtube
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1.0
                                                           constant:0]];
    
    // Setting up right constraint
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.youtube
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:0]];
    
    // Setting up top constraint
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.youtube
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:0]];
    
    // Setting up bottom constraint
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.youtube
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0]];
    
    self.youtube.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void) onYoutubeBecomeReady:(YoutubeView *)setter
{
    [self.youtube playVideo];
    
    [self.youtube fullscreenVideo:YES];
    
    [self.youtube qualityVideo:kYTPlaybackQualityAuto];
}

- (void) onYoutubeDidChangeToState:(YoutubeView *)setter state:(YTPlayerState)state
{
}


@end
