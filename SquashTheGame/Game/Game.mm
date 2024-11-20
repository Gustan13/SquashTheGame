//
//  Game.mm
//  SquashTheGame
//
//  Created by Gustavo Binder on 13/11/24.
//

#include "Game.hpp"

void Game::onStart() {
    NSLog(@"Starting game");
    
    enemyModel = new Model(device);
    enemyModel->importModel(SnowFiles::getPath(@"monster", @".fbx"));
    enemyModel->position = vector3(-4.f, 0.f, -5.f);
    
    copyTest = new Model(*enemyModel);
    copyTest->position = vector3(4.f, 0.f, -5.f);
    
    player = new Model(device);
    player->importModel(SnowFiles::getPath(@"hero", @".fbx"));
    player->position = vector3(0.f, 0.f, -5.f);
    addNode(enemyModel);
    addNode(copyTest);
}

void Game::update() {
    GCControllerDirectionPad* stick = myController.extendedGamepad.leftThumbstick;
    
    if (!playing)
        return;
    
    player->position.x -= stick.xAxis.value;
    player->position.y += stick.yAxis.value;
    
    copyTest->rotation.y += 1.f;
    timer -= 1;
    if (timer <= 0) {
        timer = 100;
        addNode(new Model(*copyTest));
        NSLog(@"Enemy spawned");
    }
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

