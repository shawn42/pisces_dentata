package
{
  import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import flash.geom.*;
	import net.flashpunk.utils.*;
	import flash.display.BitmapData;
	
  public class HolePunch extends Entity
  {
    [Embed(source="../assets/light.png")]private var LightImageClass:Class;

    private var darkness:Canvas;
    private var light:Image;
    private var light_sources:Array;
    private var xOffset:Number;
    private var yOffset:Number;

    public function HolePunch(sources:Array)
    {
      light = new Image(LightImageClass);
      
      light_sources = sources;
      darkness = new Canvas(FP.width, FP.height);
      darkness.fill(new Rectangle(0,0,FP.width, FP.height), 0xaa000000);
      
      darkness.scrollX = darkness.scrollY = 0;
      darkness.blend = "multiply";

      light = new Image(LightImageClass);
      light.scaleX = 9;
      light.scaleY = 9;
      light.blend = "screen";
      
      xOffset = Math.floor(Math.random() * (1+120-90)) + 90;
      yOffset = Math.floor(Math.random() * (1+90-70)) + 70;
      
    }
    
    override public function update():void {
      // TODO tweak these for a nice flicker effect
      xOffset += (Math.random()*100 - 50) * FP.elapsed;
      yOffset += (Math.random()*100 - 50) * FP.elapsed;
    }
    
    override public function render():void {
      super.render();
      darkness.fill(new Rectangle(0,0,FP.width, FP.height), 0xaa000000);
      
      for (var i:Number=0; i<light_sources.length;i++){
        var source_obj:Entity = light_sources[i];
        
        darkness.drawGraphic(source_obj.x-FP.camera.x-source_obj.width/2+xOffset,source_obj.x-FP.camera.y-source_obj.height/2-yOffset, light)
      }
 
      darkness.render(new Point(0,0), FP.camera);
 
    }
  }
}