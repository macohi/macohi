package macohi.overrides;

import flixel.sound.FlxSound;
import flixel.system.FlxAssets.FlxSoundAsset;
import flixel.util.FlxSignal;

class MSound extends FlxSound
{
	public var onFinish:FlxSignal = new FlxSignal();
	public var onStart:FlxSignal = new FlxSignal();

	override public function new()
	{
		super();

		onComplete = () ->
		{
			if (onFinish != null)
				onFinish.dispatch();
		}
	}

	override function startSound(StartTime:Float)
	{
		if (onStart != null)
			onStart.dispatch();

		super.startSound(StartTime);
	}
}
