package ui.gameplay;

import flixel.FlxG;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import ui.Button;

class MenuButton extends Button {
	public static var MENU = "MENU";
	public static var CLICK_AGAIN = if (FlxG.onMobile) "TAP AGAIN" else "CLICK AGAIN";
	
	public function new() {
		super(5, 0, MENU, onClick, Settings.leftSpace.width - 10);
		setupLabel();
		UI.hide(this);
		
		FlxMouseEventManager.add(this, null, null, null, resetOnMouseLeaving, false, true,
		false); // `pixelPerfect = false` make button with transparent graphic clickable
	}
	
	public function setupLabel() {
		var landscape = Settings.landscape;
		label.wordWrap = landscape;
		label.autoSize = !landscape;
		label.alignment = landscape ? FlxTextAlign.CENTER : FlxTextAlign.LEFT;
	}
	
	function resetOnMouseLeaving(_) {
		text = MENU;
		updateTextBox();
	}
	
	function onClick() {
		if (text == MENU) {
			text = CLICK_AGAIN;
		}
		else if (text == CLICK_AGAIN) {
			text = MENU;
			backToMenu();
		}
		updateTextBox();
	}
	
	function updateTextBox() {
		setGraphicSize(cast label.width, cast label.height);
		updateHitbox();
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