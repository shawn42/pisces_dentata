package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.utils.*;
  import net.flashpunk.masks.*;

  public class Player extends Entity
  {
    [Embed(source = '../assets/fish_growl.mp3')]
    private const FishGrowlSnd:Class;

    [Embed(source = '../assets/male_angler.png')]
    private const IMAGE:Class;
    [Embed(source = '../assets/male_angler_mask.png')]
    private const MASK:Class;

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
      var speed:Number = 0.9;
      x += speed * FP.elapsed * (Input.mouseX - FP.width / 2);
      y += speed * FP.elapsed * (Input.mouseY - FP.height / 2);
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
