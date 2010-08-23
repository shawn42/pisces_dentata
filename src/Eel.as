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
    private const SPEED:Number = 30;
    private var chasingPlayer:Boolean = false;
    private var spritemap:Spritemap;
    
    public function Eel(x_pos:Number, y_pos:Number)
    {
      type = "Enemy";
      spritemap = new Spritemap(IMAGE, 297, 56);
      spritemap.add("Wiggle", [0,1,2,1], 0.15, true);
      graphic = spritemap;
      mask = new Pixelmask(MASK);
      x = x_pos;
      y = y_pos;
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
      else if (FP.distance(x, y, Player.instance.x, Player.instance.y) < ATTACK_RADIUS)
      {
        var zappy:Sfx = new Sfx(ZappySnd);
        zappy.play();
        chasingPlayer = true;
      }
    }
  }
}