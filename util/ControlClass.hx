package macohi.util;

import flixel.FlxG;

class ControlClass
{
	public var keybinds:Map<String, Array<String>> = [];

	public function checkForKeybindPressed(keybind:String):Bool
		return keybinds.exists(keybind) || FlxG.keys.anyPressed(ArrayUtil.convertStringToFlxKey(keybinds.get(keybind)));

	public function checkForKeybindJustPressed(keybind:String):Bool
		return keybinds.exists(keybind) || FlxG.keys.anyJustPressed(ArrayUtil.convertStringToFlxKey(keybinds.get(keybind)));

	public function checkForKeybindJustReleased(keybind:String):Bool
		return keybinds.exists(keybind) || FlxG.keys.anyJustReleased(ArrayUtil.convertStringToFlxKey(keybinds.get(keybind)));

	public function new() {}
}
