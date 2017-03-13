package state {
	
	import objs.basic.Character;
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import util.GFX;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Playstate extends FlxState {
		
		static private var gfx:GFX = GFX.self;
		
		private var ch:Character;
		
		override public function create():void {
			super.create();
			ch = new Character();
			add(ch);
			ch.recycle(10, 10, gfx._pl0_GFX);
		}
		
		override public function update():void {
			super.update();
			
			if (FlxG.keys.UP)
				ch.velocity.y = -50;
			else if (FlxG.keys.DOWN)
				ch.velocity.y = 50;
			else
				ch.velocity.y = 0;
				
			if (FlxG.keys.LEFT)
				ch.velocity.x = -50;
			else if (FlxG.keys.RIGHT)
				ch.velocity.x = 50;
			else
				ch.velocity.x = 0;
		}
	}
}
