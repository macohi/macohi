package macohi.util;

import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.FlxG;
import flixel.FlxObject;

class CamFollow extends FlxObject
{
	override public function new(lerp:Float = 0.4, ?style:FlxCameraFollowStyle)
	{
		super(0, 0, FlxG.width, FlxG.height);

		setY(0);

		FlxG.camera.follow(this, style ?? LOCKON, lerp);
	}

	public function setY(newY:Float)
	{
		this.y = newY - FlxG.height / 2;
	}
}
