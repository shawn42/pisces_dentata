package
{
  public class Displacement extends Emitter
  {
    public function Displacement(image:Class, frameWidth:Number, frameHeight:Number)
    {
      super(image,frameWidth,frameHeight);
    }
    
  }
  
  override public function render(point:Point, camera:Point):void 
	{
		// quit if there are no particles
		if (!_particle) return;
		
		// get rendering position
		point.x += x - camera.x * scrollX;
		point.y += y - camera.y * scrollY;
		
		// particle info
		var t:Number, td:Number,
			p:Particle = _particle,
			type:ParticleType,
			rect:Rectangle;
		
		// loop through the particles
		while (p)
		{
			// get time scale
			t = p._time / p._duration;
			
			// get particle type
			type = p._type;
			rect = type._frame;
			
			// get position
			td = (type._ease == null) ? t : type._ease(t);
			_point.x = point.x + p._x + p._moveX * td;
			_point.y = point.y + p._y + p._moveY * td;
			
			// get frame
			rect.x = rect.width * type._frames[uint(td * type._frameCount)];
			rect.y = uint(rect.x / type._width) * rect.height;
			rect.x %= type._width;
			
			// draw particle
			if (type._buffer)
			{
				// get alpha
				_tint.alphaMultiplier = type._alpha + type._alphaRange * ((type._alphaEase == null) ? t : type._alphaEase(t));
				
				// get color
				td = (type._colorEase == null) ? t : type._colorEase(t);
				_tint.redMultiplier = type._red + type._redRange * td;
				_tint.greenMultiplier = type._green + type._greenRange * td;
				_tint.blueMultiplier  = type._blue + type._blueRange * td;
				type._buffer.fillRect(type._bufferRect, 0);
				type._buffer.copyPixels(type._source, rect, FP.zero);
				type._buffer.colorTransform(type._bufferRect, _tint);
				
				// draw particle
				FP.buffer.copyPixels(type._buffer, type._bufferRect, _point, null, null, true);
			}
			else FP.buffer.copyPixels(type._source, rect, _point, null, null, true);
			
			// get next particle
			p = p._next;
		}
	}
}