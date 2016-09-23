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
    
    NSLayoutConstraint *topConstraint;
    NSLayoutConstraint *leftConstraint;
    NSLayoutConstraint *rightConstraint;
    NSLayoutConstraint *bottomConstraint;
    
    // Setting up left constraint
    leftConstraint = [NSLayoutConstraint constraintWithItem:self.youtube
                                                  attribute:NSLayoutAttributeLeft
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:self.view
                                                  attribute:NSLayoutAttributeLeft
                                                 multiplier:1.0
                                                   constant:0];
    [self.view addConstraint:leftConstraint];
    
    // Setting up right constraint
    rightConstraint = [NSLayoutConstraint constraintWithItem:self.youtube
                                                   attribute:NSLayoutAttributeRight
                                                   relatedBy:NSLayoutRelationEqual
                                                      toItem:self.view
                                                   attribute:NSLayoutAttributeRight
                                                  multiplier:1.0
                                                    constant:0];
    [self.view addConstraint:rightConstraint];
    
    // Setting up top constraint
    topConstraint = [NSLayoutConstraint constraintWithItem:self.youtube
                                                 attribute:NSLayoutAttributeTop
                                                 relatedBy:NSLayoutRelationEqual
                                                    toItem:self.view
                                                 attribute:NSLayoutAttributeTop
                                                multiplier:1.0
                                                  constant:0];
    [self.view addConstraint:topConstraint];
    
    // Setting up bottom constraint
    bottomConstraint = [NSLayoutConstraint constraintWithItem:self.youtube
                                                    attribute:NSLayoutAttributeBottom
                                                    relatedBy:NSLayoutRelationEqual
                                                       toItem:self.view
                                                    attribute:NSLayoutAttributeBottom
                                                   multiplier:1.0
                                                     constant:0];
    [self.view addConstraint:bottomConstraint];
    
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
