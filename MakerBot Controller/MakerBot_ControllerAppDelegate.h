//
//  MakerBot_ControllerAppDelegate.h
//  MakerBot Controller
//
//  Created by Forest Crossman on 8/27/11.
//  Copyright 2011 Forest Crossman. All rights reserved.
//
//  This file is part of MakerBot Controller.
//
//  MakerBot Controller is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  MakerBot Controller is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with MakerBot Controller.  If not, see <http://www.gnu.org/licenses/>.
//

#import <UIKit/UIKit.h>

@class MakerBot_ControllerViewController;

@interface MakerBot_ControllerAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MakerBot_ControllerViewController *viewController;

@end
