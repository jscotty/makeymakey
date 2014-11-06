package game 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import game.obstacle.Obstacle1;
	import game.obstacle.Obstacle2;
	import game.obstacle.Platform;
	import game.players.Player2;
	import placeholderArt.City;
	import game.players.Player;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Game extends Sprite
	{
		public static var _player1 : Player;
		public static var _player2 : Player2;
		
		private var _city : Array;
		private var _platform:Platform;
		private var _gravity : Number = 4;
		
		private var _jumping1 : Boolean;
		private var _jumpPressed1 : Boolean;
		
		private var jumpForce1 : Number = 0;
		private var jumpForce2 : Number = 0;
		
		private var _jumping2 : Boolean;
		private var _jumpPressed2 : Boolean;
		
		private var _moving1 : Boolean;
		private var _moving2 : Boolean;
		
		private var _onGround : Boolean;
		
		private var _background : BG1;
		
		private var _obstacle : Obstacle1;
		
		private var _platformMovement : int;
		
		private var _distance:int;
		
		private var st:Stage;
		private var levelspeed:Number = 0;
		private var _platform2:Platform;
		private var _obstacle2:Obstacle2;
		
		private var P1x :int = 6;
		private var P2x :int = 5;
		
		public function Game(s:Stage) 
		{
			st = s;
			
			for (var i:int = 0; i < 10; i++) {
				_background = new BG1();
				_background.x = -320 + i * 2400;
				addChild(_background);
			}
			
			/*_city = new City();
			_city.x = 0;
			_city.y = 450;
			addChild(_city);*/
			
				_platform = new Platform();
				_platform.x = 0;
				_platform.y = 450;
				//_city.push(_platform);
				addChild(_platform);
				
				_platform2 = new Platform();
				_platform2.x = -542;
				_platform2.y = 450;
				//_city.push(_platform);
				addChild(_platform2);
			
			
			
			_obstacle = new Obstacle1(2000,30,2500,-200);
			_obstacle.x = 520;
			_obstacle.y = 450;
			_obstacle.scaleX = 0.5;
			_obstacle.scaleY = 0.5;
			addChild(_obstacle);
			
			_obstacle2 = new Obstacle2();
			_obstacle2.x = 2294;
			_obstacle2.y = 450;
			_obstacle2.scaleX = 0.5;
			_obstacle2.scaleY = 0.5;
			addChild(_obstacle2);
			trace(_obstacle.width);
			
			
			_player2 = new Player2();
			_player2.x = 90;
			_player2.y = 200;
			_player2.scaleX = 0.3;
			_player2.scaleY = 0.3;
			addChild(_player2);
			
			_player1 = new Player(stage);
			_player1.x = 180;
			_player1.y = 200;
			_player1.scaleX = 0.3;
			_player1.scaleY = 0.3;
			addChild(_player1);
			
			
			s.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			s.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			s.addEventListener(Event.ENTER_FRAME, update);
			
		}
		
		private function update(e:Event):void 
		{
			
			var globalpoint:Point  = new Point(_player1.x, _player1.y);
			globalpoint = localToGlobal(globalpoint);
			
			var globalpoint2:Point  = new Point(_player2.x, _player2.y);
			globalpoint2 = localToGlobal(globalpoint2);
			
			_distance = st.stageWidth / 2 - globalpoint.x ;//distance from middle of screen
			
			var localPoint:Point = new Point(_player1.x, _player1.y);
			
			
			//trace(_distance);
			levelspeed  = _distance * 0.055;
			//trace("lvl spd"+levelspeed);
			this.x += levelspeed;
		
			//trace("global point" + globalpoint);
			
			_onGround = false;
			var counter:int = 0;
		//	var l:Number = _city.length;
			while (counter < 1000 && _platform.hitTestPoint(globalpoint.x,globalpoint.y -50,true) ||  _obstacle.hitTestPoint(globalpoint.x,globalpoint.y -50,true) ||   _obstacle2.hitTestPoint(globalpoint.x,globalpoint.y -50,true)) {
				counter ++;
				globalpoint.x = _player1.x
				globalpoint.y= _player1.y;
				globalpoint = localToGlobal(globalpoint);
				_player1.y --;
				_jumping1 = false;
				
				
			}
			
			var counter2:int = 0;
			while (counter2 < 1000 && _platform.hitTestPoint(globalpoint2.x,globalpoint2.y -50,true) ||   _obstacle.hitTestPoint(globalpoint2.x,globalpoint2.y -50,true) ||   _obstacle2.hitTestPoint(globalpoint2.x,globalpoint2.y -50,true)) {
				counter2 ++;
				globalpoint2.x = _player2.x
				globalpoint2.y= _player2.y;
				globalpoint2 = localToGlobal(globalpoint2);
				_player2.y --;
				_jumping2 = false;
				_onGround = true;
				
			}
			while (_obstacle.hitTestPoint(globalpoint.x + 24, globalpoint.y -86, true) || _obstacle2.hitTestPoint(globalpoint.x + 24, globalpoint.y -86, true))
			{
				globalpoint.x = _player1.x
				globalpoint.y= _player1.y;
				globalpoint = localToGlobal(globalpoint);
				_player1.x--;
			}
			while (_obstacle.hitTestPoint(globalpoint2.x + 24, globalpoint2.y -86, true) || _obstacle2.hitTestPoint(globalpoint2.x + 24, globalpoint2.y -86, true))
			{
				globalpoint2.x = _player2.x
				globalpoint2.y= _player2.y;
				globalpoint2 = localToGlobal(globalpoint2);
				_player2.x--;
			}
			
			var bottomPoint : Point = new Point(globalpoint2.x, globalpoint2.y);
			var headPoint : Point = new Point(globalpoint.x, globalpoint.y - _player1.height +10);
			/*trace("Head X: " + headPoint.x + "/ Y: " + headPoint.y);
			trace("Bottom X: " + bottomPoint.x + "/ Y: " + bottomPoint.y);*/
			
			var counter3:int = 0;
			
			while (counter3 < 1000 && _player2.hitTestPoint(headPoint.x,headPoint.y,false)&& !_onGround) {
				counter3 ++;
				globalpoint2.x = _player2.x
				globalpoint2.y= _player2.y;
				_player2.y -= _gravity;
				_jumping2 = false;
				_player1.anim(4);
				
			}
			
			_player1.y += _gravity;
			_player2.y += _gravity;
			
			_player1.y -= jumpForce1;
			_player2.y -= jumpForce2;
			
			if (_jumpPressed1 && !_jumping1)
			{
				_jumping1 = true;
				jumpForce1 = 13;
			}
			else if (jumpForce1 > 0)
			{
				jumpForce1-= 1;
			}
			
			else if (_jumpPressed2 && !_jumping2)
			{
				_jumping2 = true;
				jumpForce2 = 17;
			}
			else if (jumpForce2 > 0)
			{
				jumpForce2-= 1;
			}
			
			if (_moving1 == true) {
				_player1.x += P1x;
			} else {
				_player1.x += 0;
			}
			if (_moving2 == true) {
				_player2.x += P2x;
			} else {
				_player2.x += 0;
			}
			
			if (_player1.x <= 10 || _player2.x <= 10) {
				_player1.x ++;
				_player2.x ++;
			}
			
			//trace(jumpForce2);
		}
		
		private function keyUp(e:KeyboardEvent):void 
		{
				_player1.anim(0);
				_player2.anim(0);
			if(e.keyCode == 39){
				_moving1 = false;
				_player1.anim(0);
			}
			else if(e.keyCode == 37){
				_moving2 = false;
				_player2.anim(0);
			}
			
			else if(e.keyCode == 38){
				_jumpPressed1 = false;
				_player1.anim(0);
			}
			else if(e.keyCode == 40){
				_jumpPressed2 = false;
				_player2.anim(0);
			}
		}
		
		private function keyDown(e:KeyboardEvent):void 
		{
			var counter:int = 0;
			counter ++;
			//trace (counter);
			if(e.keyCode == 39){
				_moving1 = true;
				_player1.anim(2);
			}
			if(e.keyCode == 38){
				_jumpPressed1 = true;
				jumpForce2 = 0;
				_player1.anim(1);
			}
			if(e.keyCode == 37){
				_moving2 = true;
				_player2.anim(2)
			}
			if(e.keyCode == 40){
				_jumpPressed2 = true;
				jumpForce1 = 0;
				_player2.anim(1);
			}
			if(e.keyCode == 32){
				respawn1();
			}
		}
		
		private function respawn1():void
		{
			_player1.x = 180;
			_player1.y = 200;
			
			_player2.x = 90;
			_player2.y = 200;
		}
		
		
	}

}