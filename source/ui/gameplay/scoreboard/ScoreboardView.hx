package ui.gameplay.scoreboard;

import flixel.FlxG;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;

class ScoreboardView extends FlxSpriteGroup {
	public var upperScore(default, null):FlxText;
	public var lowerScore(default, null):FlxText;
	
	public function new() {
		super();
		
		var size = if (G.settings.landscape) 50 else 30;
		var fieldWidth = G.settings.scoreboardFieldWidth;
		size = G.settings.scale(size);
		
		upperScore = new FlxText(0, 0, fieldWidth, "10", size);
		lowerScore = new FlxText(0, 0, fieldWidth, "10", size);
		
		upperScore.alignment = lowerScore.alignment = FlxTextAlign.CENTER;
		
		add(upperScore);
		add(lowerScore);
		
		if (G.settings.portrait)
			upperScore.fieldWidth = lowerScore.fieldWidth = upperScore.width;
		
		upperScore.setBottomRight(Position.screenMidRight);
		lowerScore.setTopRight(Position.screenMidRight);
		
		upperScore.text = lowerScore.text = "0";
	}
	
}