/*
 * AppController.j
 * GrowlCappuccino-Example
 *
 * Created by You on November 1, 2010.
 * Copyright 2010, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>
@import <GrowlCappuccino/GrowlCappuccino.j>

@implementation AppController : CPObject
{
    CPView          _blueView;
    TNGrowlCenter   _blueGrowl;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView];

    var label = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];

    [label setStringValue:@"GrowlCappuccino Demonstration"];
    [label setFont:[CPFont boldSystemFontOfSize:24.0]];
    [label setFrameOrigin:CPPointMake(10, 10)];
    [label sizeToFit];
    [contentView addSubview:label];
    
    var button = [CPButton buttonWithTitle:@"Show Info"];
    [button setFrameOrigin:CPPointMake(10, 50)];
    [button setFrameSize:CPSizeMake(100, 24)];
    [button setTarget:self];
    [button setAction:@selector(showGrowl:)];
    [contentView addSubview:button];
    
    
    button = [CPButton buttonWithTitle:@"Show Warning"];
    [button setFrameOrigin:CPPointMake(10, 80)];
    [button setFrameSize:CPSizeMake(100, 24)];
    [button setTarget:self];
    [button setAction:@selector(showGrowlWarning:)];
    [contentView addSubview:button];
    
    button = [CPButton buttonWithTitle:@"Show Error"];
    [button setFrameOrigin:CPPointMake(10, 110)];
    [button setFrameSize:CPSizeMake(100, 24)];
    [button setTarget:self];
    [button setAction:@selector(showGrowlError:)];
    [contentView addSubview:button];
    
    button = [CPButton buttonWithTitle:@"Show Long"];
    [button setFrameOrigin:CPPointMake(10, 140)];
    [button setFrameSize:CPSizeMake(100, 24)];
    [button setTarget:self];
    [button setAction:@selector(showGrowlLong:)];
    [contentView addSubview:button];
    
    button = [CPButton buttonWithTitle:@"Show clikable"];
    [button setFrameOrigin:CPPointMake(10, 170)];
    [button setFrameSize:CPSizeMake(100, 24)];
    [button setTarget:self];
    [button setAction:@selector(showGrowlInteractive:)];
    [contentView addSubview:button];
    
    
    _blueView = [[CPView alloc] initWithFrame:CPRectMake(10, 230, 270, 400)];
    [_blueView setBackgroundColor:[CPColor colorWithHexString:@"C8CDDA"]];
    [contentView addSubview:_blueView];
    
    var _blueGrowl = [[TNGrowlCenter alloc] init];
    [_blueGrowl setView:_blueView];
    
    button = [CPButton buttonWithTitle:@"Show in blue"];
    [button setFrameOrigin:CPPointMake(10, 200)];
    [button setFrameSize:CPSizeMake(100, 24)];
    [button setTarget:self];
    [button setAction:@selector(showGrowlInBlueView:)];
    [contentView addSubview:button];
    
    var growl = [TNGrowlCenter defaultCenter];
	[growl setView:contentView];
	
	[theWindow orderFront:nil];
}

- (IBAction)showGrowl:(id)sender
{
    [[TNGrowlCenter defaultCenter] pushNotificationWithTitle:@"Hello" message:@"Hello World!"];
}


- (IBAction)showGrowlWarning:(id)sender
{
    [[TNGrowlCenter defaultCenter] pushNotificationWithTitle:@"Hello" message:@"Hello World!" icon:TNGrowlIconWarning];
}

- (IBAction)showGrowlError:(id)sender
{
    [[TNGrowlCenter defaultCenter] pushNotificationWithTitle:@"Hello" message:@"Hello World!" icon:TNGrowlIconError];
}

- (IBAction)showGrowlLong:(id)sender
{
    var msg = @"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. Pellentesque congue. Ut in risus";
    [[TNGrowlCenter defaultCenter] pushNotificationWithTitle:@"hello" message:msg icon:TNGrowlIconError];
}


- (IBAction)showGrowlInteractive:(id)sender
{
    
    [[TNGrowlCenter defaultCenter] pushNotificationWithTitle:@"Click Me" 
                                                     message:@"You can click on me. Fabulous isn't it?" 
                                                  customIcon:TNGrowlIconInfo
                                                      target:self
                                                      action:@selector(didGrowlClick:) 
                                            actionParameters:nil];
}


- (IBAction)didGrowlClick:(id)sender
{
    alert("hihi, it tickles!")
}


- (IBAction)showGrowlInBlueView:(id)sender
{
    [_blueGrowl pushNotificationWithTitle:@"Hello" message:@"Hello World!" icon:TNGrowlIconInfo];
}
@end
