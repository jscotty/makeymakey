package game.obstacle 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Platform extends Sprite
	{
		private var _platform01:Ground01;
		private var _platform02:Ground02;
		private var _platform03:Ground03;
		
		private var random:int;
		
		public function Platform() 
		{
			random = Math.floor (Math.random() * 3);
			if (random == 0) {
				_platform01 = new Ground01();
				_platform01.scaleX = 1.1;
				_platform01.scaleY = 1.1;
				addChild(_platform01);
				
			}
			else if (random == 1) {
				_platform02 = new Ground02();
				_platform02.scaleX = 1.1;
				_platform02.scaleY = 1.1;
				addChild(_platform02);
				
			}
			else if (random == 2) {
				_platform03 = new Ground03();
				_platform03.scaleX = 1.1;
				_platform03.scaleY = 1.1;
				addChild(_platform03);
				
			}
		}
		
	}

}