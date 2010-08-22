package
{
  import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import flash.geom.*;
	import net.flashpunk.utils.*;
	
  public class HolePunch extends Entity
  {
    [Embed(source="../assets/light.png")]private var LightImageClass:Class;

    private var darkness:Image;
    private var light:Image;
    private var light_sources:Array;

    public function HolePunch(sources:Array)
    {
      light = new Image(LightImageClass);
      
      light_sources = sources;
      darkness = Image.createRect(FP.width, FP.height, 0xcc000000);
      
      darkness.scrollX = darkness.scrollY = 0;
      darkness.blend = "multiply";

      light = new Image(LightImageClass);
      light.scaleX = 9;
      light.scaleY = 9;
      light.blend = "screen";
      
    }
    
    override public function render():void {
      //darkness.fill(0xcc000000);
//      var source_obj:FlxSprite = light_sources[0];
//      var screenXY:FlxPoint = source_obj.getScreenXY();
//
//      darkness.draw(light,
//        screenXY.x + 200,
//        screenXY.y + 75);
      darkness = Image.createRect(FP.width, FP.height, 0xcc000000);
      for (var i:Number=0; i<light_sources.length;i++){
        var source_obj:Entity = light_sources[i];
        var screenXY:Point = new Point(source_obj.x, source_obj.y);
        darkness.render(screenXY, FP.camera);
      }
      super.render();
    }
  }
}