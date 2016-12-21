package managers;

import components.Goal;
import components.Score;
import flixel.FlxSprite;
import managers.GameSignals;

/**
 * Detects collision between Balls and Goals.
 * Adds score.
 */
class GoalManager {
	var _signals:GameSignals;
	
	public function new() {
		_signals = G.game.signals;
	}
	
	public function addScore(goal:Goal) {
		goal.opponent.get(Score).add();
	}
	
	public function detectGoal(ball:FlxSprite, wall:FlxSprite) {
		var wallEntity = G.game.getEntity(wall);
		if (wallEntity == Game.NULL_ENTITY) return;
		if (wallEntity.existsType(Goal)) {
			var goal:Goal = wallEntity.get(Goal);
			
			_signals.goal.dispatch(goal);
			_signals.goal_0.dispatch();
			_signals.goal_ball.dispatch(ball);
		}
	}
	
}