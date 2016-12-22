package systems;

import components.Controlled;
import edge.ISystem;
import flixel.FlxSprite;

class PaddleMovement implements ISystem {
	public function update(sprite:FlxSprite, controlled:Controlled) {
		sprite.velocity.x = controlled.movingDirection * controlled.speed;
	}
	
}