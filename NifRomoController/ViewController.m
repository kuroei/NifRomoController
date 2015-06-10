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

#import "ViewController.h"
#import <AppRTC/RTCEAGLVideoView.h>
#import <AppRTC/ARDAppClient.h>
#import "Command.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // RTCEAGLVideoViewDelegate provides notifications on video frame dimensions
    [self.remoteView setDelegate:self];
    [self.localView setDelegate:self];
    
    // create the MQTT client with an unique identifier
    NSString *clientID = [UIDevice currentDevice].identifierForVendor.UUIDString;
    self.client = [[MQTTClient alloc] initWithClientId:clientID];
    
    // add the username and password
    self.client.password = self.pwd;
    self.client.username = self.username;
    self.client.port = (unsigned short) self.port.integerValue;
    
    // connect the MQTT client
    if ([self.clintid length] == 0){
        self.clintid = @"";
    }
    
    self.pubTopicMove = [NSString stringWithFormat:@"%@/%@", self.clintid, kTopic];
    self.pubTopicPic = [NSString stringWithFormat:@"%@/%@", self.clintid, kTopicPic];
    [self.client connectToHost:self.host completionHandler:^(MQTTConnectionReturnCode code) {
        if (code ==  ConnectionAccepted) {
            // The client is connected when this completion handler is called
            [self.client subscribe:@"temp" withCompletionHandler:^(NSArray *grantedQos) {
                // The client is effectively subscribed to the topic when this completion handler is called
            }];
        }
    }];
    
    self.status = isStop;
    
    // init UI
    [self initUI];
}

- (void)initUI
{
    // forward btn
    UIButton *fbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    fbtn.frame = CGRectMake(80, 350, 30, 30);
    UIImage *oimage = [UIImage imageNamed:@"arrowo.png"];
    UIImage *resizeo = [oimage resizableImageWithCapInsets:UIEdgeInsetsMake(50, 50, 50, 50)];
    [fbtn setBackgroundImage:resizeo forState:UIControlStateNormal];
    [fbtn addTarget:self action:@selector(startForward:) forControlEvents:UIControlEventTouchDown];
    [fbtn addTarget:self action:@selector(stopForward:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    [self.view addSubview:fbtn];
    
    // back btn
    UIButton *bbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    bbtn.frame = CGRectMake(80, 450, 30, 30);
    UIImage *uimage = [UIImage imageNamed:@"arrowu.png"];
    UIImage *resizeu = [uimage resizableImageWithCapInsets:UIEdgeInsetsMake(50, 50, 50, 50)];
    [bbtn setBackgroundImage:resizeu forState:UIControlStateNormal];
    [bbtn addTarget:self action:@selector(startBack:) forControlEvents:UIControlEventTouchDown];
    [bbtn addTarget:self action:@selector(stopBack:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    [self.view addSubview:bbtn];
    
    
    // rightbtn
    UIButton *rbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rbtn.frame = CGRectMake(125, 400, 30, 30);
    UIImage *rimage = [UIImage imageNamed:@"arrowr.png"];
    UIImage *resizer = [rimage resizableImageWithCapInsets:UIEdgeInsetsMake(50, 50, 50, 50)];
    [rbtn setBackgroundImage:resizer forState:UIControlStateNormal];
    [rbtn addTarget:self action:@selector(startRight:) forControlEvents:UIControlEventTouchDown];
    [rbtn addTarget:self action:@selector(stopRight:)
   forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    [self.view addSubview:rbtn];
    
    // leftbtn
    UIButton *lbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    lbtn.frame = CGRectMake(30, 400, 30, 30);
    UIImage *limage = [UIImage imageNamed:@"arrowl.png"];
    UIImage *resizel = [limage resizableImageWithCapInsets:UIEdgeInsetsMake(50, 50, 50, 50)];
    [lbtn setBackgroundImage:resizel forState:UIControlStateNormal];
    [lbtn addTarget:self action:@selector(startLeft:) forControlEvents:UIControlEventTouchDown];
    [lbtn addTarget:self action:@selector(stopLeft:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    [self.view addSubview:lbtn];
    
    
    // upbtn
    UIButton *ubtn = [UIButton buttonWithType:UIButtonTypeCustom];
    ubtn.frame = CGRectMake(230, 350, 30, 30);
    UIImage *oimage2 = [UIImage imageNamed:@"arrowo.png"];
    UIImage *resizeo2 = [oimage2 resizableImageWithCapInsets:UIEdgeInsetsMake(50, 50, 50, 50)];
    [ubtn setBackgroundImage:resizeo2 forState:UIControlStateNormal];
    [ubtn addTarget:self action:@selector(startup:) forControlEvents:UIControlEventTouchDown];
    [ubtn addTarget:self action:@selector(stopup:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    [self.view addSubview:ubtn];
    
    
    // downbtn
    UIButton *dbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    dbtn.frame = CGRectMake(230, 450, 30, 30);
    UIImage *uimage2 = [UIImage imageNamed:@"arrowu.png"];
    UIImage *resizeu2 = [uimage2 resizableImageWithCapInsets:UIEdgeInsetsMake(50, 50, 50, 50)];
    [dbtn setBackgroundImage:resizeu2 forState:UIControlStateNormal];
    [dbtn addTarget:self action:@selector(startdown:)
   forControlEvents:UIControlEventTouchDown];
    [dbtn addTarget:self action:@selector(stopdown:)
   forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    [self.view addSubview:dbtn];
    
    // picbtn
    UIButton *picbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    picbtn.frame = CGRectMake(100, 500, 120, 40);
    [picbtn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    UIImage *cimage = [UIImage imageNamed:@"camera_btn.png"];
    UIImage *resizec = [cimage resizableImageWithCapInsets:UIEdgeInsetsMake(143, 453, 143, 453)];
    [picbtn setImage:resizec forState:UIControlStateNormal];
    
    // only send 1 to pubTopicPic
    [picbtn addTarget:self action:@selector(picdown:)
     forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:picbtn];
    
    [self.view addSubview:self.returnBtn];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // it will connect the webrtc server, by kuroei
    [self disconnect];
    self.rtcclient = [[ARDAppClient alloc] initWithDelegate:self];
    [self.rtcclient setServerHostUrl:@"https://apprtc.appspot.com"];
    [self.rtcclient connectToRoomWithId:[NSString stringWithFormat:@"6666%@", self.clintid] options:nil];
}

#pragma mark - Clear Connection

- (void)applicationWillResignActive:(UIApplication*)application {
    // close connection clearly
    [self disconnect];
}

- (void)viewWillDisappear:(BOOL)animated {
    //back button 
    [super viewWillDisappear:animated];
    [self disconnect];
    [self.client disconnectWithCompletionHandler:^(NSUInteger code) {
        // The client is disconnected when this completion handler is called
        NSLog(@"MQTT is disconnected");
    }];
}

- (void)dealloc
{
    [self.client disconnectWithCompletionHandler:^(NSUInteger code) {
        // The client is disconnected when this completion handler is called
        NSLog(@"MQTT is disconnected");
    }];
    [self disconnect];
}

#pragma mark - btnAction

-(void)sendStatus {
    NSString * pubMsg = [NSString stringWithFormat:@"%d",self.status];
    [self.client publishString:pubMsg
                       toTopic: self.pubTopicMove
                       withQos:ExactlyOnce
                        retain:NO
             completionHandler:nil];
    // NSLog(@"msg->%@",pubMsg);
}

-(void)startForward:(id)sender {
    self.status |= isForward;
    [self sendStatus];
}

-(void)stopForward:(id)sender {
    self.status &=  noForward;
    [self sendStatus];
}

-(void)startBack:(id)sender {
    self.status |= isBack;
    [self sendStatus];
}

-(void)stopBack:(id)sender {
    self.status &= noBack;
    [self sendStatus];
}

-(void)startRight:(id)sender {
    self.status |= isRight;
    [self sendStatus];
}

-(void)stopRight:(id)sender {
    self.status &= noRight;
    [self sendStatus];
}

-(void)startLeft:(id)sender {
    self.status |= isLeft;
    [self sendStatus];
}

-(void)stopLeft:(id)sender {
    self.status &= noLeft;
    [self sendStatus];
}

-(void)startup:(id)sender {
    self.status |= isUp;
    [self sendStatus];
}

-(void)stopup:(id)sender {
    self.status &= noUp;
    [self sendStatus];
}

-(void)startdown:(id)sender {
    self.status |= isDown;
    [self sendStatus];
}

-(void)stopdown:(id)sender {
    self.status &= noDown;
    [self sendStatus];
}

-(void)picdown:(id)sender {
    [self.client publishString:@"1"
                       toTopic: self.pubTopicPic
                       withQos:ExactlyOnce
                        retain:NO
             completionHandler:nil];
}


#pragma mark - webrtc

- (void)appClient:(ARDAppClient *)client didChangeState:(ARDAppClientState)state {
    switch (state) {
        case kARDAppClientStateConnected:
            NSLog(@"Client connected.");
            break;
        case kARDAppClientStateConnecting:
            NSLog(@"Client connecting.");
            break;
        case kARDAppClientStateDisconnected:
            NSLog(@"Client disconnected.");
            [self remoteDisconnected];
            break;
    }
}

//webRTC disconnect
- (void)disconnect {
    if (self.rtcclient) {
        if (self.localVideoTrack) [self.localVideoTrack removeRenderer:self.localView];
        if (self.remoteVideoTrack) [self.remoteVideoTrack removeRenderer:self.remoteView];
        self.localVideoTrack = nil;
        [self.localView renderFrame:nil];
        self.remoteVideoTrack = nil;
        [self.remoteView renderFrame:nil];
        [self.rtcclient disconnect];
    }
    
    
}

- (void)remoteDisconnected {
    if (self.remoteVideoTrack) [self.remoteVideoTrack removeRenderer:self.remoteView];
    self.remoteVideoTrack = nil;
    [self.remoteView renderFrame:nil];
    //[self videoView:self.localView didChangeVideoSize:self.localVideoSize];
}

- (void)appClient:(ARDAppClient *)client didReceiveLocalVideoTrack:(RTCVideoTrack *)localVideoTrack {
    //self.localVideoTrack = localVideoTrack;
    //[self.localVideoTrack addRenderer:self.localView];
}

- (void)appClient:(ARDAppClient *)client didReceiveRemoteVideoTrack:(RTCVideoTrack *)remoteVideoTrack {
    self.remoteVideoTrack = remoteVideoTrack;
    [self.remoteVideoTrack addRenderer:self.remoteView];
}

- (void)appClient:(ARDAppClient *)client didError:(NSError *)error {
    /* Handle the error */
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil
                                                        message:[NSString stringWithFormat:@"%@", error]
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
    [self disconnect];
}

- (void)videoView:(RTCEAGLVideoView *)videoView didChangeVideoSize:(CGSize)size {
    /* resize self.localView or self.remoteView based on the size returned */
}

@end
