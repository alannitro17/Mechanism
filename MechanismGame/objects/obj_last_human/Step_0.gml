vsp = vsp + grv;



switch(state)
{
	case LAST_HUMAN_STATE.IDLE: LastHumanState_Idle(); break;
	case LAST_HUMAN_STATE.AGGRO: LastHumanState_Aggro(); break;
	case LAST_HUMAN_STATE.SLASH: LastHumanState_Slash(); break;
	case LAST_HUMAN_STATE.THRUST: LastHumanState_Thrust(); break;
	case LAST_HUMAN_STATE.DEAD: LastHumanState_Dead(); break;
}



if(hp < 0) instance_destroy();