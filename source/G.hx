package;

import flixel.FlxState;

/**
 * The global class for everything
 */
class G {
	public static var state(default, null):FlxState;
	public static var game(default, null):Game;
	public static var ui(default, null):UI;

	public static function provide(state:FlxState, game:Game, ui:UI) {
		G.state = state;
		G.game = game;
		G.ui = ui;
	}
	
}