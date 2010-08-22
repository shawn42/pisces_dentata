package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
  import flash.geom.*;
	import net.flashpunk.utils.*;

  public class MyWorld extends World
  {
    [Embed(source = '../assets/Ambient1.mp3')]
    private const AmbientMusic:Class;
    
    [Embed(source = '../assets/sediment_parts.png')]
    private const SedimentPartsImg:Class;

    public var player:Player;
    public var backdrop:MyBackdrop;
    
    public var females:Array;
    
    public var tilemap:Tilemap;
    private var _em:Emitter;

    public function MyWorld()
    {
      var music:Sfx = new Sfx(AmbientMusic);
      music.loop();
      backdrop = new MyBackdrop();
      var backdropEntity:Entity = new Entity();
      backdropEntity.graphic = backdrop;
      add(backdropEntity);
    
      var rightWall:RightWall = new RightWall();
      add(rightWall);
      var leftWall:LeftWall = new LeftWall();
      add(leftWall);
      var floor:Floor = new Floor();
      add(floor);
      var ceiling:Ceiling = new Ceiling();
      add(ceiling);

      females = new Array();
      var femaleAngler:FemaleAngler;
      add(femaleAngler = new FemaleAngler(400,400));
      females.push(femaleAngler);
      
      add(femaleAngler = new FemaleAngler(750,300));
      females.push(femaleAngler);
      
      player = new Player();
      player.x = 100;
      player.y = 100;
      add(player);
      
      
      _em = new Emitter(SedimentPartsImg, 5, 5);
			_em.newType("animated", [0, 1, 2]);
			_em.setAlpha("animated", 1, 0);
			_em.setMotion("animated", 0, 0, 0.4, 0, 5, 0.8, Ease.backIn);
      
      add(new HolePunch(females));
    }

    override public function update():void
    {
      super.update();
      while(_em.particleCount < 50) {
       _em.emit("animated", FP.rand(FP.width), FP.rand(FP.height));
       // _em.emit("animated", FP.screen.mouseX, FP.screen.mouseY);
      }
      
      FP.camera = new Point(player.x - (FP.width - player.width) / 2, player.y - (FP.height - player.height) / 2);
    }
    
    override public function render():void
    {
      super.render();
      _em.render(new Point, FP.camera);
    }
  }
}
