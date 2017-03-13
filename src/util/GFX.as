package util {
	
	/**
	 * ...
	 * @author GFM
	 */
	public class GFX {
		
		static public const self:GFX = new GFX();
		
		//[Embed(source = "../../assets/gfx/players/single-frame.png")]		public var _playerGFX:Class;
		[Embed(source = "../../assets/gfx/players/player.png")]				public var _playerGFX:Class;
		[Embed(source = "../../assets/gfx/players/glasses.png")]			public var _shadesGFX:Class;
		
		[Embed(source = "../../assets/gfx/tileset.png")]		public var _tilesetGFX:Class;
		[Embed(source = "../../assets/gfx/building.png")]		public var _buildingGFX:Class;
		[Embed(source = "../../assets/gfx/house.png")]			public var _houseGFX:Class;
		
		[Embed(source = "../../assets/gfx/outdoors/burguer.png")]		public var _burguerGFX:Class;
		
		// unused
		[Embed(source = "../../assets/gfx/players/pl0.png")]	public var _pl0_GFX:Class;
	}
}
