package game.players 
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Player2 extends Sprite 
	{
		private var _player2Idle:Player2Idle;
		private var _player2Jump:Player2Jump;
		private var _player2Walk:Player2Walk;
		private var _player2Push:Player2Push;
		private var _player2Death:Player2Death;
		private var _player2Balance:Player2Balance;
		
		public function Player2() 
		{
			_player2Idle = new Player2Idle();
			addChild(_player2Idle);
			_player2Idle.visible = true;
			
			_player2Jump = new Player2Jump();
			addChild(_player2Jump);
			_player2Jump.visible = false;
			
			_player2Walk = new Player2Walk();
			addChild(_player2Walk);
			_player2Walk.visible = false;
			
			_player2Push = new Player2Push();
			addChild(_player2Push);
			_player2Push.visible = false;
			
			_player2Death = new Player2Death();
			addChild(_player2Death);
			_player2Death.visible = false;
			
			_player2Balance = new Player2Balance();
			addChild(_player2Balance);
			_player2Balance.visible = false;
			
			
		}
		
		public function anim(animNr:Number) :void
		{
			if (animNr == 0) {
				_player2Idle.visible = true;
				_player2Jump.visible = false;
				_player2Walk.visible = false;
				_player2Push.visible = false;
				_player2Death.visible = false;
				_player2Balance.visible = false;
			}
			else if (animNr == 1) {
				_player2Idle.visible = false;
				_player2Jump.visible = true;
				_player2Walk.visible = false;
				_player2Push.visible = false;
				_player2Death.visible = false;
				_player2Balance.visible = false;
			}
			else if (animNr == 2) {
				_player2Idle.visible = false;
				_player2Jump.visible = false;
				_player2Walk.visible = true;
				_player2Push.visible = false;
				_player2Death.visible = false;
				_player2Balance.visible = false;
			}
			else if (animNr == 3) {
				_player2Idle.visible = false;
				_player2Jump.visible = false;
				_player2Walk.visible = false;
				_player2Push.visible = true;
				_player2Death.visible = false;
				_player2Balance.visible = false;
			}
			
			else if (animNr == 4) {
				_player2Idle.visible = false;
				_player2Jump.visible = false;
				_player2Walk.visible = false;
				_player2Push.visible = false;
				_player2Death.visible = true;
				_player2Balance.visible = false;
			}
			
			else if (animNr == 5) {
				_player2Idle.visible = false;
				_player2Jump.visible = false;
				_player2Walk.visible = false;
				_player2Push.visible = false;
				_player2Death.visible = false;
				_player2Balance.visible = true;
			}
		}
		
	}

}