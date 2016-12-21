package components;

import edge.IComponent;

class Controlled implements IComponent {
	/**
	 * -1 == LEFT
	 * 0 == NOT MOVING
	 * 1 = RIGHT
	 */
	public var movingDirection:Int = 0;
}