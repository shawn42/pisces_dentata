package
{
  import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import flash.geom.*;
	import net.flashpunk.utils.*;
	import flash.display.BitmapData;
	
  public class HolePunch extends Entity
  {
    [Embed(source="../assets/light.png")] private const LightImageClass:Class;
    [Embed(source="../assets/spot.png")] private const SpotImageClass:Class;
    [Embed(source="../assets/male_spot.png")] private const MaleSpotImageClass:Class;

    public static var darkness:Canvas;
    private var light:Image;
    private var spot:Image;
    private var maleSpot:Image;
    private var light_sources:Array;
    private var xOffset:Number;
    private var yOffset:Number;

    public function HolePunch(sources:Array)
    {
      light_sources = sources;
      darkness = new Canvas(FP.width, FP.height);
      darkness.fill(new Rectangle(0,0,FP.width, FP.height), 0x202020);
      darkness.scrollX = darkness.scrollY = 0;
      darkness.blend = "multiply";

      light = new Image(LightImageClass);
      light.blend = "screen";
      
      spot = new Image(SpotImageClass);
      spot.blend = "add";      

      maleSpot = new Image(MaleSpotImageClass);
      maleSpot.blend = "screen";
    }
                                                       
    override public function render():void {
      super.render();
      darkness.fill(new Rectangle(0,0,FP.width, FP.height), 0x202020);
      var p:Player = Player.instance;
      darkness.drawGraphic(p.x-FP.camera.x-(maleSpot.width/2)+(p.width/2),  p.y-FP.camera.y-(maleSpot.height/2)+(p.height/2), maleSpot);
      var tx:Number = 0.0;
      var ty:Number = 0.0;
      for (var i:Number=0; i<light_sources.length;i++){                                         
        var source_obj:Entity = light_sources[i];
        darkness.drawGraphic(
          source_obj.x-FP.camera.x-source_obj.width/2+140+(Math.random()*4 - 2),
          source_obj.y-FP.camera.y-source_obj.height/2-40+(Math.random()*4 - 2), light);
        spot.render(new Point(
          source_obj.x+source_obj.width-72,
          source_obj.y-source_obj.height/2+132), FP.camera);
      }
                                                                                          
      darkness.render(new Point(0,0), FP.camera); 
    }
  }
}