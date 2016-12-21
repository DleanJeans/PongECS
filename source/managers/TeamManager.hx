package managers;

import components.Direction;
import components.Goal;
import components.Score;
import edge.Entity;

class TeamManager {
	public var teamUpper(default, null):Entity;
	public var teamLower(default, null):Entity;
	
	public function new() {
		createTeams();
	}
	
	public function createTeams() {
		teamUpper = createTeam(Direction.UP);
		teamLower = createTeam(Direction.DOWN);
		
		teamUpper.add(new Goal(teamLower));
		teamLower.add(new Goal(teamUpper));
	}
	
	function createTeam(position:Int):Entity {
		return G.game.engine.create([new Direction(position), new Score()]);
	}
	
	public function resetScore() {
		teamUpper.get(Score).reset();
		teamLower.get(Score).reset();
	}
	
}