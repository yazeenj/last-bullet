/// player Movement (Using keyboard)
//get player input
scr_player_input();

///Move left
if(key_left)
{
    phy_position_x -=spd;
    sprite_index= sp_player_moveleft;
    image_speed=0.3;
}

///Move right
if(key_right)
{
    phy_position_x +=spd;
    sprite_index= sp_player_moveright;
    image_speed=0.3;
}

///Move left
if(key_up)
{
    phy_position_y -=jmp;
    image_speed=0.3;
}

if(!key_left and !key_right and !key_up){
    sprite_index= sp_player_idle;
    image_speed=0.1;
}
