package util {
	import org.flixel.FlxG;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class SFX {
		
		static public var self:SFX = new SFX();
		
		public var sfxVolume:Number = 0.8;
		
		[Embed(source = "../../assets/sfx/thunder1.mp3")]		private var thunder:Class;
		
		public function playThunder():void {
			FlxG.loadSound(thunder, sfxVolume, false, false, true);
		}
	}
}
