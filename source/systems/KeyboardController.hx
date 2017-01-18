package systems;

import components.Direction;
import components.PlayerControllable;
import edge.Entity;
import edge.ISystem;
import flixel.FlxG;
import flixel.FlxSprite;

class KeyboardController implements ISystem {
	public function update(sprite:FlxSprite, player:PlayerControllable, team:Entity) {
		#if !FLX_NO_KEYBOARD
		if (G.settings.splitScreen)
			updateTwoPlayer(sprite, player, team);
		else updateOnePlayer(sprite, player, team);
		#end
	}
	
	#if !FLX_NO_KEYBOARD
	function updateOnePlayer(sprite:FlxSprite, player:PlayerControllable, team:Entity) {
		player.movingDirection = 0;
		if (FlxG.keys.anyPressed([A, LEFT]))
			moveLeft(player);
		if (FlxG.keys.anyPressed([D, RIGHT]))
			moveRight(player);
	}
	
	function updateTwoPlayer(sprite:FlxSprite, player:PlayerControllable, team:Entity) {
		var teamPosition = team.get(Direction).direction;
		
		player.movingDirection = 0;
		
		switch (teamPosition) {
			case Direction.DOWN:
				if (FlxG.keys.pressed.A)
					moveLeft(player);
				else if (FlxG.keys.pressed.D)
					moveRight(player);
			case Direction.UP:
				if (FlxG.keys.pressed.LEFT)
					moveLeft(player);
				else if (FlxG.keys.pressed.RIGHT)
					moveRight(player);
		}
	}
	
	function moveLeft(player:PlayerControllable) {
		player.movingDirection -= 1;
	}
	
	function moveRight(player:PlayerControllable) {
		player.movingDirection += 1;
	}
	#end
	
}