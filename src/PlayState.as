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

    private var player:FlxSprite;
    private var bg:FlxSprite;

		override public function create():void
		{
      bg = new FlxSprite(0, 0, SeaBackgroundImg);
      add(bg);

      player = new FlxSprite(232, 90, MaleAnglerImg);
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
		}

    override public function update():void
    {
      super.update();
      var playerSpeed:Number = 0.8;
      var x_vel:Number = (FlxG.mouse.screenX - FlxG.width/2) * playerSpeed;
      var y_vel:Number = (FlxG.mouse.screenY - FlxG.height/2) * playerSpeed;
      
      player.velocity = new FlxPoint(x_vel,y_vel);

      bg.x = -FlxG.scroll.x
      bg.y = -FlxG.scroll.y
    }
	}
}
