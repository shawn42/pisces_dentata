package
{
  import net.flashpunk.*;
  	import net.flashpunk.graphics.*;

  public class LeftWall extends Entity
  {
    [Embed(source = '../assets/floor.png')]
    private const TILEMAP_IMAGE:Class;

    public function LeftWall()
    {
      super();
      var tilemap:Tilemap = new Tilemap(TILEMAP_IMAGE, 320, 1024, 16, 16);
      tilemap.x = -320;
      tilemap.y = 0;
      tilemap.setRegion(0,0, 20, 64,0);
      graphic = tilemap;
    }

    override public function update():void
    {
      super.update();
      var player:Player = collide("Player", x, y) as Player;
      if (player)
      {
        player.allowMoveLeft = false;
      }
      else
      {
        player.allowMoveLeft = true;
      }
    }

  }
}
