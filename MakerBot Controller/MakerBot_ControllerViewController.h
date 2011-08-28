//
//  MakerBot_ControllerViewController.h
//  MakerBot Controller
//
//  Created by Forest Crossman on 8/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
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
