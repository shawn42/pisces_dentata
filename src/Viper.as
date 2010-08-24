package
{
  import net.flashpunk.*;
  import net.flashpunk.graphics.*;
  import flash.geom.*;
  import net.flashpunk.masks.*;

  public class Viper extends Enemy
  {
    [Embed(source = '../assets/viper.png')]
    private const IMAGE:Class;
    [Embed(source = '../assets/viper_mask.png')]
    private const MASK:Class;

    private const ATTACK_RADIUS:Number = 150;
    private const SPEED:Number = 30;
    private const WANDER_THRESHOLD:Number = 20;
    private var chasingPlayer:Boolean = false;
    private var spritemap:Spritemap;
    private var wanderTo:Point;
    
    public function Viper(x_pos:Number, y_pos:Number)
    {
      type = "Enemy";
      spritemap = new Spritemap(IMAGE, 172, 116);
      spritemap.add("Wiggle", [0,1], 6, true);
      graphic = spritemap;
      mask = new Pixelmask(MASK);
      x = x_pos;
      y = y_pos;
      wanderTo = new Point(x, y);
    }

    public function mouthX():Number
    {
      if (spritemap.flipped)
      {
        return x + width;
      }
      else
      {
        return x;
      }
    }

    public function mouthY():Number
    {
      return y;
    }

    override public function update():void
    {
      super.update();
      if (chasingPlayer)
      {
        spritemap.play("Wiggle");
        var pt:Point = new Point();
        FP.angleXY(pt, FP.angle(x, y, Player.instance.x, Player.instance.y), SPEED);
        var dx:Number = pt.x * FP.elapsed;
        x += dx;
        if (dx > 0 && Player.instance.x > (x+(width/2))) {
          spritemap.flipped = true;
        } else if (Player.instance.x < (x+(width/2))) {
          spritemap.flipped = false;
        }
        y += pt.y * FP.elapsed;
      }
      else if (FP.distance(mouthX(), mouthY(), Player.instance.x, Player.instance.y) < ATTACK_RADIUS)
      {
        chasingPlayer = true;
      }
      else
      {
        if (FP.distance(x, y, wanderTo.x, wanderTo.y) < WANDER_THRESHOLD)
        {
          wanderTo = new Point(FP.rand(MainWorld.WIDTH), FP.rand(MainWorld.WIDTH));
        }
        var pt2:Point = new Point();
        FP.angleXY(pt2, FP.angle(x, y, wanderTo.x, wanderTo.y), SPEED/2);
        var dx2:Number = pt2.x * FP.elapsed;
        x += dx2;
        if (dx2 > 0 && Player.instance.x > (x+(width/2))) {
          spritemap.flipped = true;
        } else if (Player.instance.x < (x+(width/2))) {
          spritemap.flipped = false;
        }
        y += pt2.y * FP.elapsed;
      }
    }
  }
}
