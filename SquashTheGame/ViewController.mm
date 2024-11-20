//
//  ViewController.m
//  SquashTheGame
//
//  Created by Gustavo Binder on 13/11/24.
//

#import "ViewController.h"

@implementation ViewController

- (IBAction)HideButton:(NSButton *)sender {
    _game.p->isVisible = !_game.p->isVisible;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _game.init((MTKView*)self.view);
    _snowDelegate = [SnowSoupDelegate alloc];
    [_snowDelegate setEngine:&_game];
    [_snowDelegate setView:self.view];
    
    [self registerController];
    
    _game.titleUI = self.view.subviews[0];
    _game.startUI = self.view.subviews[1];
    _game.scoreUI = self.view.subviews[2];

    NSArray<GCController*>* controllers = [GCController controllers];
    
    if (controllers == NULL)
        return;
    
    _myController = controllers.firstObject;
    _game.myController = controllers.firstObject;
    _game.registerJumpButton();
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void)registerController {
    NSNotificationCenter* nCenter = [NSNotificationCenter defaultCenter];
    
    SEL c = @selector(connectController:);
    SEL d = @selector(disconnectController:);
    
    [nCenter addObserver:self selector:c name:GCControllerDidConnectNotification object:NULL];
    [nCenter addObserver:self selector:d name:GCControllerDidDisconnectNotification object:NULL];
}

- (void)connectController:(NSNotification*)notification {
    NSArray<GCController*>* controllers = [GCController controllers];
    _myController = controllers.firstObject;
    _game.myController = _myController;
    _game.registerJumpButton();
    NSLog(@"Controller Connected");
    
}

- (void)disconnectController:(NSNotification*)notification {
    _myController = NULL;
    _game.myController = NULL;
    NSLog(@"Controller Disconnected");
}

@end
