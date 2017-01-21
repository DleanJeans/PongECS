package managers;

import edge.Entity;

class WinHandler {
	public function new() {}
	
	public function handle(team:Entity) {
		G.game.pause();
		G.game.restarter.restart();
	}
	
}