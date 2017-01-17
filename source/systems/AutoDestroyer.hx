package systems;

import components.AutoDestroy;
import components.DestroyThis;
import edge.Entity;
import edge.ISystem;

class AutoDestroyer implements ISystem {
	var entity:Entity;
	var timeDelta:Float;
	
	public function update(autoDestroy:AutoDestroy) {
		autoDestroy.timeLeft -= timeDelta;
		if (autoDestroy.timeLeft <= 0)
			entity.add(new DestroyThis());
	}
}