package systems;
import components.Controlled;
import edge.ISystem;
import flixel.FlxG;
import flixel.FlxSprite;

class PaddleBounder implements ISystem {
	function update(sprite:FlxSprite, controlled:Controlled) {
		var pf = Settings.playField;
		
		if (sprite.x < pf.x)
			sprite.x = pf.x;
		else if (sprite.x + sprite.width > pf.right)
			sprite.x = pf.right - sprite.width;
	}
}