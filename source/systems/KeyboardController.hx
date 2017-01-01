package systems;

import components.Direction;
import components.PlayerControlled;
import edge.Entity;
import edge.ISystem;
import flixel.FlxG;
import flixel.FlxSprite;

class KeyboardController implements ISystem {
	public function update(sprite:FlxSprite, player:PlayerControlled, team:Entity) {
		#if !FLX_NO_KEYBOARD
		if (G.settings.splitScreen)
			updateTwoPlayer(sprite, player, team);
		else updateOnePlayer(sprite, player, team);
		#end
	}
	
	function updateOnePlayer(sprite:FlxSprite, player:PlayerControlled, team:Entity) {
		player.movingDirection = 0;
		if (FlxG.keys.anyPressed([A, LEFT]))
			moveLeft(player);
		if (FlxG.keys.anyPressed([D, RIGHT]))
			moveRight(player);
	}
	
	function updateTwoPlayer(sprite:FlxSprite, player:PlayerControlled, team:Entity) {
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
	
	function moveLeft(player:PlayerControlled) {
		player.movingDirection -= 1;
	}
	
	function moveRight(player:PlayerControlled) {
		player.movingDirection += 1;
	}
}