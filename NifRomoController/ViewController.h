//
//  ViewController.h
//  NifRomoController
//
//  Created by sci01507 on 15-6-8.
//  Copyright (c) 2015年 iot.team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AppRTC/RTCEAGLVideoView.h>
#import <AppRTC/ARDAppClient.h>
#import <MQTTKit.h>

@interface ViewController : UIViewController <UINavigationControllerDelegate,ARDAppClientDelegate, RTCEAGLVideoViewDelegate>


// for the property from  firstview
@property (nonatomic,retain) NSString * host;
@property (nonatomic,retain)  NSString * port;
@property (nonatomic,retain)  NSString * username;
@property (nonatomic,retain)  NSString * pwd;
@property (nonatomic,retain)  NSString * clintid;
@property (nonatomic,retain)  NSString * pubTopicMove;
@property (nonatomic,retain)  NSString * pubTopicPic;

@property (nonatomic)  unsigned int status;

// for webrtc. by kuroei
@property (strong, nonatomic) ARDAppClient *rtcclient;
@property (strong, nonatomic) IBOutlet RTCEAGLVideoView *remoteView;
@property (strong, nonatomic) IBOutlet RTCEAGLVideoView *localView;
@property (strong, nonatomic) RTCVideoTrack *localVideoTrack;
@property (strong, nonatomic) RTCVideoTrack *remoteVideoTrack;

// mqtt client
@property (nonatomic, strong) MQTTClient *client;

// UI
@property (strong, nonatomic) IBOutlet UIButton *returnBtn;

@end

