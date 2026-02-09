package macohi.util;

import macohi.funkin.koya.backend.KoyaAssets;

class StringUtil
{
	public static function splitStringByNewlines(str:String):Array<String>
	{
		if (str == null)
			return [];

		return str.split('\n');
	}

	public static function splitTextAssetByNewlines(txt:String)
	{
		if (!KoyaAssets.exists(txt))
		{
			WindowUtil.alert('Missing Path: $txt', '$txt is a missing path\nand thus cannot be split by newlines');
			return [];
		}

		return splitStringByNewlines(KoyaAssets.getText(txt));
	}
}
