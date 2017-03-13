package state {
	
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class GameOver extends FlxState {
		
		private var t1:FlxText;
		private var t2:FlxText;
		private var t3:FlxText;
		private var time:Number;
		
		override public function create():void {
			t1 = new FlxText(0, 24, 160, "After finding the shades of truth,");
			t1.setFormat(null, 8, 0xffffffff, "center", 0);
			t1.alpha = 0;
			t2 = new FlxText(0, 48, 160, "you survived for "+reg.timer.min+"min and "+reg.timer.sec+" sec.");
			t2.setFormat(null, 8, 0xffffffff, "center", 0);
			t2.alpha = 0;
			t3 = new FlxText(0, 80, 160, "Game Over");
			t3.setFormat(null, 16, 0xffffffff, "center", 0xff888888);
			t3.alpha = 0;
			
			time = 0;
			
			add(t1);
			add(t2);
			add(t3);
		}
		
		override public function update():void {
			var e:Number = FlxG.elapsed;
			
			t1.alpha += e;
			if (t1.alpha >= 1)
				t2.alpha += e;
			if (t2.alpha >= 1)
				t3.alpha += e;
			if (t3.alpha >= 1)
				time += e;
			if (time >= 3)
				FlxG.fade(0xff000000, 1, function():void { reg.isRunning = false; reg.isThunder = false; reg.justThunder = false; reg.timer = null; reg.bar = null; FlxG.switchState(new RealPlaystate()); } );
			
			super.update();
		}
	}
}
