package components;

import edge.IComponent;

class Direction implements IComponent {
	public static inline var UP = -1;
	public static inline var DOWN = 1;
	public static inline var LEFT = -1;
	public static inline var RIGHT = 1;
	
	public var direction:Int;
}