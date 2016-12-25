package;

import flixel.util.FlxColor;

class Color {
	public static var semiTransparentGray(get, null):Null<FlxColor>;
	static function get_semiTransparentGray() {
		if (semiTransparentGray != null)
			return semiTransparentGray;
		
		semiTransparentGray = FlxColor.BLACK;
		semiTransparentGray.alphaFloat = 0.25;
		return semiTransparentGray;
	}
	
}