package ui.gameplay.playAgain;

import flixel.text.FlxText;
import ui.Button;
import ui.gameplay.winnerText.WinnerText;

class PlayAgainButtonView extends Button {
	public function new(container:PlayAgainButton, controller:PlayAgainButtonController) {
		super(0, 0, "PLAY AGAIN", controller.onClick, G.settings.playField.width * 0.75);
		label.alignment = FlxTextAlign.CENTER;
		screenCenter();
		y += G.settings.unit(4);
		UI.hide(container);
	}
	
}