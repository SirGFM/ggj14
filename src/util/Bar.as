package util {
	
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Bar extends FlxSprite {
		
		private var inbar:FlxSprite;
		public var val:Number = 100;
		private var lastVal:int = 100;
		
		public function Bar() {
			super(10, 10);
			makeGraphic(FlxG.width - 16 - 4, 16 - 4, 0xffcbb277);
			
			inbar = new FlxSprite(8, 8);
			inbar.makeGraphic(FlxG.width - 16, 16, 0);
			inbar.drawLine(0, 0, inbar.width, 0, 0xffae8657);
			inbar.drawLine(0, 0, 0, 15, 0xffae8657);
			inbar.drawLine(0, 15, inbar.width-1, 15, 0xffae8657);
			inbar.drawLine(inbar.width-1, 0, inbar.width-1, 16, 0xffae8657);
		}
		
		override public function update():void {
			super.update();
			
			if (lastVal != FlxU.floor(val)) {
				frameWidth = width * (val / 100);
				resetHelpers();
				lastVal = val;
			}
		}
		
		override public function draw():void {
			inbar.draw();
			super.draw();
		}
	}
}
