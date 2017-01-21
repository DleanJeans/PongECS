package managers;

import flixel.util.FlxTimer;

class Restarter {
	var _timer:FlxTimer;

	public function new() {
		_timer = new FlxTimer();
	}
	
	public function restart() {
		if (G.game.inMenu)
			autoRestart();
		else showPlayAgainButton();
	}
	
	function autoRestart() {
		_timer.start(1, function(_) G.game.restart());
	}
	
	function showPlayAgainButton() {
		UI.show(G.ui.playAgainButton);
	}
	
}