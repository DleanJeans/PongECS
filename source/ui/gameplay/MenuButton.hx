package ui.gameplay;

import flixel.input.mouse.FlxMouseEventManager;
import flixel.text.FlxText;
import ui.Button;

class MenuButton extends Button {
	public static var MENU = "MENU";
	public static var CLICK_AGAIN = "CLICK AGAIN";
	
	public function new() {
		super(0, 5, MENU, onClick, Settings.leftSpace.width);
		label.alignment = FlxTextAlign.CENTER;
		label.wordWrap = true;
		UI.hide(this);
		
		FlxMouseEventManager.add(this, null, null, null, resetOnMouseLeaving, false, true, 
		false); // `pixelPerfect = false` allows button with transparent graphic to be click
	}
	
	function resetOnMouseLeaving(_) {
		text = MENU;
	}
	
	function onClick() {
		if (text == MENU) {
			text = CLICK_AGAIN;
		}
		else if (text == CLICK_AGAIN) {
			text = MENU;
			backToMenu();
		}
		height = label.height;
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