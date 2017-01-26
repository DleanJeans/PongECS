package managers;

import components.BallCollision;
import events.types.EventData_Collision_BallWall;
import flixel.FlxSprite;

class GoalManager {
	public function new() {}
	
	public function addBallCollision(e:EventData_Collision_BallWall) {
		var wallEntity = G.game.getEntity(e.wall);
		wallEntity.add(new BallCollision(G.game.getEntity(e.ball)));
	}
	
}