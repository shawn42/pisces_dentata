package
{
  import net.flashpunk.*;
  import net.flashpunk.graphics.*;
  import flash.geom.*;

  public class Monkfish extends Entity
  {
    [Embed(source = '../assets/monkfish.png')]
    private const IMAGE:Class;
    [Embed(source = '../assets/fish_growl.mp3')]
    private const FishGrowlSnd:Class;

    private const ATTACK_RADIUS:Number = 150;
    private const SPEED:Number = 20;
    private var spritemap:Spritemap;
    private var chasingPlayer:Boolean = false;
    
    public function Monkfish(x_pos:Number, y_pos:Number)
    {
      spritemap = new Spritemap(IMAGE, 128, 64);
      type = "Enemy";
      width = spritemap.width;
      height = spritemap.height;
      graphic = spritemap;
      x = x_pos;
      y = y_pos;
    }

    override public function update():void
    {
      super.update();
      if (chasingPlayer)
      {
        spritemap.frame = 2;
        var pt:Point = new Point();
        FP.angleXY(pt, FP.angle(x, y, Player.instance.x, Player.instance.y), SPEED);
        x += pt.x * FP.elapsed;
        y += pt.y * FP.elapsed;
      }
      else if (FP.distance(x, y, Player.instance.x, Player.instance.y) < ATTACK_RADIUS)
      {
        spritemap.frame = 1;
        var growl:Sfx = new Sfx(FishGrowlSnd);
        growl.play();
        chasingPlayer = true;
      }
    }
  }
}
