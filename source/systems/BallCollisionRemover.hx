package systems;
import components.BallCollision;
import edge.Entity;
import edge.ISystem;

class BallCollisionRemover implements ISystem {
	var entity:Entity;
	
	public function update(ballCollision:BallCollision) {
		entity.remove(ballCollision);
	}
}