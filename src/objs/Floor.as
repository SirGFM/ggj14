package objs {
	
	import org.flixel.FlxG;
	import org.flixel.FlxTilemap;
	import org.flixel.FlxU;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Floor extends FlxTilemap {
		
		public function Floor() {
			super();
			
			x = 0;
			y = FlxG.height - 32;
			
			var w:int = FlxG.width / 16 + 2;
			var i:int;
			var csv:String = "";
			
			i = 0;
			while (i < w) {
				csv += "0";
				i++;
				if (i < w)
					csv += ",";
			}
			csv += "\n";
			i = 0;
			while (i < w) {
				csv += "1";
				i++;
				if (i < w)
					csv += ",";
			}
			
			FlxG.watch(this.velocity, "x", "f-vx");
			FlxG.watch(this, "x", "f-x");
			loadMap(csv, gfx._tilesetGFX, 16, 16, OFF, 0, 0, 0);
		}
		
		override public function update():void {
			super.update();
			
			velocity.copyFrom(reg.velocity);
		}
		
		override public function draw():void {
			if (FlxU.abs(x) > _tileWidth) {
				x += _tileWidth;
			}
			super.draw();
		}
	}
}
