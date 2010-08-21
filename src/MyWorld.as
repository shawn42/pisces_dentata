package
{
	import net.flashpunk.*;

  public class MyWorld extends World
  {
    public var player:Player;

    public function MyWorld()
    {
      add(player = new Player());
    }
  }
}
