package
{
  import net.flashpunk.*;
	import net.flashpunk.debug.*;
	import net.flashpunk.graphics.*;
  import flash.geom.*;
	import net.flashpunk.utils.*;

  public class MyWorld extends World
  {
    [Embed(source = '../assets/Ambient1.mp3')]
    private const AmbientMusic:Class;
    
    [Embed(source = '../assets/sediment_parts1.png')]
    private const SedimentPartsImg:Class;

    public var player:Player;
    public var backdrop:MyBackdrop;
    
    public var females:Array;
    
    public var tilemap:Tilemap;
    private var sedimentEmitter:Emitter;

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

      add(new Monkfish(200, 960));
      
      add(new Eel(800, 100));
      
      player = new Player();
      player.x = 100;
      player.y = 100;
      add(player);
      
      FP.console.enable();
        
      sedimentEmitter = new Emitter(SedimentPartsImg, 8, 8);
			sedimentEmitter.newType("sediment", [0, 1, 2, 3]);
			sedimentEmitter.setAlpha("sediment", 1, 0);
			sedimentEmitter.setMotion("sediment", 0, 10, 600, 360, 5, 300);
//			if(sedimentEmitter.particleCount < 10)
//      {
//        sedimentEmitter.emit("sediment", FP.rand(1024), FP.rand(800));
        //sedimentEmitter.emit("sediment", FP.world.mouseX, FP.world.mouseY);
//      }
      add(new HolePunch(females));
    }
    
    override public function update():void
    {
      FP.camera = new Point(player.x - (FP.width - player.width) / 2, player.y - (FP.height - player.height) / 2);
      //if (Input.mouseDown)
      //{
      
      if(sedimentEmitter.particleCount < 100)
      {
        sedimentEmitter.emit("sediment", FP.rand(1024), FP.rand(800));
        //sedimentEmitter.emit("sediment", FP.world.mouseX, FP.world.mouseY);
      }
      sedimentEmitter.update();
      super.update();
    }
    
    override public function render():void
    {      
      super.render();
      sedimentEmitter.render(new Point, FP.camera);
    }
  }
}
