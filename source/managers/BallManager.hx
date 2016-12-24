package managers;

import edge.Entity;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxPoint;

class BallManager {
	public var balls(default, null):FlxSpriteGroup;
	
	public function new() {
		balls = G.game.balls;
	}
	
	public function reset() {
		for (ball in balls) {
			var ballEntity:Entity = G.game.getEntity(ball);
			ballEntity.destroy();
			killBall(ball);
		}
	}
	
	public function createBall(?velocity:FlxPoint):Entity {
		var sprite = G.game.createSprite(0, 0, balls);
		sprite.makeGraphic(Settings.unit(), Settings.unit());
		sprite.setCenter(Settings.playField.getCenter());
		sprite.elasticity = 1;
		if (velocity != null) {
			sprite.velocity.copyFrom(velocity);
			velocity.putWeak();
		}
		
		return G.game.engine.create([sprite]);
	}
	
	public function killBall(ball:FlxSprite) {
		ball.kill();
		balls.remove(ball, true);
	}
	
}