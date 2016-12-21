package ui;

import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class Button extends FlxButton {
	public function new(x:Float = 0, y:Float = 0, text:String = "", ?onClick:Void->Void, ?fieldWidth:Float) {
		super(x, y, text, onClick);
		
		label.color = FlxColor.WHITE;
		label.size = 25;
		label.fieldWidth = fieldWidth != null ? fieldWidth : Settings.playField.width * 0.75;
		label.alignment = FlxTextAlign.LEFT;
		
		makeGraphic(cast label.width, cast label.height, 0x0);
	}
	
}