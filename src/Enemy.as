package
{
  import net.flashpunk.*;
  import net.flashpunk.graphics.*;
  import flash.geom.*;

  public class Enemy extends Entity
  {
    public var alive:Boolean;
    public function Enemy()
    {
      alive = true;
      type = "Enemy";
    }

    override public function update():void
    {
      super.update();
      var femaleAngler:FemaleAngler = collide("FemaleAngler", x, y) as FemaleAngler;
      if (femaleAngler)
      {
        alive = false;
        FP.world.remove(this);
      }
    }
  }
}
