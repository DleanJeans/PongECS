package systems;

import components.BallCollision;
import components.DestroyThis;
import components.Goal;
import components.Score;
import edge.Entity;
import edge.ISystem;
import flixel.FlxSprite;

class GoalHandler implements ISystem {
	public function update(goal:Goal, ballCollision:BallCollision) {
		var ball = ballCollision.ballEntity;
		
		killBall(ball);
		spawnNewBall(ball);
		addScore(goal.opponent);
		checkWin();
	}
	
	function addScore(team:Entity) {
		team.get(Score).add();
	}
	
	function killBall(ball:Entity) {
		ball.add(new DestroyThis());
	}
	
	function spawnNewBall(ball:Entity) {
		G.game.ballSpawner.spawnAtScorer(ball.get(FlxSprite));
	}
	
	function checkWin() {
		G.game.winCheck.check();
	}
}