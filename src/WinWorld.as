package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
  import flash.geom.*;
  import net.flashpunk.tweens.misc.*;
  
  public class WinWorld extends World
  {
    private var ticks:Number = 0;
    private var text:Text;
    private var textEnt:Entity;
    
    public function WinWorld()
    {
      textEnt = new Entity();
      Text.size = 16;
      text = new Text("You win.",0,0,640,0);
      textEnt.graphic = text;
      textEnt.x = 10;
      textEnt.y = 40;
      text.color = 0xfff0f0;
      add(textEnt);   
    }

    public function setMessage(message:String):void {
      text.text = message;
    }
    
    override public function update():void
    {
      super.update();
      FP.screen.color = 0x000033;
      ticks += FP.elapsed;
      if (ticks > 5) {
        Main.mainWorld = new MainWorld();
        FP.world = Main.openingWorld;
        ticks = 0;
      }
    }
  }
}
