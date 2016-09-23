//
//  YoutubeView.m
//  Youtube
//
//  Created by Вадим Коппе on 23.09.16.
//  Copyright © 2016 Вадим Коппе. All rights reserved.
//

#import "YoutubeView.h"

@implementation YoutubeView

NSLayoutConstraint *topConstraint;
NSLayoutConstraint *leftConstraint;
NSLayoutConstraint *rightConstraint;
NSLayoutConstraint *bottomConstraint;

@synthesize delegate;

- (id)init
{
    
    self = [super init];
    
    if (self)
    {
        paddingTop = 100;
        paddingBottom = 100;
        
        // disable interface interactions
        self.userInteractionEnabled = NO;
        
        youtubePlayerView = [[YTPlayerView alloc] init];
        
        [self addSubview:youtubePlayerView];
        
        youtubePlayerView.delegate = self;
        
        // Setting up left constraint
        leftConstraint = [NSLayoutConstraint constraintWithItem:youtubePlayerView
                                                      attribute:NSLayoutAttributeLeft
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:self
                                                      attribute:NSLayoutAttributeLeft
                                                     multiplier:1.0
                                                       constant:0];
        [self addConstraint:leftConstraint];
        
        // Setting up right constraint
        rightConstraint = [NSLayoutConstraint constraintWithItem:youtubePlayerView
                                                       attribute:NSLayoutAttributeRight
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:self
                                                       attribute:NSLayoutAttributeRight
                                                      multiplier:1.0
                                                        constant:0];
        [self addConstraint:rightConstraint];
        
        // Setting up top constraint
        topConstraint = [NSLayoutConstraint constraintWithItem:youtubePlayerView
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.0
                                                      constant:paddingTop];
        [self addConstraint:topConstraint];
        
        // Setting up bottom constraint
        bottomConstraint = [NSLayoutConstraint constraintWithItem:youtubePlayerView
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0
                                                         constant:-(paddingBottom)];
        [self addConstraint:bottomConstraint];
        
        youtubePlayerView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return self;
}

/**
 * Invoked when the player view is ready to receive API calls.
 *
 * @param playerView The YTPlayerView instance that has become ready.
 */
-(void)playerViewDidBecomeReady:(YTPlayerView *)playerView
{
    [self.delegate onYoutubeBecomeReady:self];
}

/**
 * Callback invoked when player state has changed, e.g. stopped or started playback.
 *
 * @param playerView The YTPlayerView instance where playback state has changed.
 * @param state YTPlayerState designating the new playback state.
 */
- (void)playerView:(YTPlayerView *)playerView didChangeToState:(YTPlayerState)state
{
    //NSLog(@"didChangeToState", (long)state);
    [self.delegate onYoutubeDidChangeToState:self state:state];
}

/**
 * Callback invoked when playback quality has changed.
 *
 * @param playerView The YTPlayerView instance where playback quality has changed.
 * @param quality YTPlaybackQuality designating the new playback quality.
 */
- (void)playerView:(YTPlayerView *)playerView didChangeToQuality:(YTPlaybackQuality)quality
{
    // NSLog(@"didChangeToQuality", (long)quality);
}

/**
 * Callback invoked frequently when playBack is plaing.
 *
 * @param playerView The YTPlayerView instance where the error has occurred.
 * @param playTime float containing curretn playback time.
 */
- (void)playerView:(YTPlayerView *)playerView didPlayTime:(float)playTime
{
    // NSLog(@"didPlayTime", (long)playTime);
}

/**
 * Callback invoked when an error has occured.
 *
 * @param playerView The YTPlayerView instance where the error has occurred.
 * @param error YTPlayerError containing the error state.
 */
- (void)playerView:(YTPlayerView *)playerView receivedError:(YTPlayerError)error
{
    //NSLog(@"%ld", (long)error);
}

// Public methods

/**
 * Start play Youtube video
 */
- (void) playVideo
{
    [youtubePlayerView playVideo];
}

/**
 * Setup pause Youtube video
 */
- (void) pauseVideo
{
    [youtubePlayerView pauseVideo];
}

/**
 * Setup link to Youtube video
 *
 * @param youtubeVideoId video link
 */
- (void) setupVideoId:(NSString*)youtubeVideoId
{
    NSDictionary *playerVars = @{
                                 @"controls" : @0,
                                 @"playsinline" : @1,
                                 @"autohide" : @1,
                                 @"showinfo" : @0,
                                 @"modestbranding" : @1
                                 };
    
    // Load youtube video by youtube video id with parametrs
    [youtubePlayerView loadWithVideoId:youtubeVideoId playerVars:playerVars];
}

/**
 * Seek to Youtube video
 *
 * @param seekToSeconds time seek to
 */
- (void) seekToSeconds:(CGFloat)seekToSeconds
{
    [youtubePlayerView seekToSeconds:seekToSeconds allowSeekAhead:true];
}

/**
 * quality of Youtube video
 *
 * @param quality
 */
- (void) qualityVideo:(YTPlaybackQuality)quality
{
    [youtubePlayerView setPlaybackQuality:quality];
}

/**
 * Activate or diactivate fullscreen in Youtube video
 *
 * @param activateFullscreenVideo setup fullscreen or nolrmal mode
 */
- (void) fullscreenVideo:(BOOL)activateFullscreenVideo
{
    // Animate Constraint changes
    if (activateFullscreenVideo == YES)
    {
        topConstraint.constant = 0;
        bottomConstraint.constant = 0;
    }else
    {
        topConstraint.constant = paddingTop;
        bottomConstraint.constant = -(paddingBottom);
    }
    
    [UIView animateWithDuration:0.5
                     animations:^{
                         [self layoutIfNeeded];
                     }];
}

/**
 * Activate or diactivate Picture in picture mode
 *
 * @param activatePictureInPicture setup picture in picture mode
 */
- (void) allowsPictureInPicture:(BOOL)activatePictureInPicture
{
    [youtubePlayerView webView].allowsPictureInPictureMediaPlayback = &activatePictureInPicture;
}

@end
