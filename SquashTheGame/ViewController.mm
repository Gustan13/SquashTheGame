//
//  ViewController.m
//  SquashTheGame
//
//  Created by Gustavo Binder on 13/11/24.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _game.init((MTKView*)self.view);
    _snowDelegate = [SnowSoupDelegate alloc];
    [_snowDelegate setEngine:&_game];
    [_snowDelegate setView:self.view];
    SnowFiles::getPath(@"monster", @".fbx");
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
