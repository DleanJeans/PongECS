package managers;

import edge.Entity;
import flixel.FlxSprite;

class EntityTracker {
	var _map:Map<FlxSprite, Entity> = new Map<FlxSprite, Entity>();
	
	public function new() {}
	
	public function get(sprite:FlxSprite):Entity {
		return _map.get(sprite);
	}
	
	public function add(sprite:FlxSprite, entity:Entity) {
		_map.set(sprite, entity);
	}
	
	public function remove(sprite:FlxSprite, entity:Entity) {
		_map.remove(sprite);
	}
}