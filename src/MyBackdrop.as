
package
{
	import net.flashpunk.graphics.*;

  public class MyBackdrop extends Backdrop
  {
    [Embed(source = '../assets/sea_background.png')]
    private var SeaBackgroundImg:Class;

    public function MyBackdrop() 
    {
      super(SeaBackgroundImg, true, true);
    } 
  }
}
