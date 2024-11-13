//
//  ViewController.h
//  SquashTheGame
//
//  Created by Gustavo Binder on 13/11/24.
//

#import <Cocoa/Cocoa.h>
#import <GameController/GameController.h>
#import <SnowLib/SnowDelegate.h>
#import <SnowLib/SnowFiles.hpp>

#import "Game/Game.hpp"

@interface ViewController : NSViewController
@property Game game;
@property SnowSoupDelegate* snowDelegate;
@property GCController* myController;

- (void)registerController;
- (void)connectController:(NSNotification*)notification;
- (void)disconnectController:(NSNotification*)notification;
@end

