package;

/**
 * The global class for everything
 */
class G {
	public static var settings(default, null):Settings;
	public static var game(default, null):Game;
	public static var ui(default, null):UI;
	public static var cameras(default, null):CameraManager;

	public static function provide(settings:Settings, game:Game, ui:UI, cameras:CameraManager) {
		G.settings = settings;
		G.game = game;
		G.ui = ui;
		G.cameras = cameras;
	}
	
}