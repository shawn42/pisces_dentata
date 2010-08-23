package
{
  import net.flashpunk.*;
  import net.flashpunk.graphics.*;
  import net.flashpunk.masks.*;
  import flash.geom.*;

  public class Monkfish extends Enemy
  {
    [Embed(source = '../assets/monkfish.png')]
    private const IMAGE:Class;
    [Embed(source = '../assets/monkfish_mask.png')]
    private const MASK:Class;
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
      mask = new Pixelmask(MASK);
    }

    override public function update():void
    {
      super.update();
      if (chasingPlayer)
      {
        spritemap.frame = 2;
        var pt:Point = new Point();
        FP.angleXY(pt, FP.angle(x, y, Player.instance.x, Player.instance.y), SPEED);
        var dx:Number = pt.x * FP.elapsed;
        if (dx > 0 && Player.instance.x > (x+(width/2))) {
          x += dx;
          spritemap.flipped = false;
        } else if (Player.instance.x < (x+(width/2))) {
          x += dx;
          spritemap.flipped = true;
        }
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
