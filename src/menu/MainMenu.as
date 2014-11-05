package menu 
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import placeholderArt.ButtonPlaceholder;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class MainMenu extends Sprite
	{
		private var _button:ButtonPlaceholder
		private var text:TextField;
		private var tf:TextFormat;
		private var s:Stage;
		private var _fullscreen:Fullscreen;
		
		public function MainMenu() 
		{
			_button = new ButtonPlaceholder();
			addChild(_button);
			_button.x = 0;
			_button.y = 0;
			
			tf = new TextFormat("Arial", 20, 0x000000,true);
			text = new TextField();
			text.setTextFormat(tf);
			text.x = 210;
			text.y = 310;
			addChild(text);
			text.width = text.textWidth;
			
			_fullscreen = new Fullscreen();
			_fullscreen.x = 600;
			_fullscreen.y = 550;
			addChild(_fullscreen);
			
			_button.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void 
		{
			trace("yo");
			dispatchEvent(new Event("startGame"));
		}
		
	}

}