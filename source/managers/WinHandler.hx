package managers;

class WinHandler {
	public function new() {}
	
	public function handle() {
		G.game.pause();
		G.game.restarter.restart();
	}
	
}