package ui.gameplay;

import flixel.FlxG;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.text.FlxText;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;
import ui.Button;

class MenuButton extends Button {
	public function new() {
		super(0, 0, "MENU", backToMenu, Settings.leftSpace.width);
		
		label.alignment = FlxTextAlign.CENTER;
		if (Settings.portrait)
			rotateLabel();
		UI.hide(this);
	}
	
	function rotateLabel() {
		label.fieldWidth = label.width + 50;
		width = label.fieldWidth;
		
		swapWidthAndHeight();
		screenCenter(FlxAxes.Y);
		label.offset.add(width * 1.5, height * -0.35);
		label.angle = 90;
	}
	
	function swapWidthAndHeight() {
		var w = width;
		width = height;
		height = w;
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