package util {
	import org.flixel.FlxPoint;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Registry {
		
		static public var self:Registry = new Registry();
		
		public var velocity:FlxPoint = new FlxPoint();
		
		// loop the screen each 8 seconds
		public var walkSpeed:Number;
		// runs at twice the walk speed
		public var runSpeed:Number;
		public var timeDif:Number;
		public var isRunning:Boolean;
		
		public var justThunder:Boolean;
		public var isThunder:Boolean;
		
		public var bar:Bar;
		public var timer:Timer;
		
		public function Registry() {
			walkSpeed = 160 / 5;
			runSpeed = 160 / 2;
			timeDif = 2 / 5;
			
			isRunning = false;
			justThunder = false;
			isThunder = false;
		}
		
		public function displayGoLeftBalloon():void {
			
		}
		
		public function reset():void {
			velocity.make();
		}
	}
}
