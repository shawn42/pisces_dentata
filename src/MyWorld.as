package
{
	import net.flashpunk.*;

  public class MyWorld extends World
  {
    public var player:Player;
    public var backdrop:MyBackdrop;
    public var femaleAngler:FemaleAngler;

    public function MyWorld()
    {
      backdrop = new MyBackdrop();
      var backdropEntity:Entity = new Entity();
      backdropEntity.graphic = backdrop;
      add(backdropEntity);
      add(femaleAngler = new FemaleAngler());
      player = new Player();
      player.x = 200;
      player.y = 200;
      add(player);
    }
  }
}
