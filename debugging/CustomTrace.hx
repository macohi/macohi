package macohi.debugging;

import haxe.PosInfos;

using macohi.funkin.vslice.util.AnsiUtil;
using StringTools;

class CustomTrace
{
	public static var formatWordOptions:Map<String, (String, String) -> String> = [
		'<warning>' => function(key:String, v:String)
		{
			return v?.replace(key, ' WARNING '.warning());
		},
		'<error>' => function(key:String, v:String)
		{
			return v?.replace(key, ' ERROR '.error());
		},
		'<reset>' => function(key:String, v:String)
		{
			return v?.replace(key, AnsiCode.RESET);
		},
	];

	public static dynamic function formatOutput(v:Dynamic, ?pos:PosInfos):String
	{
		var nv:String = Std.string(v);

		if (nv == null)
			nv = '<error> null input';

		var posInfos:String = '';

		if (pos != null)
		{
			posInfos += '${pos.fileName}:${pos.lineNumber} ';

			nv = ' : $nv';
		}

		nv = '${posInfos.bold()}${nv.bold()}';

		if (nv != null)
		{
			for (key => value in formatWordOptions)
				if (nv.contains(key))
					if (value != null)
						nv = value(key, nv);
		}

		return nv;
	}

	public static dynamic function newTrace(v:Dynamic, ?pos:PosInfos)
	{
		var str:String = formatOutput(v, pos);

		#if js
		if (js.Syntax.typeof(untyped console) != "undefined" && (untyped console).log != null)
			(untyped console).log(str);
		#elseif lua
		untyped __define_feature__("use._hx_print", _hx_print(str));
		#elseif sys
		Sys.println(str);
		#else
		throw new haxe.exceptions.NotImplementedException()
		#end
	}
}
