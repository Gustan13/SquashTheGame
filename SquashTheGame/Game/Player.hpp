//
//  Player.hpp
//  SquashTheGame
//
//  Created by Gustavo Binder on 20/11/24.
//

#ifndef Player_hpp
#define Player_hpp

#include <SnowLib/Collider.hpp>
#include <SnowLib/Model.hpp>
#include <SnowLib/Cube.hpp>

class Player : public Collider {
public:
    Player(Cube* cube, MTL::Device* device);

    Model* playerModel;
    
    void Update() override;
};

#endif /* Player_hpp */
