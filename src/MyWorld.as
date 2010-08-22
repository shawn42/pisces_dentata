package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
  import flash.geom.*;

  public class MyWorld extends World
  {
    public var player:Player;
    public var backdrop:MyBackdrop;
    public var femaleAngler:FemaleAngler;
    public var tilemap:Tilemap;

    public function MyWorld()
    {
      backdrop = new MyBackdrop();
      var backdropEntity:Entity = new Entity();
      backdropEntity.graphic = backdrop;
      add(backdropEntity);
    
      var seaBed:SeaBed = new SeaBed();
      add(seaBed);

      add(femaleAngler = new FemaleAngler());
      player = new Player();
      player.x = 200;
      player.y = 200;
      add(player);
      
      //add(new HolePunch([femaleAngler]));
    }

    override public function update():void
    {
      super.update();
      FP.camera = new Point(player.x - (FP.width - player.width) / 2, player.y - (FP.height - player.height) / 2);
    }
  }
}
