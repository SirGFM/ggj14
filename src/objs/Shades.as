package objs {
	
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Shades extends FlxSprite {
		
		public function Shades() {
			super(FlxG.width, FlxG.height - 16);
			
			loadGraphic(gfx._shadesGFX);
			y -= height;
		}
		
		override public function update():void {
			super.update();
			
			velocity.copyFrom(reg.velocity);
		}
	}
}
