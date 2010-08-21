package
{
	import org.flixel.*;

  public class World extends FlxGroup
  {
    private var floor:FlxTileblock;
    private var ceiling:FlxTileblock;
    private var leftWall:FlxTileblock;
    private var rightWall:FlxTileblock;
    [Embed(source = '../assets/floor.png')] private var FloorImg:Class;
    [Embed(source = '../assets/floor.png')] private var WallImg:Class;

    public function World()
    {
      add(floor = new FlxTileblock(-320, 1000, 1640, 240));
      floor.loadGraphic(FloorImg);
      add(ceiling = new FlxTileblock(-320, -240, 1640, 240));
      add(leftWall = new FlxTileblock(-320, 0, 320, 1240));
      leftWall.loadGraphic(WallImg);
      add(rightWall = new FlxTileblock(1000, 0, 320, 1240));
      rightWall.loadGraphic(WallImg);
    } 

//    override public function update():void
//    {
//    }
  }
}
