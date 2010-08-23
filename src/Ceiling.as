package
{
  import net.flashpunk.*;
  	import net.flashpunk.graphics.*;

  public class Ceiling extends Entity
  {
    public function Ceiling()
    {
      super();
      type = "Wall";
      width = MainWorld.WIDTH+Main.VIEWPORT_WIDTH;
      height = Main.HALF_VIEWPORT_HEIGHT;
      x = -Main.HALF_VIEWPORT_WIDTH;
      y = -Main.HALF_VIEWPORT_HEIGHT;
    }
    
    override public function update():void
    {
      super.update();
      if (collide("Player", x, y))
      {
        Player.instance.allowMoveUp = false;
      } 
      else 
      {
        Player.instance.allowMoveUp = true;
      }
    }
  }
}
