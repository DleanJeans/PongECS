package systems;

import components.DestroyThis;
import edge.Entity;
import edge.ISystem;
import flixel.FlxSprite;

class EntityDestroyer implements ISystem {
	var entity:Entity;
	
	public function update(destroyThis:DestroyThis) {
		if (entity.existsType(FlxSprite))
			entity.get(FlxSprite).kill();
		entity.destroy();
	}
}