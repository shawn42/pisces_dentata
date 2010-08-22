package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.utils.*;
  import net.flashpunk.masks.*;
  import flash.geom.*;

  public class Player extends Entity
  {
    [Embed(source = '../assets/fish_growl.mp3')]
    private const FishGrowlSnd:Class;
    [Embed(source = '../assets/male_angler.png')]
    private const IMAGE:Class;
    [Embed(source = '../assets/male_angler_mask.png')]
    private const MASK:Class;

    public var allowMoveUp:Boolean = true;
    public var allowMoveDown:Boolean = true;
    public var allowMoveLeft:Boolean = true;
    public var allowMoveRight:Boolean = true;
    
    private var followSpeed:Number = 0.9;

    public static var instance:Player;
    
    public function Player()
    {
      var image:Image = new Image(IMAGE);
      var pixelmask:Pixelmask = new Pixelmask(MASK);
      mask = pixelmask;
      graphic = image;
      type = "Player";
      width = image.width;
      height = image.height;
      instance = this;
    } 

    override public function update():void
    {
      var followVelocity:Point = new Point(
        followSpeed * (Input.mouseX - FP.width / 2),
        followSpeed * (Input.mouseY - FP.height / 2)
      );
      var dx:Number = followVelocity.x * FP.elapsed;
      var dy:Number = followVelocity.y * FP.elapsed;
      if ((dx > 0 && allowMoveRight) || (dx < 0 && allowMoveLeft)) 
      {
        x += dx;
      }

      if ((dy > 0 && allowMoveDown) || (dy < 0 && allowMoveUp)) 
      {
        y += dy;
      }
      
      var femaleAngler:FemaleAngler = collide("FemaleAngler", x, y) as FemaleAngler;
      if (femaleAngler)
      {
        var growl:Sfx = new Sfx(FishGrowlSnd);
        growl.play();
        FP.world.remove(this);
      }
    }
  }
}
