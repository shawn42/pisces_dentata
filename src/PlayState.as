package
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
    [Embed(source = '../assets/male_angler.png')]private var MaleAnglerImg:Class;
    [Embed(source = '../assets/female_angler.png')]private var FemaleAnglerImg:Class;
    [Embed(source = '../assets/sea_background.png')]private var SeaBackgroundImg:Class;
    [Embed(source = '../assets/sediment_parts.png')]private var SedimentPartsImg:Class;


    private var particles:FlxEmitter;

		override public function create():void
		{
      var bg:FlxSprite = new FlxSprite(0, 0, SeaBackgroundImg);
      add(bg);

      var player:FlxSprite = new FlxSprite(32, 70, MaleAnglerImg);
      add(player);

      var female:FlxSprite = new FlxSprite(220, 70, FemaleAnglerImg);
      add(female);

      add(particles = new FlxEmitter(0, 0));
      particles.createSprites(SedimentPartsImg,FlxG.width/4, 16, true);
      particles.setXSpeed( -5, 5);
      particles.setYSpeed(0, 5);
      particles.setRotation( 0, 0);
      particles.gravity = 0;
      particles.setSize(FlxG.width, FlxG.height);
      particles.start(false, 0.01);
			//add(new FlxText(0,0,100,"INSERT GAME HERE"));
		}
	}
}
