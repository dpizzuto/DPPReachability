//
//  AnotherViewController.m
//  DPPReachability
//
//  Created by Dario Pizzuto on 19/10/14.
//  Copyright (c) 2014 Dario Pizzuto. All rights reserved.
//

#import "AnotherViewController.h"
#import "DPPReachability.h"


@interface AnotherViewController ()

@end

@implementation AnotherViewController{

    DPPReachability *reachManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    reachManager = [DPPReachability sharedInstance];

    [reachManager setupReachableBlock:^{
        NSLog(@"Reachable BLOCKK AnotherViewController");
    } unreachableBlock:^{
        NSLog(@"Unreachable block AnotherViewController");
    }];
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

@end
