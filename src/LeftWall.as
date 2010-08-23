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
      var leftTilemap:Tilemap = new Tilemap(TILEMAP_IMAGE, Main.HALF_VIEWPORT_WIDTH, MainWorld.HEIGHT, 16, 16);
      x = -Main.HALF_VIEWPORT_WIDTH;
      y = 0;
      leftTilemap.setRegion(0, 0, Main.HALF_VIEWPORT_WIDTH/16, MainWorld.HEIGHT/16, 0);
      graphic = leftTilemap;
      width = Main.HALF_VIEWPORT_WIDTH;
      height = MainWorld.HEIGHT;
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
