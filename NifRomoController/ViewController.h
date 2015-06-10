/*
 Copyright 2014 NIFTY Corporation All Rights Reserved.
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
*/

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

