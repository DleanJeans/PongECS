package ui.gameplay.playAgain;

import flixel.group.FlxGroup;
import flixel.text.FlxText;
import ui.Button;
import ui.gameplay.winnerText.WinnerText;

class PlayAgainButton extends FlxGroup {
	var _view:PlayAgainButtonView;
	var _controller:PlayAgainButtonController;
	
	public function new() {
		super();
		_controller = new PlayAgainButtonController(this);
		_view = new PlayAgainButtonView(this, _controller);
		
		add(_view);
	}
	
}