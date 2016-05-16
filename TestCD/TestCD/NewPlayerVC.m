//
//  NewPlayerVC.m
//  TestCD
//
//  Created by young on 16/5/16.
//  Copyright © 2016年 Young. All rights reserved.
//

#import "NewPlayerVC.h"
#import "GCSVideoView.h"
#import "YuHeader.h"

@interface NewPlayerVC ()<GCSVideoViewDelegate>
@property (nonatomic, strong) GCSVideoView *videoView;

@end

@implementation NewPlayerVC{

    BOOL *_isPlaying;
}


- (void)viewDidLoad{
    
    self.videoView = [[GCSVideoView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.videoView.enableCardboardButton = YES;
    [self.videoView loadFromUrl:[NSURL URLWithString:@"http://125.39.35.137/mp4files/301700000831C244/d8d913s460fub.cloudfront.net/krpanocloud/video/airpano/video-1920x960a.mp4"]];
    [self.videoView setDelegate:self];
    [self.view addSubview:self.videoView];
    _isPlaying = NO;

}

#pragma mark - VideoViewDeleagte
- (void)videoView:(GCSVideoView*)videoView didUpdatePosition:(NSTimeInterval)position
{
    NSLog(@"progress = %f",position/videoView.duration);
    if (position == videoView.duration) {
         NSLog(@"play end");
    }
}

#pragma mark - GCSWidgetViewDelegate
- (void)widgetViewDidTap:(GCSWidgetView *)widgetView
{
    NSLog(@"idTap");
    
    if (!_isPlaying) {
        [self.videoView resume];
        _isPlaying = YES;
    }else{
        [self.videoView pause];
        _isPlaying = NO;
    }
}

- (void)widgetView:(GCSWidgetView *)widgetView
didChangeDisplayMode:(GCSWidgetDisplayMode)displayMode
{
   NSLog(@"ChangeDisplayMode: %ld",(long)displayMode);
}

- (void)widgetView:(GCSWidgetView *)widgetView didLoadContent:(id)content
{
    NSLog(@"buffer OK");
    NSLog(@"didLoadContent: %@",(NSString *)content);
}

- (void)widgetView:(GCSWidgetView *)widgetView
didFailToLoadContent:(id)content
  withErrorMessage:(NSString *)errorMessage
{
    NSLog(@"errorMessage: %@",errorMessage);
}


@end
