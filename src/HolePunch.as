package
{
  import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import flash.geom.*;
	import net.flashpunk.utils.*;
	import flash.display.BitmapData;
	
  public class HolePunch extends Entity
  {
    [Embed(source="../assets/light.png")] private var LightImageClass:Class;
    [Embed(source="../assets/spot.png")] private var SpotImageClass:Class;

    private var darkness:Canvas;
    private var light:Image;
    private var spot:Image;
    private var light_sources:Array;
    private var xOffset:Number;
    private var yOffset:Number;

    public function HolePunch(sources:Array)
    {
      light_sources = sources;
      darkness = new Canvas(FP.width, FP.height);
      darkness.fill(new Rectangle(0,0,FP.width, FP.height), 0x1a1a1a);
      darkness.scrollX = darkness.scrollY = 0;
      darkness.blend = "multiply";

      light = new Image(LightImageClass);
      light.scaleX = 1;
      light.scaleY = 1;
      light.blend = "screen";
      
      spot = new Image(SpotImageClass);
      spot.scaleX = 1;
      spot.scaleY = 1;
      spot.blend = "add";
                                      
      xOffset = 140        
      yOffset = 40
      
    }
    
    override public function update():void {
      // TODO tweak these for a nice flicker effect
      xOffset += (Math.random()*20 - 10) * FP.elapsed;
      yOffset += (Math.random()*20 - 10) * FP.elapsed;
    }
                                                       
    override public function render():void {
      super.render();
      darkness.fill(new Rectangle(0,0,FP.width, FP.height), 0x1a1a1a);
      var tx:Number = 0.0;
      var ty:Number = 0.0;
      for (var i:Number=0; i<light_sources.length;i++){                                         
        var source_obj:Entity = light_sources[i];
        tx = source_obj.x-FP.camera.x-source_obj.width/2+xOffset;
        ty = source_obj.y-FP.camera.y-source_obj.height/2-yOffset;  
        darkness.drawGraphic(tx, ty, light);
        spot.render(new Point(source_obj.x-source_obj.width/2+xOffset,source_obj.y-source_obj.height/2-yOffset), FP.camera);
      }
                                                                                          
      darkness.render(new Point(0,0), FP.camera); 
    }
  }
}