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
#import <GameController/GameController.h>

class Game : public SnowSoup {
public:
    void onStart() override;
    void update() override;
    
    void registerJumpButton();
    void registerLeftThumbstick();
    
    GCController* myController;
    GCControllerLiveInput* input;
    
    Model* player;
    Model* enemyModel;
    Model* copyTest;
    
    int timer = 100;
    bool playing = false;
};

#endif /* Game_hpp */
