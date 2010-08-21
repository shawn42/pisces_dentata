package
{
	import org.flixel.*;
	[SWF(width="640", height="480", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]

	public class PiscesDentata extends FlxGame
	{
		public function PiscesDentata()
		{
			super(320,240,MenuState,2);
		}
	}
}
