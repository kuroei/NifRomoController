//
//  LoginViewController.m
//  NifRomoController
//
//  Created by sci01507 on 15-6-8.
//  Copyright (c) 2015年 iot.team. All rights reserved.
//

#import "LoginViewController.h"
#import "ViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.background = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.background.image = [UIImage imageNamed:@"01.png"];
    [self.view addSubview:self.background];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - IBAction

- (IBAction)ConnectBtnAcation:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *mqttviewController = [storyboard instantiateViewControllerWithIdentifier:@"mainview"];
    
    mqttviewController.host = self.host.text;
    mqttviewController.port = self.port.text;
    mqttviewController.username = self.username.text;
    mqttviewController.pwd = self.pwd.text;
    mqttviewController.clintid = self.romoid.text;
    
    [self presentViewController:mqttviewController animated:YES completion:nil];
}

@end
