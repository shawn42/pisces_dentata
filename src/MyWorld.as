package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
  import flash.geom.*;

  public class MyWorld extends World
  {
    public var player:Player;
    public var backdrop:MyBackdrop;
    public var femaleAngler:FemaleAngler;
    public var tilemap:Tilemap;

    [Embed(source = '../assets/floor.png')]
    private const TILEMAP_IMAGE:Class;

    public function MyWorld()
    {
      backdrop = new MyBackdrop();
      var backdropEntity:Entity = new Entity();
      backdropEntity.graphic = backdrop;
      add(backdropEntity);
    
      tilemap = new Tilemap(TILEMAP_IMAGE, 320, 1000, 16, 16);
      tilemap.x = -320;
      tilemap.y = 0;
      var tilemapEntity:Entity = new Entity();
      tilemapEntity.graphic = tilemap;
      /*add(tilemapEntity);*/

      add(femaleAngler = new FemaleAngler());
      player = new Player();
      player.x = 200;
      player.y = 200;
      add(player);
    }

    override public function update():void
    {
      super.update();
      FP.camera = new Point(player.x - (FP.width - player.width) / 2, player.y - (FP.height - player.height) / 2);
    }
  }
}
