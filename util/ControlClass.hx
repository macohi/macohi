package macohi.util;

import flixel.FlxG;

class ControlClass
{
	public var keybinds:Map<String, Array<String>> = [];

	public function pressed(keybind:String):Bool
		return keybinds.exists(keybind) && FlxG.keys.anyPressed(FlxKeyUtil.stringArrayToKeysArray(keybinds.get(keybind)));

	public function justPressed(keybind:String):Bool
		return keybinds.exists(keybind) && FlxG.keys.anyJustPressed(FlxKeyUtil.stringArrayToKeysArray(keybinds.get(keybind)));

	public function justReleased(keybind:String):Bool
		return keybinds.exists(keybind) && FlxG.keys.anyJustReleased(FlxKeyUtil.stringArrayToKeysArray(keybinds.get(keybind)));

	public function new() {}
}
