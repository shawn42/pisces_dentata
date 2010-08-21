package
{
	import org.flixel.*;

  public class World extends FlxGroup
  {
    private var floor:FlxTileblock;
    private var leftWall:FlxTileblock;
    private var rightWall:FlxTileblock;
    [Embed(source = '../assets/floor.png')] private var FloorImg:Class;
    [Embed(source = '../assets/floor.png')] private var WallImg:Class;

    public function World()
    {
      add(floor = new FlxTileblock(0, 1000, 1000, 240));
      floor.loadGraphic(FloorImg);
      add(leftWall = new FlxTileblock(0, 0, 320, 1240));
      leftWall.loadGraphic(WallImg);
      add(rightWall = new FlxTileblock(1000, 0, 320, 1240));
      rightWall.loadGraphic(WallImg);
    } 

//    override public function update():void
//    {
//    }
  }
}
