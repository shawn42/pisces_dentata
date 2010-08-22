package
{
  import net.flashpunk.*;
  	import net.flashpunk.graphics.*;

  public class SeaBed extends Entity
  {
    [Embed(source = '../assets/floor.png')]
    private const TILEMAP_IMAGE:Class;

    public function SeaBed()
    {
      super();
      var leftTilemap:Tilemap = new Tilemap(TILEMAP_IMAGE, 320, 1024, 16, 16);
      leftTilemap.x = -320;
      leftTilemap.y = 0;
      leftTilemap.setRegion(0,0, 20, 64,0);
            
      var rightTilemap:Tilemap = new Tilemap(TILEMAP_IMAGE, 320, 1024, 16, 16);
      rightTilemap.x = 1024;
      rightTilemap.y = 0;
      rightTilemap.setRegion(0,0, 20, 64,0);

      var floorTilemap:Tilemap = new Tilemap(TILEMAP_IMAGE, 1664, 240, 16, 16);
      floorTilemap.x = -320;
      floorTilemap.y = 1024;
      floorTilemap.setRegion(0,0, 104, 15,0);
      
      var seaBedGraphicList:Graphiclist = new Graphiclist();
      seaBedGraphicList.add(leftTilemap);
      seaBedGraphicList.add(rightTilemap);
      seaBedGraphicList.add(floorTilemap);
      graphic = seaBedGraphicList;
    }
  }
}
