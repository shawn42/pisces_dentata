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
      width = 1664;
      height = 240;
      x = -320;
      y = -240;
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
