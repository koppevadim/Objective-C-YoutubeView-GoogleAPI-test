//
//  YoutubeView.h
//  Youtube
//
//  Created by Вадим Коппе on 21.09.16.
//  Copyright © 2016 Вадим Коппе. All rights reserved.
//

#import "YTPlayerView.h"

@class YoutubeView;
@protocol YoutubeViewDelegate <NSObject>
- (void) onYoutubeBecomeReady:(YoutubeView *) setter;
- (void) onYoutubeDidChangeToState:(YoutubeView *) setter state:(YTPlayerState)state;
@end

@interface YoutubeView : UIViewController <YTPlayerViewDelegate> {
    YTPlayerView *youtubePlayerView;
    
    @public CGFloat paddingTop;
    @public CGFloat paddingBottom;
}

@property(nonatomic,weak) id<YoutubeViewDelegate>delegate;

// Expose Methods
- (void) playVideo;
- (void) pauseVideo;
- (void) seekToSeconds:(CGFloat)seekToSeconds;
- (void) setupVideoId:(NSString*)youtubeVideoId;
- (void) qualityVideo:(YTPlaybackQuality)quality;
- (void) fullscreenVideo:(BOOL)activateFullscreenVideo;

@end
