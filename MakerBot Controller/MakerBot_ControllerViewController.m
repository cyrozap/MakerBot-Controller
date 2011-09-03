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
        debugText.text=@"Moving Axes to Home Position";
        txBuffer[0] = (int) '1';
        [rscMgr write:txBuffer Length:1];
    }
}

- (IBAction)plusXPosition:(id)sender {
    if (plusXButton.touchInside) {
        debugText.text=@"Moving 5mm Right";
        UInt64 s = 0xaf000104008805d5;
        NSData *plusXData0 = [[NSData alloc] initWithBytes: &s length: sizeof(s)];
        [rscMgr write:[plusXData0 bytes] Length:[plusXData0 length]];
        UInt64 a = 0x00000000008111d5;
        NSData *plusXData = [[NSData alloc] initWithBytes: &a length: sizeof(a)];
        [rscMgr write:[plusXData bytes] Length:[plusXData length]];
        UInt64 b = 0x6100000000000000;
        NSData *plusXData2 = [[NSData alloc] initWithBytes: &b length: sizeof(b)];
        [rscMgr write:[plusXData2 bytes] Length:[plusXData2 length]];
        UInt32 c = 0x6c000029;
        NSData *plusXData3 = [[NSData alloc] initWithBytes: &c length: sizeof(c)];
        [rscMgr write:[plusXData3 bytes] Length:[plusXData3 length]];
    }
}

- (IBAction)minusXPosition:(id)sender {
    if (minusXButton.touchInside) {
        debugText.text=@"Moving 5mm Left";
        txBuffer[0] = (int) '1';
        [rscMgr write:txBuffer Length:1];
    }
}

- (IBAction)plusYPosition:(id)sender {
    if (plusYButton.touchInside) {
        debugText.text=@"Moving 5mm Away";
        txBuffer[0] = (int) '1';
        [rscMgr write:txBuffer Length:1];
    }
}

- (IBAction)minusYPosition:(id)sender {
    if (minusYButton.touchInside) {
        debugText.text=@"Moving 5mm Toward";
        txBuffer[0] = (int) '1';
        [rscMgr write:txBuffer Length:1];
    }
}

- (IBAction)plusZPosition:(id)sender {
    if (plusZButton.touchInside) {
        debugText.text=@"Moving 5mm Up";
        txBuffer[0] = (int) '1';
        [rscMgr write:txBuffer Length:1];
    }
}

- (IBAction)minusZPosition:(id)sender {
    if (minusZButton.touchInside) {
        debugText.text=@"Moving 5mm Down";
        txBuffer[0] = (int) '1';
        [rscMgr write:txBuffer Length:1];
    }
}

#pragma mark - RscMgrDelegate methods

- (void) cableConnected:(NSString *)protocol {
    debugText.text=@"Cable Connected";
    [rscMgr setBaud:38400];
	[rscMgr open];
}

- (void) cableDisconnected {
    debugText.text=@"Cable Disconnected";
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
