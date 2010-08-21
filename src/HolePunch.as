package
{
  import org.flixel.*;
  public class HolePunch extends FlxGroup
  {
    [Embed(source="../assets/light.png")]private var LightImageClass:Class;

    private var darkness:FlxSprite;
    private var light:FlxSprite;
    private var light_sources:Array;

    public function HolePunch(sources:Array)
    {
      light_sources = sources;
      darkness = new FlxSprite(0,0);
      darkness.createGraphic(FlxG.width, FlxG.height, 0xcc000000);
      darkness.scrollFactor.x = darkness.scrollFactor.y = 0;
      darkness.blend = "multiply";

      light = new FlxSprite(0,0,LightImageClass);
      light.scale = new FlxPoint(9,9);
      light.blend = "screen";
      
      add(darkness);
    }
    
    override public function render():void {

      darkness.fill(0xcc000000);
//      var source_obj:FlxSprite = light_sources[0];
//      var screenXY:FlxPoint = source_obj.getScreenXY();
//
//      darkness.draw(light,
//        screenXY.x + 200,
//        screenXY.y + 75);
      for (var i:Number=0; i<light_sources.length;i++){
        var source_obj:FlxSprite = light_sources[i];
        var screenXY:FlxPoint = source_obj.getScreenXY();
        darkness.draw(light,
          screenXY.x + 200,
          screenXY.y + 75);
      }
      super.render();
    }
  }
}