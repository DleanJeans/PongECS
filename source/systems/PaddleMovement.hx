package systems;

import components.Controllable;
import edge.ISystem;
import flixel.FlxSprite;

class PaddleMovement implements ISystem {
	public function update(sprite:FlxSprite, controllable:Controllable) {
		sprite.velocity.x = controllable.movingDirection * controllable.speed;
	}
	
}