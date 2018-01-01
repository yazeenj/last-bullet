/// player Movement (Using keyboard)
//get player input
scr_player_input();

//Get axis
move = (key_left + key_right);
hspd = move * spd;

if(vspd < 10) vspd += grav;

if(place_meeting(x,y+1,ob_ground))
{
    vspd = key_up * -jmp;
}

//Horizontal Collision
if (place_meeting(x+hspd,y,ob_ground))
{
while (!place_meeting(x+sign(hspd),y,ob_ground))
{
    x += sign(hspd);
}
hspd = 0;
}
x += hspd;


//Vertical Collision
if (place_meeting(x,y+vspd,ob_ground))
{
while (!place_meeting(x,y+sign(vspd),ob_ground))
{
    y += sign(vspd);
}
vspd = 0;
}
y += vspd;

//change player dir
if(move != 0) image_xscale = move;

//Animation
if(place_meeting(x,y+1,ob_ground))
{
    if(move!=0) sprite_index= sp_player_run; else sprite_index = sp_player_idle;
}
else
{
    if(vspd < 0) sprite_index = sp_player_jump; 
}

//Firing the gun
if(key_shot and !firing){
//if sprite_index == sp_player_shot then exit; // Exits the event if already punching
    firing=true;
    alarm[0]=7;   
    with instance_create(x+10,y+12,ob_bullet)
    {
        image_xscale = other.image_xscale;
        hspeed = 15*image_xscale; 
    }
}





