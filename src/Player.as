package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;

  public class Player extends Entity
  {
    [Embed(source = '../assets/male_angler.png')]
    private const PLAYER:Class;

    public function Player()
    {
      graphic = new Image(PLAYER);
    } 
  }
}
