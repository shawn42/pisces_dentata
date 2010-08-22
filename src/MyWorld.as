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
    public var femaleAngler:FemaleAngler;
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

      add(femaleAngler = new FemaleAngler());
      femaleAngler.x = 400;
      femaleAngler.y = 400;
      player = new Player();
      player.x = 300;
      player.y = 300;
      add(player);
      
      add(new HolePunch([femaleAngler]));
    }

    override public function update():void
    {
      super.update();
      FP.camera = new Point(player.x - (FP.width - player.width) / 2, player.y - (FP.height - player.height) / 2);
    }
  }
}
