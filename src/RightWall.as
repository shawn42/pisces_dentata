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
      var rightTilemap:Tilemap = new Tilemap(TILEMAP_IMAGE, Main.HALF_VIEWPORT_WIDTH, MainWorld.HEIGHT, 64, 64);
      x = MainWorld.WIDTH;
      y = 0;
      rightTilemap.setRegion(0, 0, Main.HALF_VIEWPORT_WIDTH/64, MainWorld.HEIGHT/64, 0);
      graphic = rightTilemap;
      width = Main.HALF_VIEWPORT_WIDTH;
      height = MainWorld.HEIGHT;
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
