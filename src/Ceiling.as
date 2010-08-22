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
      var player:Player = collide("Player", x, y) as Player;
      if (player)
      {
        player.allowMoveUp = false;
      } 
      else 
      {
        player.allowMoveUp = true;
      }
    }
  }
}
