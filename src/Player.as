package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.utils.*;
  import net.flashpunk.masks.*;

  public class Player extends Entity
  {
    [Embed(source = '../assets/male_angler.png')]
    private const IMAGE:Class;
    [Embed(source = '../assets/male_angler_mask.png')]
    private const MASK:Class;

    public var velocity:Point = new Point();

    public function Player()
    {
      var image:Image = new Image(IMAGE);
      var pixelmask:Pixelmask = new Pixelmask(MASK);
      mask = pixelmask;
      graphic = image;
      type = "Player";
      width = image.width;
      height = image.height;
    } 

    override public function update():void
    {
      var speed:Number = 0.2;
      velocity = new Point(
        speed * (Input.mouseX - FP.width / 2),
        speed * (Input.mouseY - FP.height / 2)
      );
      x += velocity.x * FP.elapsed;
      y += velocity.y * FP.elapsed;
      var femaleAngler:FemaleAngler = collide("FemaleAngler", x, y) as FemaleAngler;
      if (femaleAngler)
      {
        FP.world.remove(this);
      }
    }
  }
}
