package ui.title;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxAxes;

class Instruction extends FlxText {
	public function new() {
		super(0, FlxG.height - 125, Settings.playField.width,
		"A or Left Arrow to Move Left\nD or Right Arrow to Move Right\n\nBy Dlean Jeans\n@DleanJeans", 15);
		alignment = FlxTextAlign.CENTER;
		screenCenter(FlxAxes.X);
	}
	
}