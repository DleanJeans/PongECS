package managers;

import components.BallCollision;
import flixel.FlxSprite;

class GoalManager {
	public function new() {}
	
	public function addBallCollision(ball:FlxSprite, wall:FlxSprite) {
		var entity = G.game.getEntity(wall);
		entity.add(new BallCollision(G.game.getEntity(ball)));
	}
	
}