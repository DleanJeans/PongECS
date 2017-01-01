package;
import flixel.FlxCamera;
import flixel.FlxG;

class CameraManager {
	public var mainCam(default, null):FlxCamera;
	public var gameCam1(default, null):FlxCamera;
	public var gameCam2(default, null):FlxCamera;
	public var uiCam(default, null):FlxCamera;
	
	public function new() {}
	
	public function setup() {
		mainCam = FlxG.camera;
		
		gameCam1 = new FlxCamera(0, 0, cast FlxG.width / 2, FlxG.height);
		gameCam2 = new FlxCamera(cast FlxG.width / 2, 0, cast FlxG.width / 2, FlxG.height);
		uiCam = new FlxCamera();
		
		FlxG.cameras.add(gameCam1);
		FlxG.cameras.add(gameCam2);
		FlxG.cameras.add(uiCam);
		
		gameCam1.visible = false;
		gameCam2.visible = false;
		
		gameCam2.angle = 180;
		
		uiCam.bgColor = 0x0;
		
		FlxCamera.defaultCameras = [mainCam];
	}
	
	public function tryEnableSplitScreen() {
		if (!G.settings.splitScreenPossible)
			return;
		
		gameCam1.visible = gameCam2.visible = true;
		gameCam1.scroll.x = gameCam2.scroll.x = G.settings.playField.x;
		
		FlxCamera.defaultCameras = [gameCam1, gameCam2];
	}
	
	public function tryDisableSplitScreen() {
		if (!G.settings.splitScreenPossible)
			return;
		
		gameCam1.visible = gameCam2.visible = false;
		FlxCamera.defaultCameras = [mainCam];
	}
}