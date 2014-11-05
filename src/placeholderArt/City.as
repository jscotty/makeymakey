package placeholderArt 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class City extends Sprite
	{
		
		public function City() 
		{
			graphics.beginFill(0x00ff00, 1);
			graphics.drawRect(0, -2, 1800, 40);
			graphics.endFill();
			
			graphics.beginFill(0x0fff00, 1);
			graphics.drawRect(0, -2, 100, -50);
			graphics.endFill();
		}
		
	}

}