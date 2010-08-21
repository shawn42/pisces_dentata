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

      var female:FlxSprite = new FlxSprite(220, 70, FemaleAnglerImg);
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
      FlxU.setWorldBounds(0, 0, 1320, 1240);
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
