(function( $ ) {
	$.fn.muImageResize = function( params ) {
		var _defaultSettings = {
			width:300,
			height:300,
			wrap_fix:true // Let image display like in-line.
		};
		var _set = $.extend(_defaultSettings, params); 
		var isIE7 = $.browser.msie && (7 == ~~ $.browser.version);

		
		// Just bind load event once per element.
		return this.one('load', function() {
			// Remove all attributes and CSS rules.
			
			if($(this).attr("data-w") == null && $(this).attr("data-w") == null)
			{
				this.removeAttribute( "width" );
				this.removeAttribute( "height" );
			}else{
				_set.width = parseInt(this.getAttribute("data-w"), 10) || 300;
				_set.height = parseInt(this.getAttribute("data-h"), 10) || 300;
			}
			
			this.style.width = this.style.height = "";
			
			var ow, oh;
			
			//[workaround] - msie need get width early
			if ($.browser.msie)
			{
				// Get original size for calcutation.
				ow = this.width;
				oh = this.height;
			}
			
			if (_set.wrap_fix) {
				$(this).wrap(function(){
					return '<div style="width:'+_set.width+'px; height:'+_set.height+'px; position:relative; overflow:hidden; " />';
				});
			}
			
			if (!$.browser.msie)
			{
				// Get original size for calcutation.
				ow = this.width;
				oh = this.height;
			}
			
			// if cannot get width or height.
			if (0==ow || 0==oh){
				$(this).width(_set.width);
				$(this).height(_set.height);
			}else{
					
				// Merge position settings
				var dis_type='';

				// if original image's width > height.
				if (ow > oh) {
					p = oh / _set.height; 
					oh = _set.height; 
					ow = ow / p;
					
					// original image width smaller than settings.
					if (ow < _set.width){
						// need to resize again, 
						// because new image size range must can cover settings' range, than we can crop it correctly. 
						p = ow / _set.width; 
						ow = _set.width;
						oh = oh / p;
						
						// the crop range would be in the center of new image size.
						sh = (oh-_set.height)/2;
						t=sh+'px';
						r=_set.width+'px';
						b=(_set.height+sh)+'px';
						l='0px';
						
						// need to be adjust top position latter.
						dis_type = 'top';
						
					// original image width bigger than settings.
					}else{
						// new image range can cover settings' range. 
						sh = (ow-_set.width)/2;
						t='0px';
						r=(_set.width+sh)+'px';
						b=_set.height+'px';
						l=sh+'px';
						// need to be adjust left position latter.
						dis_type = 'left';
					}
				// ref above, change width to height then do same things.
				}else{
					p = ow / _set.width;
					ow = _set.width;
					oh = oh / p;

					if (oh < _set.height) {
						p = oh / _set.height;
						oh = _set.height;
						ow = ow / p;
						
						sh = (ow-_set.width)/2;
						t='0px';
						r=(_set.width+sh)+'px';
						b=_set.height+'px';
						l=sh+'px';
						dis_type = 'left';
					}else{
						sh = (oh-_set.height)/2;
						t=sh+'px';
						r=_set.width+'px';
						b=(_set.height+sh)+'px';
						l='0px';
						dis_type = 'top';
					}
				}
				
				// Resize img.
				$(this).width(ow);
				$(this).height(oh);

				var osh = 0;
				if('auto' != $(this).css(dis_type)){
					osh = parseInt($(this).css(dis_type));
				}
			
				if (0 < sh) {sh*=-1;}
				sh += osh;
				
				$(this).css(dis_type, sh+'px');
				$(this).css('position','absolute');
			}
			$(this).show();
		})
		.one( "error", function() {
			//$(this).hide();
		})
		.each(function() {
			$(this).hide();
			// Trigger load event (for Gecko and MSIE)
			if ( this.complete || $.browser.msie ) {
				$( this ).trigger( "load" ).trigger( "error" );
			}
		});
	};
	
})( jQuery );