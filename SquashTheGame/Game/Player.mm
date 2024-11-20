//
//  Player.mm
//  SquashTheGame
//
//  Created by Gustavo Binder on 20/11/24.
//

#include "Player.hpp"

Player::Player(Cube* cube, MTL::Device* device) : Collider(cube) {
    playerModel = new Model(device);
    playerModel->importModel(SnowFiles::getPath(@"hero", @".fbx"));
    AddChild(playerModel);
    memcpy(name, "Player", sizeof(char) * 6);
}

void Player::Update() {
    
}
