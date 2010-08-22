package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
  import flash.geom.*;

  public class MyWorld extends World
  {
    [Embed(source = '../assets/Ambient1.mp3')]
    private const AmbientMusic:Class;

    public var player:Player;
    public var backdrop:MyBackdrop;
    
    public var females:Array;
    
    public var tilemap:Tilemap;

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
      
      add(new HolePunch(females));
    }

    override public function update():void
    {
      super.update();
      FP.camera = new Point(player.x - (FP.width - player.width) / 2, player.y - (FP.height - player.height) / 2);
    }
  }
}
