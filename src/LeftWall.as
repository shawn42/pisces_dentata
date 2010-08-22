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
      type = "Wall";
      var leftTilemap:Tilemap = new Tilemap(TILEMAP_IMAGE, 320, 1024, 16, 16);
      x = -320;
      y = 0;
      leftTilemap.setRegion(0, 0, 20, 64, 0);
      graphic = leftTilemap;
      width = 320;
      height = 1024;
    }

    override public function update():void
    {
      super.update();
      if (collide("Player", x, y))
      {
        Player.instance.allowMoveLeft = false;
      }
      else
      {
        Player.instance.allowMoveLeft = true;
      }
    }
  }
}
