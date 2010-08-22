package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
  import flash.geom.*;
  import 	net.flashpunk.tweens.misc.*;
  
  public class OpeningWorld extends World
  {
//    [Embed(source = '../assets/AmbientBeat1.mp3')]
//    private const AmbientMusic:Class;
    [Embed(source = '../assets/male_angler.png')]
    private const PlayerImage:Class;

    public var femaleAngler:FemaleAngler;
    public var player:Entity;
    private var ticks:Number = 0;
    
    public function OpeningWorld()
    {
//      var music:Sfx = new Sfx(AmbientMusic);
//      music.loop();

      femaleAngler = new FemaleAngler(320, 200);
      femaleAngler.flip(true);
      
      var playerImage:Image = new Image(PlayerImage);
      playerImage.flipped = true;
      player = new Entity(80, 300, playerImage);
      
      var textEnt:Entity = new Entity();
      Text.size = 32;
      var text:Text = new Text("Piscis Dentata");
      textEnt.graphic = text;
      textEnt.x = 20;
      textEnt.y = 20;
      text.color = 0;
      add(textEnt);
      
      FP.screen.color = 0xfdfdff;
      //FP.camera = new Point(0,0);
    }

    override public function update():void
    {
      super.update();
      
      ticks += FP.elapsed;
      if (ticks > 1 && count < 2) {
        add(player);
      } else if (ticks > 3 && count == 2) {
        add(femaleAngler);
      } else if (ticks > 8) {
        FP.world = Main.mainWorld;
      }
    }
  }
}
