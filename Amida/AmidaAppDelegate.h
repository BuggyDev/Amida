//
//  AmidaAppDelegate.h
//  Amida
//
//  Created by Buggy on 11/04/28.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AmidaViewController;

@interface AmidaAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet AmidaViewController *viewController;

@end
