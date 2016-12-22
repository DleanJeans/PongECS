package ui.gameplay.playAgain;

import flixel.text.FlxText;
import ui.Button;
import ui.gameplay.winnerText.WinnerText;

class PlayAgainButtonView extends Button {
	public function new(container:PlayAgainButton, controller:PlayAgainButtonController) {
		super(0, 0, "PLAY AGAIN", controller.onClick, Settings.playField.width);
		label.alignment = FlxTextAlign.CENTER;
		screenCenter();
		UI.hide(container);
	}
	
}