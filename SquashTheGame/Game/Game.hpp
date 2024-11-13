//
//  Game.hpp
//  SquashTheGame
//
//  Created by Gustavo Binder on 13/11/24.
//

#ifndef Game_hpp
#define Game_hpp

#import <SnowLib/SnowSoup.hpp>

class Game : public SnowSoup {
public:
    void onStart() override;
    void update() override;
};

#endif /* Game_hpp */
