extends Node

var health:int = 10
var sanity:float = 1000
var approval:int = 0;

func changeSanity(val:int):
	sanity += val;
	if (sanity > 1000):
		sanity = 1000;
	elif sanity < 1:
		sanity = 1;
		
func changeApproval(val:int):
	approval += val;
	if (approval > 10):
		approval = 10;
	elif approval < -10:
		approval = -10;
		
func changeHealth(val:int):
	health += val;
	if (health > 10):
		health = 10;
	elif health < 0:
		health = 0;
