package;
import flixel.group.FlxGroup;
import testing.OrientationSwitcher;
import testing.shortcut.ShortcutWrapper;

class Tester extends FlxGroup {
	public var shortcut(default, null):ShortcutWrapper;
	public var orientationSwitcher(default, null):OrientationSwitcher;

	public function new() {
		super();
		
		shortcut = new ShortcutWrapper();
		orientationSwitcher = new OrientationSwitcher();
		
		add(shortcut);
		add(orientationSwitcher);
	}
	
}