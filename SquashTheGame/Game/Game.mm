//
//  Game.mm
//  SquashTheGame
//
//  Created by Gustavo Binder on 13/11/24.
//

#include "Game.hpp"

void Game::onStart() {
    NSLog(@"Starting game");
    
    player = new Model(device);
    player->importModel(SnowFiles::getPath(@"hero", @".fbx"));
    player->position = vector3(0.f, 0.f, -5.f);
    addNode(player);
}

void Game::update() {
    GCControllerDirectionPad* stick = myController.extendedGamepad.leftThumbstick;
    
//    if (stick.xAxis.value != 0)
//        NSLog(@"%f", stick.xAxis.value);
    player->position.x -= stick.xAxis.value;
    player->position.y += stick.yAxis.value;
}

void Game::registerJumpButton() {
    GCControllerButtonInput* buttonA = myController.extendedGamepad.buttonA;
    
    [buttonA setPressedChangedHandler:^(GCControllerButtonInput* a, float value, bool pressed){
        if (pressed)
            NSLog(@"A button pressed");
    }];
}

void Game::registerLeftThumbstick() {
//    GCControllerDirectionPad* stick = myController.extendedGamepad.leftThumbstick;
    
//    stick.xAxis.value;
}
