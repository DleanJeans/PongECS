package ui.gameplay;

import flixel.FlxG;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import ui.Button;

class MenuButton extends Button {
	public function new() {
		super(5, 0, "MENU", backToMenu, Settings.leftSpace.width - 10);
		setupLabel();
		UI.hide(this);
	}
	
	public function setupLabel() {
		var landscape = Settings.landscape;
		label.autoSize = !landscape;
		label.alignment = landscape ? FlxTextAlign.CENTER : FlxTextAlign.LEFT;
	}
	
	function backToMenu() {
		UI.hide(this);
		UI.hide(G.ui.winnerText);
		UI.hide(G.ui.playAgainButton);
		UI.show(G.ui.titleMenu);
		G.game.restartSwitchControl();
		G.game.inMenu = true;
	}
	
}