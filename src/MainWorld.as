package
{
  import net.flashpunk.*;
	import net.flashpunk.debug.*;
	import net.flashpunk.graphics.*;
  import flash.geom.*;
	import net.flashpunk.utils.*;

  public class MainWorld extends World
  {
    [Embed(source = '../assets/Ambient1.mp3')]
    private const AmbientMusic:Class;
    
    [Embed(source = '../assets/sediment_parts1.png')]
    private const SedimentPartsImg:Class;

    [Embed(source = '../assets/sediment_parts.png')]
    private const OtherSedimentPartsImg:Class;
    
    public var player:Player;
    public var backdrop:MyBackdrop;
    
    public var females:Array;
    
    public var tilemap:Tilemap;
    private var sedimentEmitter:Emitter;
    private var sedimentEmitter2:Emitter;

    public function MainWorld()
    {
      	
      FP.randomizeSeed();
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
      females.push(femaleAngler = new FemaleAngler((Math.random()*570)+100,(Math.random()*600)+100));
      add(females[0]);
      
      var otherX:Number = (Math.random()*570)+100;
      var otherY:Number = (Math.random()*600)+100;
      while (FP.distanceRects(
        femaleAngler.x, femaleAngler.y, femaleAngler.width, femaleAngler.height,
        otherX, otherY, femaleAngler.width, femaleAngler.height) < 125)
      {
        otherX = (Math.random()*570)+100;
        otherY = (Math.random()*600)+100;
      }
      females.push(new FemaleAngler(otherX,otherY));
      add(females[1]);

      add(new Monkfish(200, 960));
      add(new Eel(400, 100));
      add(new Eel(500, 200));
      player = new Player();
      player.resetPosition();
      add(player);
      
      //FP.console.enable();

      sedimentEmitter = new Emitter(SedimentPartsImg, 8, 8);
			sedimentEmitter.newType("sediment", [0, 1, 2, 3]);
			sedimentEmitter.setAlpha("sediment", 0.6, 0);
			sedimentEmitter.setMotion("sediment", 0, 10, 600, 360, 5, 300);

      sedimentEmitter2 = new Emitter(OtherSedimentPartsImg, 5, 5);
			sedimentEmitter2.newType("sediment2", [0, 1, 2]);
			sedimentEmitter2.setAlpha("sediment2", 0.5, 0);
			sedimentEmitter2.setMotion("sediment2", FP.rand(2), 45, 900, 360, 5, 300);
      add(new HolePunch(females));
    }
    
    override public function update():void
    {
      FP.camera = new Point(player.x - (FP.width - player.width) / 2, player.y - (FP.height - player.height) / 2);
      
      if(sedimentEmitter.particleCount < 100)
      {
        sedimentEmitter.emit("sediment", FP.rand(1024), FP.rand(800));
      }
      sedimentEmitter.update();
      
      
      if(sedimentEmitter2.particleCount < 100)
      {
        sedimentEmitter2.emit("sediment2", FP.rand(1024), FP.rand(800));
      }
      sedimentEmitter2.update();

      super.update();
    }
    
    override public function render():void
    {      
      super.render();
      sedimentEmitter.render(new Point, FP.camera);
      sedimentEmitter2.render(new Point, FP.camera);
    }
  }
}
