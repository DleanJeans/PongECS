package managers;

import components.DestroyThis;
import edge.Entity;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxPoint;

using DPosition;
using Position;

class BallManager {
	public var balls(default, null):FlxSpriteGroup;
	
	public function new() {
		balls = G.game.balls;
	}
	
	public function clear() {
		for (ball in balls) {
			var entity = G.game.getEntity(ball);
			entity.add(new DestroyThis());
		}
	}
	
	public function createBall(?velocity:FlxPoint):Entity {
		var sprite = G.game.createSprite(0, 0, balls);
		
		sprite.makeGraphic(G.settings.unit(), G.settings.unit());
		sprite.setCenter(G.settings.playField.getCenter());
		sprite.elasticity = 1;
		
		if (velocity != null) {
			sprite.velocity.copyFrom(velocity);
			velocity.putWeak();
		}
		
		return G.game.createEntity([sprite]);
	}
	
	public function killBall(ball:FlxSprite) {
		ball.kill();
		balls.remove(ball, true);
	}
	
}