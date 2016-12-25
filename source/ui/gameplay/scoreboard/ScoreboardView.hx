package ui.gameplay.scoreboard;

import flixel.FlxG;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;

class ScoreboardView extends FlxSpriteGroup {
	public var upperScore(default, null):FlxText;
	public var lowerScore(default, null):FlxText;
	
	public function new() {
		super();
		
		var size = if (Settings.landscape) 50 else 30;
		var fieldWidth = Settings.rightSpace.width - Settings.unit(2);
		
		upperScore = new FlxText(0, 0, fieldWidth, "10", size);
		lowerScore = new FlxText(0, 0, fieldWidth, "10", size);
		
		upperScore.alignment = lowerScore.alignment = FlxTextAlign.CENTER;
		
		add(upperScore);
		add(lowerScore);
		
		if (!Settings.landscape)
			upperScore.fieldWidth = lowerScore.fieldWidth = upperScore.width;
		
		upperScore.setBottomRight(Position.screenMidRight);
		lowerScore.setTopRight(Position.screenMidRight);
		
		upperScore.text = lowerScore.text = "0";
	}
	
}