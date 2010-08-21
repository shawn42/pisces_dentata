package
{
	import org.flixel.*;

  public class Player extends FlxSprite
  {
    [Embed(source = '../assets/male_angler.png')]private var MaleAnglerImg:Class;
    private var speed:Number = 0.8;

    public function Player(x:Number, y:Number) 
    {
      super(x,y,MaleAnglerImg);
    } 

    override public function update():void
    {
      var x_vel:Number = (FlxG.mouse.screenX - FlxG.width/2) * speed;
      var y_vel:Number = (FlxG.mouse.screenY - FlxG.height/2) * speed;
      
      velocity = new FlxPoint(x_vel,y_vel);

      super.update();
    }
  }
}
