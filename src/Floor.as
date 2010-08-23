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
      var floorTilemap:Tilemap = new Tilemap(TILEMAP_IMAGE, MainWorld.WIDTH+Main.VIEWPORT_WIDTH, Main.HALF_VIEWPORT_HEIGHT, 16, 16);
      floorTilemap.setRegion(0,0, (MainWorld.WIDTH+Main.VIEWPORT_WIDTH)/ 16, Main.HALF_VIEWPORT_HEIGHT/16, 0);
      graphic = floorTilemap;
      width = MainWorld.WIDTH+Main.VIEWPORT_WIDTH;
      height = Main.HALF_VIEWPORT_HEIGHT;
      x = -Main.HALF_VIEWPORT_WIDTH;
      y = MainWorld.HEIGHT;
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
