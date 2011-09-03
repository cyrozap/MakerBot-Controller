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
    /*
    const char zero[] = "\xd5\x0d\x82\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x63"; // Set position to 0,0,0. This is a hack to get the movment to work (because it only allows absolute movements).
    NSData *zeroData = [[NSData alloc] initWithBytes: &zero length: sizeof(zero)-1];
    [rscMgr write:[zeroData zero] Length:[zeroData length]];
    */
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
        // debugText.text=@"Moving Axes to Home Position";
        debugText.text=@"Setting Position to 0,0,0.";
        const char bytes[] = "\xd5\x0d\x82\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x63";
        NSData *homeData = [[NSData alloc] initWithBytes:bytes length:sizeof(bytes)-1];
        [rscMgr write:[homeData bytes] Length:[homeData length]];
    }
}

- (IBAction)plusXPosition:(id)sender {
    if (plusXButton.touchInside) {
        debugText.text=@"Moving 5mm Right";
        const char bytes[] = "\xd5\x11\x81\x3b\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x61\x29\x00\x00\xfd";
        NSData *plusXData = [[NSData alloc] initWithBytes:bytes length:sizeof(bytes)-1];
        [rscMgr write:[plusXData bytes] Length:[plusXData length]];
        /*
        const char zeroXPlus[] = "\xd5\x0d\x82\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x63"; // Set position to 0,0,0. This is a hack to get the movment to work (because it only allows absolute movements).
        NSData *zeroXPlusData = [[NSData alloc] initWithBytes: &zeroXPlus length: sizeof(zeroXPlus)-1];
        [rscMgr write:[zeroXPlusData zeroXPlus] Length:[zeroXPlusData length]];
        */
    }
}

- (IBAction)minusXPosition:(id)sender {
    if (minusXButton.touchInside) {
        debugText.text=@"Moving 5mm Left";
        const char bytes[] = "\xd5\x11\x81\xc5\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x61\x29\x00\x00\x2d";
        NSData *minusXData = [[NSData alloc] initWithBytes:bytes length:sizeof(bytes)-1];
        [rscMgr write:[minusXData bytes] Length:[minusXData length]];
        /*
        const char zeroXMinus[] = "\xd5\x0d\x82\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x63"; // Set position to 0,0,0. This is a hack to get the movment to work (because it only allows absolute movements).
        NSData *zeroMinusXData = [[NSData alloc] initWithBytes: &zeroXMinus length: sizeof(zeroXMinus)-1];
        [rscMgr write:[zeroMinusXData zeroXMinus] Length:[zeroMinusXData length]];
        */
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
