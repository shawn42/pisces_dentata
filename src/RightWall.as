package
{
  import net.flashpunk.*;
  	import net.flashpunk.graphics.*;

  public class RightWall extends Entity
  {
    [Embed(source = '../assets/floor.png')]
    private const TILEMAP_IMAGE:Class;

    public function RightWall()
    {
      super();
      var rightTilemap:Tilemap = new Tilemap(TILEMAP_IMAGE, 320, 1024, 16, 16);
      rightTilemap.x = 1024;
      rightTilemap.y = 0;
      rightTilemap.setRegion(0,0, 20, 64,0);
      graphic = rightTilemap;
    }
    
    override public function update():void
    {
      super.update();
      var player:Player = collide("Player", x, y) as Player;
      if (player)
      {
        player.allowMoveRight = false;
      }
      else
      {
        player.allowMoveRight = true;
      }
    }

  }
}
