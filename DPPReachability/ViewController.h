//
//  ViewController.h
//  DPPReachability
//
//  Created by Dario Pizzuto on 18/10/14.
//  Copyright (c) 2014 Dario Pizzuto. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DPPReachability.h"

@interface ViewController : UIViewController<DPPReachabilityProtocol>

@property(nonatomic,weak) IBOutlet UILabel *testLabel;

@end

