//
//  YoutubeView.h
//  Youtube
//
//  Created by Вадим Коппе on 23.09.16.
//  Copyright © 2016 Вадим Коппе. All rights reserved.
//

#import "YTPlayerView.h"

@class YoutubeView;
@protocol YoutubeViewDelegate <NSObject>
- (void) onYoutubeBecomeReady:(YoutubeView *) setter;
- (void) onYoutubeDidChangeToState:(YoutubeView *) setter state:(YTPlayerState)state;
@end

/**
 * YTPlayerView is a custom UIView that client developers will use to include YouTube
 * videos in their iOS applications. It can be instantiated programmatically, or via
 * Interface Builder. Use the methods YTPlayerView::loadWithVideoId:,
 * YTPlayerView::loadWithPlaylistId: or their variants to set the video or playlist
 * to populate the view with.
 */
@interface YoutubeView : UIView <YTPlayerViewDelegate> {
    YTPlayerView *youtubePlayerView;
    
    @public CGFloat paddingTop;
    @public CGFloat paddingBottom;
}

@property(nonatomic,weak) id<YoutubeViewDelegate>delegate;

// Expose Methods
- (void) clear;
- (void) playVideo;
- (void) pauseVideo;
- (void) seekToSeconds:(CGFloat)seekToSeconds;
- (void) setupVideoId:(NSString*)youtubeVideoId;
- (void) qualityVideo:(YTPlaybackQuality)quality;
- (void) fullscreenVideo:(BOOL)activateFullscreenVideo;
- (void) allowsPictureInPicture:(BOOL)activateFullscreenVideo;

@end
