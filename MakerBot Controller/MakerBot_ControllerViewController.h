//
//  MakerBot_ControllerViewController.h
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
#import "RscMgr.h"

#define BUFFER_LEN 1024

@interface MakerBot_ControllerViewController : UIViewController <RscMgrDelegate> {
   
    RscMgr *rscMgr;
    UInt8 rxBuffer[BUFFER_LEN];
    UInt8 txBuffer[BUFFER_LEN];
    
    UIButton *homeButton;
    UIButton *plusXButton;
    UIButton *minusXButton;
    UIButton *plusYButton;
    UIButton *minusYButton;
    UIButton *plusZButton;
    UIButton *minusZButton;
    UILabel *debugText;
}

@property (nonatomic, retain) IBOutlet UILabel *debugText;
@property (nonatomic, retain) IBOutlet UIButton *homeButton;
@property (nonatomic, retain) IBOutlet UIButton *plusXButton;
@property (nonatomic, retain) IBOutlet UIButton *minusXButton;
@property (nonatomic, retain) IBOutlet UIButton *plusYButton;
@property (nonatomic, retain) IBOutlet UIButton *minusYButton;
@property (nonatomic, retain) IBOutlet UIButton *plusZButton;
@property (nonatomic, retain) IBOutlet UIButton *minusZButton;

- (IBAction)homePosition:(id)sender;
- (IBAction)plusXPosition:(id)sender;
- (IBAction)minusXPosition:(id)sender;
- (IBAction)plusYPosition:(id)sender;
- (IBAction)minusYPosition:(id)sender;
- (IBAction)plusZPosition:(id)sender;
- (IBAction)minusZPosition:(id)sender;

@end
