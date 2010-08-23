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
      
      FP.screen.color = 0xfdfdff;
      
      fadeTween.tween(playerImage, 'alpha', 1.0, 1, Ease.cubeIn);
      femaleEntryTween.tween(femaleAngler, 'x',80, 3, Ease.cubeIn);
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
