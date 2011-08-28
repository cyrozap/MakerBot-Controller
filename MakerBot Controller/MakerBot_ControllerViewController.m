//
//  MakerBot_ControllerViewController.m
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

#import "MakerBot_ControllerViewController.h"

@implementation MakerBot_ControllerViewController
@synthesize debugText;
@synthesize homeButton;
@synthesize plusXButton;
@synthesize minusXButton;
@synthesize plusYButton;
@synthesize minusYButton;
@synthesize plusZButton;
@synthesize minusZButton;

- (void)dealloc
{
    [homeButton release];
    [plusYButton release];
    [minusYButton release];
    [plusXButton release];
    [minusXButton release];
    [plusZButton release];
    [minusZButton release];
    [debugText release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    rscMgr = [[RscMgr alloc] init]; 
    [rscMgr setDelegate:self];
    
}


- (void)viewDidUnload
{
    [self setHomeButton:nil];
    [self setPlusYButton:nil];
    [self setMinusYButton:nil];
    [self setPlusXButton:nil];
    [self setMinusXButton:nil];
    [self setPlusZButton:nil];
    [self setMinusZButton:nil];
    [self setDebugText:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)homePosition:(id)sender {
    if (homeButton.touchInside) {
        NSLog(@"Moving Axes to Home Position");
    }
}

- (IBAction)plusXPosition:(id)sender {
    if (plusXButton.touchInside) {
        NSLog(@"Moving 5mm Right");
    }
}

- (IBAction)minusXPosition:(id)sender {
    if (minusXButton.touchInside) {
        NSLog(@"Moving 5mm Left");
    }
}

- (IBAction)plusYPosition:(id)sender {
    if (plusYButton.touchInside) {
        NSLog(@"Moving 5mm Away");
    }
}

- (IBAction)minusYPosition:(id)sender {
    if (minusYButton.touchInside) {
        NSLog(@"Moving 5mm Toward");
    }
}

- (IBAction)plusZPosition:(id)sender {
    if (plusZButton.touchInside) {
        NSLog(@"Moving 5mm Up");
    }
}

- (IBAction)minusZPosition:(id)sender {
    if (minusZButton.touchInside) {
        NSLog(@"Moving 5mm Down");
    }
}

#pragma mark - RscMgrDelegate methods

- (void) cableConnected:(NSString *)protocol {
    [rscMgr setBaud:38400];
	[rscMgr open]; 
}

- (void) cableDisconnected {
    
}

- (void) portStatusChanged {
    
}

- (void) readBytesAvailable:(UInt32)numBytes {
}

- (BOOL) rscMessageReceived:(UInt8 *)msg TotalLength:(int)len {
    return FALSE;    
}

- (void) didReceivePortConfig {
}

@end
