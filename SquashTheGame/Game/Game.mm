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
    
    cube = new Cube(device);
    cube->buildBuffers();
    
    p = new Player(cube, device);
    p->position = vector3(0.f, 0.f, -5.f);
    addNode(p);
}

void Game::update() {
    switch (state) {
        case TITLE:
            titleScreen();
            break;
        case GAME:
            gameScreen();
            break;
    }
}

void Game::registerJumpButton() {
    GCControllerButtonInput* buttonA = myController.extendedGamepad.buttonA;
    
    [buttonA setPressedChangedHandler:^(GCControllerButtonInput* a, float value, bool pressed){
        if (pressed) {
            switch (state) {
                case TITLE:
                    state = GAME;
                    break;
                case GAME:
                    NSLog(@"Jump!");
                    break;
            }
        }
    }];
}

void Game::titleScreen() {
    scoreUI.hidden = YES;
    startUI.hidden = NO;
    titleUI.hidden = NO;
}

void Game::gameScreen() {
    GCControllerDirectionPad* stick = myController.extendedGamepad.leftThumbstick;
    
    player->position.x -= stick.xAxis.value;
    player->position.z += stick.yAxis.value;
    
    copyTest->rotation.y += 1.f;
    p->rotation.y += 1.f;
    timer -= 1;
    if (timer <= 0) {
        timer = 100;
//        addNode(new Model(*copyTest));
//        NSLog(@"Enemy spawned");
        if (enemyModel != nullptr) {
            enemyModel->destroy = true;
            enemyModel = nullptr;
        }
    }
}

