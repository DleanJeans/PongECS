package;
import flixel.group.FlxGroup;
import testing.ResolutionSwitcher;
import testing.shortcut.ShortcutWrapper;

class Tester extends FlxGroup {
	public var shortcut(default, null):ShortcutWrapper;
	public var orientationSwitcher(default, null):ResolutionSwitcher;

	public function new() {
		super();
		
		shortcut = new ShortcutWrapper();
		orientationSwitcher = new ResolutionSwitcher();
		
		add(shortcut);
		add(orientationSwitcher);
	}
	
}