package managers;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;

class SpriteManager {
	var _pool:FlxSpriteGroup;
	
	public function new() {
		_pool = new FlxSpriteGroup();
	}
	
	/**
	 * Create a new FlxSprite and optionally add it to the `group` if given.
	 */
	public function createSprite(x:Float = 0, y:Float = 0, ?group:FlxSpriteGroup):FlxSprite {
		var sprite = _pool.recycle(FlxSprite);
		sprite.reset(x, y);
		sprite.solid = true;
		if (group != null)
			group.add(sprite);
		return sprite;
	}
	
}