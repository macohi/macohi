package macohi.funkin.koya.frontend.scenes.menustates.options;

import flixel.FlxG;
import flixel.input.keyboard.FlxKey;
import macohi.save.Save;
import macohi.save.SaveField;

using StringTools;

class KeybindPrompt extends Prompt
{
	var keybind:String;

	override public function new(keybind:String, ?leaveMethod:Bool->Void)
	{
		super(leaveMethod);

		this.keybind = keybind;

		this.prompt = 'Binding: ' + '“${this.keybind}”' + '\n\nESCAPE TO CANCEL';
	}

	public static dynamic function keybinds():Array<SaveField<Array<String>>>
	{
		return [];
	}

	override function handleControls()
	{
		super.handleControls();

		if (!FlxG.keys.justPressed.ESCAPE)
			return;
		if (!FlxG.keys.justPressed.ANY)
			return;

		var invalids:Array<FlxKey> = [ESCAPE];

		for (keybindList in keybinds())
			for (key in keybindList.get())
				invalids.push(FlxKey.fromString(key));

		var key:FlxKey = cast FlxG.keys.firstJustReleased();

		if (invalids.contains(key))
		{
			promptText.text = 'Not bound\n\nKey already bound';
			deny();
			return;
		}

		var keyString = key.toString();

		var keybindField:SaveField<String> = Reflect.getProperty(Save, keybind);
		if (keybindField == null)
		{
			promptText.text = 'Not bound\n\nKeybind save field not found';
			deny();
			return;
		}

		keybindField.set(keyString);
		promptText.text = 'Bound to “$keyString”';

		accept();
	}
}
