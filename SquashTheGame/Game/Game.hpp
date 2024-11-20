//
//  Game.hpp
//  SquashTheGame
//
//  Created by Gustavo Binder on 13/11/24.
//

#ifndef Game_hpp
#define Game_hpp

#import <SnowLib/SnowSoup.hpp>
#import <SnowLib/Model.hpp>
#import <SnowLib/SnowFiles.hpp>
#import <SnowLib/Cube.hpp>
#import <GameController/GameController.h>

#import "Player.hpp"

typedef enum {
   TITLE, GAME
} GameState;

class Game : public SnowSoup {
public:
    void onStart() override;
    void update() override;
    
    void titleScreen();
    void gameScreen();
    
    void registerJumpButton();
    
    GCController* myController;
    GCControllerLiveInput* input;
    
    Model* player;
    Model* enemyModel;
    Model* copyTest;
    Cube* cube;
    Player* p;
    
    NSTextField* titleUI;
    NSTextField* startUI;
    NSTextField* scoreUI;
    
    int timer = 100;
    GameState state = GAME;
};

#endif /* Game_hpp */
