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
<<<<<<< HEAD
      var speed:Number = 0.2;
      velocity = new Point(
        speed * (Input.mouseX - FP.width / 2),
        speed * (Input.mouseY - FP.height / 2)
      );
      x += velocity.x * FP.elapsed;
      y += velocity.y * FP.elapsed;
=======
      var speed:Number = 0.9;
      x += speed * FP.elapsed * (Input.mouseX - FP.width / 2);
      y += speed * FP.elapsed * (Input.mouseY - FP.height / 2);
>>>>>>> aef5eef8d76caba0f44551a5bb866095da12fca4
      var femaleAngler:FemaleAngler = collide("FemaleAngler", x, y) as FemaleAngler;
      if (femaleAngler)
      {
        FP.world.remove(this);
      }
    }
  }
}
