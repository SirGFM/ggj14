package util {
	
	import org.flixel.FlxBasic;
	import org.flixel.FlxG;
	import org.flixel.FlxText;
	import org.flixel.FlxU;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Timer extends FlxBasic {
		
		private var label:FlxText;
		private var time:Number;
		
		public function Timer() {
			super();
			
			label = new FlxText(FlxG.width - 64, FlxG.height - 24, FlxG.width, "0:00.00");
			label.setFormat(null, 8, 0xffffff, null, 0xff9ba9b0);
			time = 0;
		}
		
		public function run():void {
			time += FlxG.elapsed;
			var str:String = "";
			
			var m:int = FlxU.floor(time / 60);
			var s:int = FlxU.floor(time) % 60;
			var r:int = ((time - s) * 100);
			
			str += m.toString();
			str += ":";
			if (s < 10)
				str += "0";
			str += s.toString();
			str += ".";
			if (r < 10)
				str += "0";
			str += r.toString();
			
			label.text = str;
		}
		
		override public function draw():void {
			label.draw();
		}
		
		public function get curTime():Number {
			return time;
		}
		public function get min():String {
			return label.text.split(":")[0];
		}
		public function get sec():String {
			return (label.text.split(":")[1] as String).split(".")[0];
		}
		public function milli():String {
			return label.text.split(".")[1];
		}
	}
}
