package macohi.overrides;

import flixel.text.FlxText;

class MText extends FlxText
{
	/** Quickly generate a new Text Object with text and size parameters **/
	public function makeText(text:String, size:Int):MText
	{
		this.text = text;
		this.size = size;

		return this;
	}
}
