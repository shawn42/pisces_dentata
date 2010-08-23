package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.utils.*;
  import net.flashpunk.masks.*;

  public class FemaleAngler extends Entity
  {
    [Embed(source = '../assets/female_angler.png')]
    private const IMAGE:Class;
    [Embed(source = '../assets/female_angler_mask.png')]
    private const MASK:Class;

    private var image:Image;
    
    public function FemaleAngler(initX:Number,initY:Number)
    {
      image = new Image(IMAGE);
      var pixelmask:Pixelmask = new Pixelmask(MASK);
      mask = pixelmask;
      graphic = image;
      //flip(FP.rand(2) == 1);
      type = "FemaleAngler";
      width = image.width;
      height = image.height;
      x = initX;
      y = initY;
    } 
    
    public function flip(flipped:Boolean):void {
      image.flipped = flipped;
    }

    /*override public function update():void*/
    /*{*/
    /*  var speed:Number = 0.01;*/
    /*  x += speed * FP.elapsed * (Input.mouseX - FP.width / 2);*/
    /*  y += speed * FP.elapsed * (Input.mouseY - FP.height / 2);*/
    /*}*/
  }
}

