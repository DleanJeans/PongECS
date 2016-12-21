package systems;

import components.PlayerControlled;
import edge.ISystem;
import flixel.FlxG;
import flixel.FlxSprite;

class KeyboardController implements ISystem {
	public function update(sprite:FlxSprite, player:PlayerControlled) {
		player.movingDirection = 0;
		if (FlxG.keys.anyPressed([A, LEFT]))
			player.movingDirection += -1;
		if (FlxG.keys.anyPressed([D, RIGHT]))
			player.movingDirection += 1;
	}
}