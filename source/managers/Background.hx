package managers;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.util.FlxSpriteUtil;
import openfl.display.CapsStyle;

class Background extends FlxSprite {
	public function new() {
		var pf = G.settings.playField;
		super(pf.x, pf.y);
		makeGraphic(cast pf.width, cast pf.height, 0x0);
		drawSimpleBackground();
	}
	
	function drawSimpleBackground() {
		var color = FlxColor.WHITE;
		color.alphaFloat = 0.5;
		var lineStyle:LineStyle = {
			thickness: G.settings.unit(0.25),
			color: color,
		};
		FlxSpriteUtil.drawLine(this, 0, height / 2, width, height / 2, lineStyle);
	}
	
}