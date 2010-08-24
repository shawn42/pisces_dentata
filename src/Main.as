package
{
  import net.flashpunk.*;

  public class Main extends Engine
  {
    public static var mainWorld:MainWorld;
    public static var openingWorld:OpeningWorld;
    public static var deathWorld:DeathWorld;
    public static var winWorld:WinWorld;
    
    public static var VIEWPORT_WIDTH:Number = 1000;
    public static var VIEWPORT_HEIGHT:Number = 680;
    
    
    public static var HALF_VIEWPORT_WIDTH:Number = VIEWPORT_WIDTH/2;
    public static var HALF_VIEWPORT_HEIGHT:Number = VIEWPORT_HEIGHT/2;
    
    public function Main()
    {
      super(VIEWPORT_WIDTH, VIEWPORT_HEIGHT, 60, false);
      mainWorld = new MainWorld();
      openingWorld = new OpeningWorld();
      deathWorld = new DeathWorld();
      winWorld = new WinWorld();
      FP.world = Main.openingWorld;
    }

    override public function init():void
    {
      // blah
    }
  }
}
