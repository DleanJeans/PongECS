package systems;

import components.Controllable;
import edge.ISystem;
import flixel.FlxSprite;

class PaddleBounder implements ISystem {
	function update(sprite:FlxSprite, controllable:Controllable) {
		var pf = G.settings.playField;
		
		var leftWallRight = G.game.wallManager.left.get(FlxSprite).getRight();
		var rightWallX = G.game.wallManager.right.get(FlxSprite).x;
		
		if (sprite.x < leftWallRight)
			sprite.x = leftWallRight;
		else if (sprite.getRight() > rightWallX)
			sprite.setRight(rightWallX);
	}
}