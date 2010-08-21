
package
{
	import org.flixel.*;

  public class Background extends FlxSprite
  {
    [Embed(source = '../assets/sea_background.png')]private var SeaBackgroundImg:Class;

    public function Background() 
    {
      super(0,0,SeaBackgroundImg);
    } 

    override public function update():void
    {
      super.update();
      x = -FlxG.scroll.x
      y = -FlxG.scroll.y
    }
  }
}
