package
{
  import net.flashpunk.*;
  	import net.flashpunk.graphics.*;

  public class Floor extends Entity
  {
    [Embed(source = '../assets/floor.png')]
    private const TILEMAP_IMAGE:Class;

    public function Floor()
    {
      super();

      var floorTilemap:Tilemap = new Tilemap(TILEMAP_IMAGE, 1664, 240, 16, 16);
      floorTilemap.x = -320;
      floorTilemap.y = 1024;
      floorTilemap.setRegion(0,0, 104, 15,0);

      graphic = floorTilemap;
    }
    
    override public function update():void
    {
      super.update();
      var player:Player = collide("Player", x, y) as Player;
      if (player)
      {
        player.allowMoveDown = false;
      }
      else
      {
        player.allowMoveDown = true;
      }
    }

  }
}
