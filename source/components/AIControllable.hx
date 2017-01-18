package components;

import edge.IComponent;

class AIControllable extends Controllable {
	public var ballCenterX:Float;
	public var ballComing:Bool = false;
	public var target:Float;
	
	public function new() {
		super(0.55);
	}
}