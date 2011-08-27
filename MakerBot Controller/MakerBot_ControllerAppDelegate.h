//
//  MakerBot_ControllerAppDelegate.h
//  MakerBot Controller
//
//  Created by Forest Crossman on 8/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MakerBot_ControllerViewController;

@interface MakerBot_ControllerAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MakerBot_ControllerViewController *viewController;

@end
