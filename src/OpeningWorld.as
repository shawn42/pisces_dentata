package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
  import flash.geom.*;
  import net.flashpunk.tweens.misc.*;
  	import net.flashpunk.utils.*;
  	
  public class OpeningWorld extends World
  {
//    [Embed(source = '../assets/AmbientBeat1.mp3')]
//    private const AmbientMusic:Class;
    [Embed(source = '../assets/male_angler.png')]
    private const PlayerImage:Class;

    public var femaleAngler:FemaleAngler;
    public var player:Entity;
    private var ticks:Number = 0;
    public var femaleEntryTween:VarTween = new VarTween();
    public var fadeTween:VarTween = new VarTween();
    
    public function OpeningWorld()
    {
//      var music:Sfx = new Sfx(AmbientMusic);
//      music.loop();

      femaleAngler = new FemaleAngler(Main.VIEWPORT_WIDTH, Main.VIEWPORT_HEIGHT/2.5);
      femaleAngler.flip(true);
      
      var playerImage:Image = new Image(PlayerImage);
      playerImage.flipped = true;
      playerImage.alpha = 0.0;
      player = new Entity(80,  Main.VIEWPORT_HEIGHT/1.7, playerImage);
      var textEnt:Entity = new Entity();
      Text.size = 32;
      var text:Text = new Text("Pisces Dentata");
      textEnt.graphic = text;
      textEnt.x = 20;
      textEnt.y = 20;
      text.color = 0;
      add(textEnt);

      var textEnt2:Entity = new Entity();
      Text.size = 16;
      var text2:Text = new Text("Reject the male anglerfish way of life! Use the females to kill predators. Don't mate!");
      textEnt2.graphic = text2;
      textEnt2.x = 10;
      textEnt2.y = 600;
      text2.color = 0;
      add(textEnt2);
      
      FP.screen.color = 0xfdfdff;
      
      fadeTween.tween(playerImage, 'alpha', 1.0, 1, Ease.quadIn);
      femaleEntryTween.tween(femaleAngler, 'x',200, 3, Ease.expoIn);
    }

    override public function update():void
    { 
      if (Input.pressed(Key.ANY)) {
        FP.world = Main.mainWorld;
      }
      super.update();
      
      ticks += FP.elapsed;
      if (ticks > 1 && count < 2) {
        add(player);
        addTween(fadeTween);
      } else if (ticks > 3 && count == 2) {
        add(femaleAngler);
        addTween(femaleEntryTween);
      } else if (ticks > 6) {
        FP.world = Main.mainWorld;
      }
    }
  }
}
