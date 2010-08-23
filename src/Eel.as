package
{
  import net.flashpunk.*;
  import net.flashpunk.graphics.*;
  import flash.geom.*;
  import net.flashpunk.masks.*;

  public class Eel extends Entity
  {
    [Embed(source = '../assets/eel.png')]
    private const IMAGE:Class;
    [Embed(source = '../assets/eel_mask.png')]
    private const MASK:Class;
    
    [Embed(source = '../assets/zappy.mp3')]
    private const ZappySnd:Class;

    private const ATTACK_RADIUS:Number = 150;
    private const SPEED:Number = 20;
    private var chasingPlayer:Boolean = false;
    
    public function Eel(x_pos:Number, y_pos:Number)
    {
      type = "Enemy";
      graphic = new Image(IMAGE);
      mask = new Pixelmask(MASK);
      x = x_pos;
      y = y_pos;
    }

    override public function update():void
    {
      super.update();
      if (chasingPlayer)
      {
        var pt:Point = new Point();
        FP.angleXY(pt, FP.angle(x, y, Player.instance.x, Player.instance.y), SPEED);
        x += pt.x * FP.elapsed;
        y += pt.y * FP.elapsed;
      }
      else if (FP.distance(x, y, Player.instance.x, Player.instance.y) < ATTACK_RADIUS)
      {
        var zappy:Sfx = new Sfx(ZappySnd);
        zappy.play();
        chasingPlayer = true;
      }
    }
  }
}
