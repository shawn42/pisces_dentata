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
      type = "Wall";
      var floorTilemap:Tilemap = new Tilemap(TILEMAP_IMAGE, 1664, 240, 16, 16);
      floorTilemap.setRegion(0,0, 104, 15,0);
      graphic = floorTilemap;
      width = 1664;
      height = 240;
      x = -320;
      y = 1024;
    }
    
    override public function update():void
    {
      super.update();
      if (collide("Player", x, y))
      {
        Player.instance.allowMoveDown = false;
      }
      else
      {
        Player.instance.allowMoveDown = true;
      }
    }

  }
}
