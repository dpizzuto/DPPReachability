//
//  DPPReachability.h
//  DPPReachability
//
//  Created by Dario Pizzuto on 18/10/14.
//  Copyright (c) 2014 Dario Pizzuto. All rights reserved.
//

@import Foundation;

@class Reachability;


/*!
 * Class used due to controls the state of network interfaces
 * DPPReachability checks if the internet connection is available
 *
 * Can be used with reachability Blocks
 **/
@interface DPPReachability : NSObject

typedef void (^DPPReacheableBlock)(void);
typedef void (^DPPUnreacheableBlock)(void);

/*!
 * @brief flag that indicates internet availability.
 */
@property(nonatomic,readonly) BOOL isReachable;


/*!
 * @brief Method used to retrieve singleton object
 *
 **/
+ (instancetype)sharedInstance;


/*!
 * @brief Method to setup the Reachability Manager
 *
 * @param Url Url used to check connection availability
 * @param reachOnWan Flag that indicates reachability on WAN
 *
 * @warning hould be existent Url
 *
 **/
- (void)setupReachibilityManagerUrl:(NSString*)url reachableOnWAN:(BOOL)reachOnWan;

/*!
 * @brief Setup reachable/unreachable Blocks
 *
 * @param reachBlock Block to execute when Internet available
 * @param unreachBlock Block to execute when Internet unavailable
 *
 **/
- (void)setupReachableBlock:(DPPReacheableBlock)reachBlock unreachableBlock:(DPPUnreacheableBlock)unreachBlock;

@end
