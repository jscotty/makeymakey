package placeholderArt 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class ButtonPlaceholder extends Sprite
	{
		private var _start:StartScreen;
		
		public function ButtonPlaceholder() 
		{
			_start = new StartScreen();
			addChild(_start);
			
		}
		
	}

}