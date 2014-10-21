//
//  ViewController.m
//  DPPReachability
//
//  Created by Dario Pizzuto on 18/10/14.
//  Copyright (c) 2014 Dario Pizzuto. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController{

    DPPReachability *reachManager;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    reachManager = [DPPReachability sharedInstance];
    [reachManager setupReachibilityManagerUrl:@"www.google.it" reachableOnWAN:YES];
    
    NSLog(@"IS Reach: %i",[reachManager isReachable]);
    
}

- (IBAction)updateLabel:(id)sender{

    [self.testLabel setText:[NSString stringWithFormat:@"%i",[reachManager isReachable]]];
}

- (void)reachableNetwork{
    NSLog(@"reachable  ViewController");

}

- (void)unreachableNetwork{
    NSLog(@"Unreachable  ViewController");

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
