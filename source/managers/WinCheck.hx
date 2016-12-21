package managers;

import components.Score;
import edge.Entity;

class WinCheck {
	var _teamUpper:Entity = G.game.teamUpper;
	var _teamLower:Entity = G.game.teamLower;
	
	var _upper:Score;
	var _lower:Score;
	
	public function new() {
		_upper = _teamUpper.get(Score);
		_lower = _teamLower.get(Score);
	}
	
	public function check() {
		var winner = getWinner();
		if (winner != null) {
			G.game.signals.won.dispatch(winner);
			G.game.signals.won_0.dispatch();
		}
	}
	
	public function getWinner():Entity {
		if (_upper.won())
			return _teamUpper;
		else if (_lower.won())
			return _teamLower;
		else return null;
	}
	
}