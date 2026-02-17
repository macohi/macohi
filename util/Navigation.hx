package macohi.util;

/**
	The navigation class.

	I'm serious.
	This class was made to reduce boilerplate inside menus where it would be uneccessary
	to have the same code over and over for everything. 

	Yoinked from https://github.com/SomeGuyWhoLovesCoding/FNF-PeoteView/blob/official/src/data/gameplay/Navigation.hx
**/
@:publicFields
@:noDebug
abstract Navigation(Int)
{
	inline function new()
		this = 0;

	inline function scroll(amount:Int)
	{
		this += amount;
	}

	inline function setTo(amount:Int)
	{
		this = amount;
	}

	inline function reset(resetValue:Int = 0)
	{
		this = resetValue;
	}

	inline function resetIfOver(amount:Int, resetValue:Int = 0)
	{
		if (this >= amount)
			reset(resetValue);
	}

	inline function resetIfUnder(setTo:Int, under:Int = 0)
	{
		if (this < under)
			this = setTo;
	}

	inline function resetIfBoth(over:Int, setTo:Int, under:Int = 0, resetValue:Int = 0)
	{
		resetIfOver(over, resetValue);
		resetIfUnder(setTo, under);
	}

	inline function value()
		return this;
}
