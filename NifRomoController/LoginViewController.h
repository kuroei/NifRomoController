//
//  LoginViewController.h
//  NifRomoController
//
//  Created by sci01507 on 15-6-8.
//  Copyright (c) 2015年 iot.team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

// ui
@property (nonatomic, strong) UIImageView *background;


@property (weak, nonatomic) IBOutlet UIButton *ConnectBtn;

@property (strong, nonatomic) IBOutlet UITextField *host;
@property (strong, nonatomic) IBOutlet UITextField *port;
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *pwd;
@property (strong, nonatomic) IBOutlet UITextField *romoid;

- (IBAction)ConnectBtnAcation:(id)sender;

@end
