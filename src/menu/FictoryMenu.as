package menu 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class FictoryMenu extends Sprite
	{
		private var _done:BGWon;
		
		public function FictoryMenu() 
		{
			_done = new BGWon();
			addChild(_done);
			
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void 
		{
			dispatchEvent(new Event("startGame"));
		}
	}

}