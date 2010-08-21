package
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
    [Embed(source = '../assets/female_angler.png')]private var FemaleAnglerImg:Class;
    [Embed(source = '../assets/sediment_parts.png')]private var SedimentPartsImg:Class;
    [Embed(source = '../assets/floor.png')] private var FloorImg:Class;

    private var particles:FlxEmitter;
    private var player:Player;
    private var world:World;

		override public function create():void
		{
      add(new Background());
      add(world = new World());

      player = new Player(232, 90);
      add(player);
      FlxG.followTarget = player;

      var female:FlxSprite = new FlxSprite(500, 500, FemaleAnglerImg);
      var femaleWidth = 259;
      var femaleHeight = 189;
      female.colOffsets.splice();
      female.colOffsets.push(new FlxPoint(-126, 128));
      female.colOffsets.push(new FlxPoint(-65, 40));
      female.colOffsets.push(new FlxPoint(20, 85));
      female.colOffsets.push(new FlxPoint(67, 92));
      female.colOffsets.push(new FlxPoint(127, 27));
      female.colOffsets.push(new FlxPoint(125, -13));
      female.colOffsets.push(new FlxPoint(57, -64));
      female.colOffsets.push(new FlxPoint(-12, -83));
      female.colOffsets.push(new FlxPoint(-84, -92));
      /*female.colOffsets[0] = new FlxPoint(55 - femaleWidth / 2, 55 - femaleHeight / 2);*/
      /*female.colOffsets.push(new FlxPoint(256 - femaleWidth / 2, 106 - femaleHeight / 2));*/
      /*female.colOffsets.push(new FlxPoint(199 - femaleWidth / 2, 148 - femaleHeight / 2));*/
      /*female.colOffsets.push(new FlxPoint(48 - femaleWidth / 2, 186 - femaleHeight / 2));*/
      add(female);

      add(particles = new FlxEmitter(0, -20));
      particles.createSprites(SedimentPartsImg,FlxG.width/5, 16, true);
      particles.setXSpeed(-2, 2);
      particles.setYSpeed(-2, 2);
      particles.setSize(FlxG.width, FlxG.height+20);

      particles.setRotation( 0, 0);
      particles.gravity = 0.3;

      particles.start(false, 0.2);

      FlxG.mouse.show();
      FlxU.setWorldBounds(-320, -240, 1640, 1480);
		}

    override public function update():void
    {
      FlxG.log(FlxQuadTree.bounds.x);
      FlxG.log(FlxQuadTree.bounds.y);
      FlxG.log(FlxQuadTree.bounds.width);
      FlxG.log(FlxQuadTree.bounds.height);
      super.update();
      collide();
    }
	}
}
