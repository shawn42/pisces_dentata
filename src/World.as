package
{
	import org.flixel.*;

  public class World extends FlxTileblock
  {
    [Embed(source = '../assets/floor.png')] private var FloorImg:Class;

    public function World()
    {
      super(232, 100, 10, 10);
      loadGraphic(FloorImg);
    } 

//    override public function update():void
//    {
//    }
  }
}
