package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.utils.*;
  import net.flashpunk.masks.*;
  import net.flashpunk.tweens.misc.*;
  import flash.geom.*;

  public class Player extends Entity
  {
    [Embed(source = '../assets/fish_growl.mp3')]
    private const FishGrowlSnd:Class;
    [Embed(source = '../assets/chomp.mp3')]
    private const ChompSnd:Class;
    [Embed(source = '../assets/male_angler.png')]
    private const IMAGE:Class;
    [Embed(source = '../assets/male_angler_mask.png')]
    private const MASK:Class;
    [Embed(source="../assets/spot.png")]
    private const SpotImageClass:Class;

    public var allowMoveUp:Boolean = true;
    public var allowMoveDown:Boolean = true;
    public var allowMoveLeft:Boolean = true;
    public var allowMoveRight:Boolean = true;
    private var spot:Image;
    private var image:Image;
    private var deathWait:Number = 0;
    private var dead:Boolean = false;
    
    private var followSpeed:Number = 0.3;

    public static var instance:Player;
    
    public function Player()
    {
      image = new Image(IMAGE);
      var pixelmask:Pixelmask = new Pixelmask(MASK);
      mask = pixelmask;
      graphic = image;
      type = "Player";
      width = image.width;
      height = image.height;
      instance = this;

      spot = new Image(SpotImageClass);
      spot.blend = "add";
      spot.scaleY=0.5;
    } 

    override public function update():void
    {
      var followVelocity:Point = new Point(
        followSpeed * (Input.mouseX - FP.width / 2),
        followSpeed * (Input.mouseY - FP.height / 2)
      );
      var dx:Number = followVelocity.x * FP.elapsed;
      var dy:Number = followVelocity.y * FP.elapsed;
      if (dx > 0 && allowMoveRight) 
      {
        x += dx;
        image.flipped = true;
        spot.flipped = true;
      }

      if (dx < 0 && allowMoveLeft)
      {
         x += dx;
         image.flipped = false;
         spot.flipped = false;
      }
      
      if ((dy > 0 && allowMoveDown) || (dy < 0 && allowMoveUp)) 
      {
        y += dy;
      }
      
      deathWait += FP.elapsed;
      if (deathWait > 1 && dead) {
        FP.world = Main.deathWorld;
        deathWait = 0;
        dead = false;
      };

      var femaleAngler:FemaleAngler = collide("FemaleAngler", x, y) as FemaleAngler;
      if (femaleAngler)
      {
        var growl:Sfx = new Sfx(FishGrowlSnd);
        growl.play();
        resetPosition();
        Main.deathWorld.setMessage("You dissolve slowly in reproductive bliss--until you die.");
        dead = true;
      }
      var enemy:Entity = collide("Enemy", x, y);
      if (enemy)
      {
        var chomp:Sfx = new Sfx(ChompSnd);
        chomp.play();
        Main.deathWorld.setMessage("You die a pathetic little fish death. Nobody remembers you.");
        resetPosition();
        dead = true;
      }
    }
    
    public function resetPosition():void {
      x = 100;
      y = 100;
    }
    
    override public function render():void {
//      HolePunch.darkness.drawGraphic(x-(spot.width/2)+(width/2),  y-(spot.height/2)+(height/2), spot);
      if (!dead) {
        spot.render(new Point(
          x-(spot.width/2)+(width/2),
          y-(spot.height/4)+(height/2)), FP.camera);
        super.render();
      }
    }
  }
}
