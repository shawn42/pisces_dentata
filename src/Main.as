package
{
  import net.flashpunk.*;

  public class Main extends Engine
  {
    public function Main()
    {
      super(640, 480, 60, true);
      FP.world = new MyWorld();
    }

    override public function init():void
    {
      // blah
    }
  }
}
