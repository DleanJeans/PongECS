package;

import events.EventManager;

/**
 * The global class for everything
 */
@:allow(PlayState)
class G {
	public static var settings(default, null):Settings;
	public static var game(default, null):Game;
	public static var events(default, null):EventManager;
	public static var ui(default, null):UI;
	public static var cameras(default, null):CameraManager;
}