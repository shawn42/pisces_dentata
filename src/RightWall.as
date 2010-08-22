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
      type = "Wall";
      var rightTilemap:Tilemap = new Tilemap(TILEMAP_IMAGE, 320, 1024, 16, 16);
      x = 1024;
      y = 0;
      rightTilemap.setRegion(0,0, 20, 64,0);
      graphic = rightTilemap;
      width = 320;
      height = 1024;
    }
    
    override public function update():void
    {
      super.update();
      if (collide("Player", x, y))
      {
        Player.instance.allowMoveRight = false;
      }
      else
      {
        Player.instance.allowMoveRight = true;
      }
    }

  }
}
