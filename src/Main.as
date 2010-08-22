package
{
  import net.flashpunk.*;

  public class Main extends Engine
  {
    public static var mainWorld:MyWorld;
    public static var openingWorld:OpeningWorld;
    public static var deathWorld:DeathWorld;
    
    public function Main()
    {
      super(640, 480, 60, true);
      mainWorld = new MyWorld();
      openingWorld = new OpeningWorld();
      deathWorld = new DeathWorld();
      FP.world = Main.openingWorld;
    }

    override public function init():void
    {
      // blah
    }
  }
}
