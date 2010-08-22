package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
  import flash.geom.*;
  import net.flashpunk.tweens.misc.*;
  
  public class DeathWorld extends World
  {
    [Embed(source = '../assets/male_angler.png')]
    private const PlayerImage:Class;

    public var femaleAngler:FemaleAngler;
    public var player:Entity;
    private var ticks:Number = 0;
    
    public function DeathWorld()
    {
      var textEnt:Entity = new Entity();
      Text.size = 16;
      var text:Text = new Text("You slowly dissolve into reproductive bliss as you die.");
      textEnt.graphic = text;
      textEnt.x = 10;
      textEnt.y = 40;
      text.color = 0xfff0f0;
      add(textEnt);   
    }

    override public function update():void
    {
      super.update();
      FP.screen.color = 0x330000;
      ticks += FP.elapsed;
      if (ticks > 5) {
        FP.world = Main.mainWorld;
        ticks = 0;
      }
    }
  }
}
