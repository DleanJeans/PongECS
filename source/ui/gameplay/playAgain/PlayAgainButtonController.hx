package ui.gameplay.playAgain;

import flixel.text.FlxText;
import ui.Button;
import ui.gameplay.winnerText.WinnerText;

class PlayAgainButtonController {
	var _container:PlayAgainButton;
	
	public function new(container:PlayAgainButton) {
		_container = container;
	}
	
	public function onClick() {
		G.game.restart();
		UI.hide(_container);
		UI.hide(G.ui.winnerText);
	}
	
}