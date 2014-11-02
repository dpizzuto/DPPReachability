//
//  DPPReachability.m
//  DPPReachability
//
//  Created by Dario Pizzuto on 18/10/14.
//  Copyright (c) 2014 Dario Pizzuto. All rights reserved.
//

#import "DPPReachability.h"
#import "Reachability.h"

@interface DPPReachability (private)

@property(readwrite, nonatomic, assign) BOOL isReachable;

@end

@implementation DPPReachability{
    
    Reachability *reachManager;
    
}


- (void)setIsReachable:(BOOL)flag{
    
    _isReachable = flag;
    
}

+ (instancetype)sharedInstance {
    
    static id instance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}


- (void)dealloc{
        
    [reachManager stopNotifier];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:kReachabilityChangedNotification
                                                  object:nil];
    
}

- (void)setupReachibilityManagerUrl:(NSString*)url reachableOnWAN:(BOOL)reachOnWan{
    
    if(![self isValidUrl:url]){
        @throw [NSException exceptionWithName:@"Invalid Url" reason:@"Invalid Url" userInfo:nil];
    }
    else{
        
        static dispatch_once_t onceToken;
        
        dispatch_once(&onceToken, ^{
            
            reachManager = [Reachability reachabilityWithHostname:url];
            
            reachManager.reachableOnWWAN = reachOnWan;
            
            [[NSNotificationCenter defaultCenter] addObserver:self
                                                     selector:@selector(reachabilityChanged:)
                                                         name:kReachabilityChangedNotification
                                                       object:nil];
            
            
            [reachManager startNotifier];
            
        });
    }
}



- (void)setupReachableBlock:(DPPReacheableBlock)reachBlock unreachableBlock:(DPPUnreacheableBlock)unreachBlock{
    
    reachManager.reachableBlock =^(Reachability *reach){
        reachBlock();
    };
    
    reachManager.unreachableBlock =^(Reachability *reach){
        unreachBlock();
    };
    
}

- (void)reachabilityChanged:(NSNotification*)notification{
    
    Reachability * reach = [notification object];
    
    if([reach isReachable]){
        
        [self setIsReachable:YES];
    }
    else{
        [self setIsReachable:NO];
    }
    
}


#pragma mark - URL

- (BOOL)isValidUrl:(NSString*)url{
    NSString *urlRegEx =
    @"((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    return [urlTest evaluateWithObject:url];
}

@end
