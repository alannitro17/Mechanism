
xtarget = follow.x - x;

ytarget = follow.y - y;


vsp = vsp + grv;

//Horizontal Collision
//always check primary wall boundries, but enemy wall boundaries are only checked in patrol mode
if(place_meeting(x + hsp, y, obj_block))
{
	while(!place_meeting(x+sign(hsp),y,obj_block))
	{
			x = x + sign(hsp);
	}
	
	walking_direction = -walking_direction;
}

x = x + hsp*walking_direction;

//Vertical Collision

if(place_meeting(x, y + vsp, obj_block))
{
	while(!place_meeting(x,y + sign(vsp),obj_block))
	{
			y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;




//if(abs(xtarget) < 800)
//{
//	hsp = walkspd/2 * (-1* sign(xtarget));	
//}

if(hp <=0)
{
	death_splash = instance_create_depth(x, y,-2000 ,obj_death_splash);
	death_splash.xcale = 1.3;
	death_splash.ycale = 1.3;
	audio_play_sound(snd_enemy_death, 80, false);
	instance_destroy();
}


switch(state)
{
	case HAND_STATE.PATROL:
		HandPatrol();
	break;
	
	case HAND_STATE.LEAPATTACK:
		HandLeap();
	break;
	
	case HAND_STATE.SNEAK:
		HandSneak();
	break;
	
	case HAND_STATE.THUMBATTACK:
		HandThumbAttack();
		break;
	default:
		HandPatrol();
	break;
}

if (walking_direction) {
	h_rightsight_range = h_frontsight_range;
	h_leftsight_range = h_backsight_range
}
else {
	h_rightsight_range = h_backsight_range;
	h_leftsight_range = h_frontsight_range
}

if(instance_exists(obj_player)) { // check if player is in sight
	//check verticle range first
	if (abs(obj_player.y-y) <= 100) {
		// check right sight
		HandCheckRightSight();
		// check left sight
		HandCheckLeftSight();
	}
	else {
		state = state;
	}
}

if (state == HAND_STATE.PATROL || state == HAND_STATE.SNEAK) {
	image_xscale = sign(walking_direction);
}

 //if(walking_direction && (obj_player.x-x <= h_frontsight_range || (x-obj_player.x) * walking_direction)) {
	 
	//if((obj_player.x-x) * walking_direction <= h_frontsight_range || (x-obj_player.x) * walking_direction <= h_frontsight_range && abs(y-obj_player.y) <= v_sight_range) {
	////pause for a second
		
	//}
		
//change image direction based on walking direction



/*/Player Aggro
if(abs(xtarget) < 300 && xtarget != 0)
{
	image_xscale = sign(xtarget);
	
	if(wait <= 0)
	{	if(obj_player.hsp == 0) 
		{
			if(abs(xtarget) < 125)
			{
				vsp = -7;
				hsp = walkspd * sign(xtarget);
			}
			else
			{
				hsp = (walkspd/3) * sign(xtarget);
			}
		}
	}
	else
	{
		wait--;
	}
}
else
{
	hsp = 0;
	wait = 120;
}

*/