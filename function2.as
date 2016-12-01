//test = function(){
	//trace( "hello world! just a test!" );
	//trace( _StageWidth );
//}

GetImage = function(){
	//var	strFile :String = _pageIndex + ".swf";
	//var	strFile :String = "image\\img" + _pageIndex + ".jpg";
	var	strFile :String = _imageFolder + "\\" + _pageIndex + ".JPG";
	return strFile;
}

MovieClip.prototype.Zoom = function(  w:Number, h:Number, fZoom:Number ){
	var 	mc :MovieClip = this;
	with( mc ){
		_x = -w * (fZoom-1.0) /2
		_y = -h * (fZoom-1.0) /2
		//_xscale = fZoom*100;
		//_yscale = fZoom*100;
		_width  = w*fZoom;
		_height = h*fZoom;
	}
}

MovieClip.prototype.Place = function(  x:Number, y:Number,
									   w:Number, h:Number,
									   z:Number, b:Number ){
	var		a = Math.atan( h / w );
	var		angle = a + b;
	var		len = Math.sqrt( h*h+w*w ) / 2
	//trace( "width: " + w + " height: " + h + "Zoom: " + fZoom );
	trace( z + " ----- " + _zoomx + "  " + _zoomy );
	
	var 	mc :MovieClip = this;
	with( mc ){
		_rotation = b*180/Math.PI;
		_x = x - len*Math.cos(angle) * z
		_y = y - len*Math.sin(angle) * z
		//_width  = w*fZoom;
		//_height = h*fZoom;
		_xscale =  z / _zoomx * 100;
		_yscale =  z / _zoomy * 100;
	}
	
}

/*
CreateRectObj = function( strName :String, nLevel :Number, clr :Color) :MovieClip{
	var obj = createEmptyMovieClip( strName, nLevel );
	trace( "     CreateRectObj obj " + obj );
	
	with( obj ){
		beginFill( clr, 100 );
		moveTo( 0, 0);
		lineTo( StageWidth, 0 );
		lineTo( StageWidth, StageHeight );
		lineTo( 0, StageHeight );
		lineTo( 0, 0 );
	}
	
	return obj;
}
//*/

InitRect = function( obj :MovieClip ){
	with( obj ){
		beginFill( 0, 100 );
		moveTo( 0, 0);
		lineTo( StageWidth, 0 );
		lineTo( StageWidth, StageHeight );
		lineTo( 0, StageHeight );
		lineTo( 0, 0 );
		endFill();
		
		_x = 0;
		_y = 0;
	}
}

function	Ani_Random( count :Number ){
	var id = random( 58 )
	
	while( id == 0 || id == 3 ){
		id = random( 58 );
	}
	
	AnimById( id, count );
}

function 	AnimById( id :Number, count :Number ){
	trace( "                     id = " + id );
	
	switch( id ){
		case 0: Ani_Cut( count );			break;
		case 1: Ani_FadeIn( count ); 		break;
		case 2: Ani_FadeInBlack( count ); 	break;
		//case 2: Ani_FadeIn( count ); 		break;
		case 3: Ani_Cut( count ); 		    break;
		case 4: Ani_CutInBlack( count ); 	break;
		//case 4: Ani_FadeIn( count ); 		break;
		case 5: Ani_Dissolve( count ); 		break;
		
		case 6: Ani_Wipe( count, 3 ); 		break;
		case 7: Ani_Wipe( count, 0 ); 		break;
		case 8: Ani_Wipe( count, 2 ); 		break;
		case 9: Ani_Wipe( count, 1 ); 		break;
		case 10: Ani_Wedge( count ); 		break;
		case 11: Ani_Uncover( count, 3 ); 	break;

		case 12: Ani_Uncover( count, 0 ); 	break;
		case 13: Ani_Uncover( count, 2 ); 	break;
		case 14: Ani_Uncover( count, 1 ); 	break;
		case 15: Ani_Uncover( count, 7 ); 	break;
		case 16: Ani_Uncover( count, 4 ); 	break;
		case 17: Ani_Uncover( count, 6 ); 	break;
		
		case 18: Ani_Uncover( count, 5 ); 	break;
		case 19: Ani_BoxIn( count ); 		break;
		case 20: Ani_BoxOut( count ); 		break;
		case 21: Ani_Wheel( count, 1 ); 	break;
		case 22: Ani_Wheel( count, 2 ); 	break;
		case 23: Ani_Wheel( count, 3 ); 	break;
		
		case 24: Ani_Wheel( count, 4 ); 	break;
		case 25: Ani_Wheel( count, 8 ); 	break;
		case 26: Ani_Split( count, 0 ); 	break;
		case 27: Ani_Split( count, 1 ); 	break;
		case 28: Ani_Split( count, 2 ); 	break;
		case 29: Ani_Split( count, 3 ); 	break;

		case 30: Ani_Strips( count, 0 );	break;
		case 31: Ani_Strips( count, 1 );	break;
		case 32: Ani_Strips( count, 2 );	break;
		case 33: Ani_Strips( count, 3 );	break;
		case 34: Ani_Ellipse( count ); 		break;
		case 35: Ani_Diamond( count ); 		break;		
		
		case 36: Ani_Plus( count ); 		break;
		case 37: Ani_NewsFlash( count ); 	break;
		case 38: Ani_Push( count, 3 ); 		break;
		case 39: Ani_Push( count, 0 ); 		break;
		case 40: Ani_Push( count, 2 ); 		break;
		case 41: Ani_Push( count, 1 ); 		break;	
		
		case 42: Ani_Cover( count, 3 ); 	break;
		case 43: Ani_Cover( count, 0 ); 	break;
		case 44: Ani_Cover( count, 2 ); 	break;
		case 45: Ani_Cover( count, 1 ); 	break;
		case 46: Ani_Cover( count, 6 ); 	break;
		case 47: Ani_Cover( count, 4 ); 	break;

		case 48: Ani_Cover( count, 7 ); 	break;
		case 49: Ani_Cover( count, 5 ); 	break;
		case 50: Ani_BlindsHorz( count ); 	break;
		case 51: Ani_BlindsVert( count ); 	break;
		case 52: Ani_CheckerBoardAcross( count ); 	break;
		case 53: Ani_CheckerBoardDown( count ); 	break;		
		
		case 54: Ani_CombHorz( count ); 	break;
		case 55: Ani_CombVert( count ); 	break;
		case 56: Ani_RandomBarHorz( count ); break;	
		case 57: Ani_RandomBarVert( count ); break;	
	}
}

Trigger_TranslateComplete = function(){
	TranslateComplete();
}

Ani_Cut = function( count :Number ){
	trace( "Ani_Cut:  count: " + count );
	
	var	mc = _objMain;
	var runObj = createEmptyMovieClip( "runObj", _layerRunObj );

	var		index = 0
	runObj.onEnterFrame = function() {	
		if( index > 5 ){
			mc._visible = true;
			
			runObj.clear();
			delete runObj.onEnterFrame
			delete runObj;

			Trigger_TranslateComplete();
			return;
		}
	
		index++;
	}	
}

Ani_CutInBlack = function( count :Number ){
	trace( "Ani_CutInBlack:  count: " + count );
	
	var	mc = _objMain;
	var objBlack = createEmptyMovieClip( "objBlack", _layerBlack );
	InitRect( objBlack );
	objBlack._visilbe = false;
	
	var	objRun = createEmptyMovieClip( "objRun", _layerRunObj );

	var		index = 0
	objRun.onEnterFrame = function() {	
		if( index > 10 ){
			objBlack._visible = false;
			mc._visible = true;
			
			objBlack.clear();
			delete objRun.onEnterFrame
			delete objRun;
			delete objBlack;

			Trigger_TranslateComplete();
			return;
		}
		
		if( index == 5 ){
			objBlack._visible = true;
		}
		
		index++;
	}	
}

Ani_RandomBarHorz = function( count :Number ){
	trace( "Ani_RandomBarHorz:  count: " + count );
	
	var runObj = createEmptyMovieClip( "runObj", _layerRunObj );
	runObj._visible = false;
	
	_objMain.setMask( runObj );
	_objMain._visible = true;
	
	var arStart :Array = new Array();
	var ar :Array = new Array();

	function init(){
		counter = 0;
		while(1){
			var 	item = random( 10 );
			arStart.push( counter );
			ar.push( item );
			
			if( counter +item > StageHeight ){
				arStart.push( counter );
				ar.push( StageHeight - counter );
				break;
			}
			counter += item;
		}
	}

	var		index = 0
	runObj.onEnterFrame = function() {	
		if( index > count ){
			_objMain.setMask( NULL );
			
			runObj.clear();
			delete runObj.onEnterFrame;
			delete runObj;
			
			Trigger_TranslateComplete();
			return;
		}
	
		
		with( runObj ){
			clear();
			if( index == 0 ){
				index++;
				init();
				trace( "---------Ani_RandomBarHorz ar.length: " + ar.length );				
				return;
			}
			
			beginFill( 0xffaaaa, 100 );
			
			for( i = 0; i < ar.length; i++ ){
				y = arStart[i];
				h = ar[i] * index/count;
				
				clip = (ar[i] - h )/2
				y += clip;

				moveTo( 0, y )	
				lineTo( StageWidth, y );
				lineTo( StageWidth, y+h );
				lineTo( 0, y+h );
				lineTo( 0, y );
			}
		}
		
		index++;
	}
}

Ani_RandomBarVert = function( count :Number ){
	trace( "Ani_RandomBarVert:  count: " + count );
	
	var runObj = createEmptyMovieClip( "runObj", _layerRunObj );
	runObj._visible = false;
	
	_objMain.setMask( runObj );
	_objMain._visible = true;
	
	var arStart :Array = new Array();
	var ar :Array = new Array();

	function init(){
		counter = 0;
		while(1){
			var 	item = random( 10 );
			arStart.push( counter );
			ar.push( item );
			
			if( counter +item > StageWidth ){
				arStart.push( counter );
				ar.push( StageWidth - counter );
				break;
			}
			counter += item;
		}
	}

	var		index = 0
	runObj.onEnterFrame = function() {	
		if( index > count ){
			_objMain.setMask( NULL );
			
			runObj.clear();
			delete runObj.onEnterFrame;
			delete runObj;
			
			Trigger_TranslateComplete();
			return;
		}
	
		
		with( runObj ){
			clear();
			if( index == 0 ){
				index++;
				init();
				trace( "---------Ani_RandomBarVert ar.length: " + ar.length );				
				return;
			}
			
			beginFill( 0xffaaaa, 100 );
			
			for( i = 0; i < ar.length; i++ ){
				x = arStart[i];
				w = ar[i] * index/count;
				
				clip = (ar[i] - w )/2
				x += clip;

				moveTo( x, 0 )	
				lineTo( x, StageHeight );
				lineTo( x+w, StageHeight);
				lineTo( x+w, 0 );
				lineTo( x, 0 );
			}
		}
		
		index++;
	}
}

Ani_BlindsHorz = function( count :Number ){
	trace( "Ani_BlindsVert:  count: " + count );
	
	var runObj = createEmptyMovieClip( "runObj", _layerRunObj );
	runObj._visible = false;
	
	_objMain.setMask( runObj );
	_objMain._visible = true;
	
	var		blindsCount = 6;
	
	var		bw = StageHeight / blindsCount;
	var		ash = bw / count;
	
	var		index = 0
	
	runObj.onEnterFrame = function() {	
		if( index > count ){
			_objMain.setMask( NULL );
			
			runObj.clear();
			delete runObj.onEnterFrame;
			delete runobj;
			
			Trigger_TranslateComplete();
			return;
		}
	
		with( runObj ){
			clear();
			if( index == 0 ){
				index++;
				return;
			}
			
			beginFill( 0xffaaaa, 100 );
		
			for( i = 0; i < blindsCount; i++ ){
				y = i * bw;
				h = ash * index;
				
				moveTo( 0, y )	
				lineTo( StageWidth, y );
				lineTo( StageWidth, y+h );
				lineTo( 0, y+h );
				lineTo( 0, y );
			}
		}
		
		index++;
	}
}

Ani_BlindsVert = function( count :Number ){
	trace( "Ani_BlindsHorz:  count: " + count );
	
	var runObj = createEmptyMovieClip( "runObj", _layerRunObj );
	runObj._visible = false;
	
	_objMain.setMask( runObj );
	_objMain._visible = true;
	
	var		blindsCount = 6;
	
	var		bw = StageWidth / blindsCount;
	var		ash = bw / count;
	
	var		index = 0
	
	runObj.onEnterFrame = function() {	
		if( index > count ){
			_objMain.setMask( NULL );
			
			runObj.clear();
			delete runObj.onEnterFrame;
			delete runObj;
			
			Trigger_TranslateComplete();
			return;
		}
	
		with( runObj ){
			clear();
			if( index == 0 ){
				index++;
				return;
			}
			
			beginFill( 0xffaaaa, 100 );
		
			for( i = 0; i < blindsCount; i++ ){
				x = i * bw;
				w = ash * index;
				
				moveTo( x, 0 )	
				lineTo( x + w, 0 );
				lineTo( x + w, StageHeight );
				lineTo( x, StageHeight );
				lineTo( x, 0 );
			}
		}
		
		index++;
	}
}

//	0: to LeftDown
//	1: to LeftUp
//	2: to RightDown
//	3: to RightUp
Ani_Strips = function( count :Number, dir :Number ){
	trace( "Ani_Strips:  count: " + count );
	
	var runObj = createEmptyMovieClip( "runObj", _layerRunObj )
	with( runObj ){
		clear();
		_x = 0;
		_y = 0;
		_visible = false;
	}
	
	_objMain.setMask( runObj );
	_objMain._visible = true;
	
	var		bw = StageHeight / 13;
	var		index = 0
	
	var		step = (StageWidth+StageHeight) / count;
	
	runObj.onEnterFrame = function() {	
		if( index > count ){
			_objMain.setMask( NULL );
			
			runObj.clear();
			delete runObj.onEnterFrame;
			delete runObj;
			
			Trigger_TranslateComplete();
			return;
		}
	
		with( runObj ){
			clear();
			if( index == 0 ){
				index++;
				return;
			}
			
			beginFill( 0xffaaaa, 100 );
			for( i = 0; i < 13; i++ ){
				w = step * index - i * bw
				trace( index + "  " + w );
				if( w <= 0 ){
					break;
				}
				
				if( w > StageWidth ){
					w  = StageWidth
				}
				
				if( dir == 0 ){
					x = StageWidth
					y = bw * i;
					
					moveTo( x, y )	
					lineTo( x-w, y );
					lineTo( x-w, y + bw );
					lineTo( x, y + bw );
					lineTo( x, y );
				}
				else if( dir == 1 ){
					x = StageWidth
					y = bw * (12-i);
						
					moveTo( x, y )	
					lineTo( x-w, y );
					lineTo( x-w, y + bw );
					lineTo( x, y + bw );
					lineTo( x, y );				
				}
				else if( dir == 2 ){
					x = 0;
					y = bw * i;
					
					moveTo( x, y )	
					lineTo( x+w, y );
					lineTo( x+w, y + bw );
					lineTo( x, y + bw );
					lineTo( x, y );
				}
				else if( dir == 3 ){
					x = 0;
					y = bw * (12-i);
					
					moveTo( x, y )	
					lineTo( x+w, y );
					lineTo( x+w, y + bw );
					lineTo( x, y + bw );
					lineTo( x, y );					
				}
				
			}
		}
		
		index++;
	}	
}


Ani_CombHorz = function( count :Number ){
	trace( "Ani_CombHorz count = " + count + "_pageIndex: " + _pageIndex );
	
	var obj2 = createEmptyMovieClip( "obj2", _layerMain2 );
	
	var	strFile :String = GetImage();
	obj2.loadMovie( strFile );
	obj2._visible = false;
	
	var runObj = createEmptyMovieClip( "runObj", _layerRunObj );
	with( runObj ){
		clear();
		_x = 0;
		_y = 0;
		_visible = false;
	}
	
	runObj.duplicateMovieClip( "runObj2", _layerRunObj2 );
	
	_objMain.setMask( runObj );
	_objMain._visible = true;
	
	//var		bh = StageWidth / 10;
	var		bv = StageHeight / 20;
	var		ash = StageWidth / count;
	
	var		index = 0
	runObj.onEnterFrame = function() {	
		if( index > count ){
			_objMain.setMask( NULL );
			_objMain._visible = true;
			
			runObj.clear();
			runObj2.clear();
			
			obj2._visible = false;
			obj2.setMask( NULL );
			obj2.unloadMovie();
			delete obj2;
			
			delete runObj.onEnterFrame;
			delete runObj;
			delete runObj2;			
			
			if( _objPre == undefined ){
				delete obj;
			}
			
			Trigger_TranslateComplete();
			return;
		}
		
		runObj.clear();
		runObj2.clear();
		if( index == 0 ){
			index++;
			
			obj2.setMask( runObj2 );
			obj2._visible = true;
			return;
		}
		
		w = ash * index; 
		with( runObj ){
			beginFill( 0xffaaaa, 100 );
			for( i = 0; i < 10; i++ ){
				x = 0;
				y = i * bv * 2;
						
				moveTo( x,   y )	
				lineTo( x+w, y );
				lineTo( x+w, y+bv );
				lineTo(   x, y+bv );
				lineTo(   x, y );			
			}
		}
		
		with( runObj2 ){
			beginFill( 0xffaaaa, 100 );
			for( i = 0; i < 10; i++ ){
				x = StageWidth-w;
				y = i * bv * 2 + bv;
						
				moveTo( x, y )	
				lineTo( StageWidth, y );
				lineTo( StageWidth, y+bv );
				lineTo( x, y+bv );
				lineTo( x, y );			
			}
		}		
		
		_objMain._x = w - StageWidth;
		obj2._x = StageWidth - w;
		index++;
	}
}


Ani_CombVert = function( count :Number ){
	trace( "Ani_CombHorz count = " + count + "_pageIndex: " + _pageIndex );
	
	var obj2 = createEmptyMovieClip( "obj2", _layerMain2 );
	
	var	strFile :String = GetImage();
	obj2.loadMovie( strFile );
	obj2._visible = false;
	
	var runObj = createEmptyMovieClip( "runObj", _layerRunObj );
	with( runObj ){
		clear();
		_x = 0;
		_y = 0;
		_visible = false;
	}
	
	runObj.duplicateMovieClip( "runObj2", _layerRunObj2 );
	
	_objMain.setMask( runObj );
	_objMain._visible = true;
	
	var		bh = StageWidth / 20;
	var		ash = StageHeight / count;
	
	var		index = 0
	runObj.onEnterFrame = function() {	
		if( index > count ){
			_objMain.setMask( NULL );
			_objMain._visible = true;
			
			runObj.clear();
			runObj2.clear();
			
			obj2._visible = false;
			obj2.setMask( NULL );
			obj2.unloadMovie();
			delete obj2;
			
			delete runObj.onEnterFrame;
			delete runObj;
			delete runObj2;			
			
			if( _objPre == undefined ){
				delete obj;
			}
			
			Trigger_TranslateComplete();
			return;
		}
		
		runObj.clear();
		runObj2.clear();
		if( index == 0 ){
			index++;
			
			obj2.setMask( runObj2 );
			obj2._visible = true;
			return;
		}
		
		h = ash * index; 
		with( runObj ){
			beginFill( 0xffaaaa, 100 );
			for( i = 0; i < 10; i++ ){
				x = i * bh * 2;
				y = 0
						
				moveTo( x,   y )	
				lineTo( x, y + h );
				lineTo( x + bh, y + h );
				lineTo( x + bh, y );
				lineTo( x, y );			
			}
		}
		
		with( runObj2 ){
			beginFill( 0xffaaaa, 100 );
			for( i = 0; i < 10; i++ ){
				x = i * bh * 2 + bh;
				y = StageHeight-w;
						
				moveTo( x, y )	
				lineTo( x, StageHeight );
				lineTo( x+bh, StageHeight );
				lineTo( x+bh, y );
				lineTo( x, y );			
			}
		}
		//*/
		
		_objMain._y = h - StageHeight;
		obj2._y = StageHeight - h;
		index++;
	}
}


Ani_CheckerBoardAcross = function( count :Number ){
	trace( "Ani_CheckerBoardAcross count = " + count );
	
	var runObj = createEmptyMovieClip( "runObj", _layerRunObj );
	with( runObj ){
		clear();
		_x = 0;
		_y = 0;
		_visible = false;
	}
	
	_objMain.setMask( runObj );
	_objMain._visible = true;
	
	var		hcount = 7;
	var		vcount = 10; 
	
	var		bh = StageWidth / hcount;
	var		bv = StageHeight / vcount;
	
	var		ash = bh / count;
	
	var		index = 0
	runObj.onEnterFrame = function() {	
		if( index >= count ){
			_objMain.setMask( NULL );
			
			runObj.clear();
			delete runObj.onEnterFrame;
			delete runObj;
			
			Trigger_TranslateComplete();
		}
		
		with( runObj ){
			clear();
			if( index == 0 ){
				index++;
				return;
			}
			
			w = ash * index;
			
			beginFill( 0xffaaaa, 100 );
			
			for( i = 0; i < vcount; i++ ){
				x0 = 0
				j0 = 0;
				if( i%2 ){
					x0 = bh/2
					j0 = -1
				}
				
				for( j = j0; j < hcount; j++ ){
					x = x0 + j * bh;
					y = i * bv;
					
					moveTo( x,   y )	
					lineTo( x+w, y );
					lineTo( x+w, y+bv );
					lineTo(   x, y+bv );
					lineTo(   x, y );
				}
			}
		}
		
		index++;
	}	
}

Ani_CheckerBoardDown = function( count :Number ){
	trace( "Ani_CheckerBoardAcross count = " + count );
	
	var runObj = createEmptyMovieClip( "runObj", _layerRunObj );
	with( runObj ){
		clear();
		_x = 0;
		_y = 0;
		_visible = false;
	}
	
	_objMain.setMask( runObj );
	_objMain._visible = true;
	
	var		hcount = 14;
	var		vcount = 5; 
	
	var		bh = StageWidth / hcount;
	var		bv = StageHeight / vcount;
	
	var		ash = bv / count;
	
	var		index = 0
	runObj.onEnterFrame = function() {	
		if( index >= count ){
			_objMain.setMask( NULL );
			
			runObj.clear();
			delete runObj.onEnterFrame;
			delete runObj;
			
			Trigger_TranslateComplete();
			return;
		}
		
		with( runObj ){
			clear();
			if( index == 0 ){
				index++;
				return;
			}
			
			h = ash * index;
			
			beginFill( 0xffaaaa, 100 );
			
			for( i = 0; i < hcount; i++ ){
				y0 = 0
				j0 = 0;
				if( i%2 ){
					y0 = bv/2
					j0 = -1
				}
				
				for( j = j0; j < vcount; j++ ){
					x = i * bh;
					y = y0 + j * bv;
					
					moveTo( x,   y )	
					lineTo( x+bh, y );
					lineTo( x+bh, y+h );
					lineTo(   x, y+h );
					lineTo(   x, y );
				}
			}
		}
		
		index++;
	}	
}

Ani_Uncover = function( count :Number, dir :Number ){
	trace( "Ani_Uncover:  count: " + count + "  dir: " + dir );
	
	var		mc = _objMain;
	var 	mcPre = _objPre;
	
	var 	clipX :Number= StageWidth / count;
	var 	clipY :Number= StageHeight / count;
	
	var		obj :MovieClip
	if( mcPre != undefined ){
		mc.swapDepths( mcPre );
		obj = mcPre;
	}
	else{
		obj = createEmptyMovieClip( "obj", _layerPrev );
		InitRect( obj );
		mc.swapDepths( obj );
	}
	
	var runObj = createEmptyMovieClip( "runObj", _layerRunObj );
	
	var mask = createEmptyMovieClip( "mask", _layerRunObj2 );
	InitRect( mask );
	obj.setMask( mask );
	
	mc._visible = true;
	runObj.onEnterFrame = function() {
		var		bFinished :Boolean = false
		
		with( obj ){
			// to left
			if( dir == 0 ){	
				_x -= clipX;
				if( _x <= -StageWidth ){
					bFinished = true;
				}
			}
			// to top
			else if( dir == 1 ){
				_y -= clipY;
				if( _y <= -StageHeight ){
					bFinished = true;
				}
			}
			// to right
			else if( dir == 2 ){
				_x += clipX;
				if( _x >= StageWidth ){
					bFinished = true;
				}
			}
			// to bottom
			else if( dir == 3 ){
				_y += clipY;
				if( _y >= StageHeight ){
					bFinished = true;
				}
			}
			// to LeftUp
			else if( dir == 4 ){
				_x -= clipX;
				_y -= clipY;
				if( _x <= -StageWidth ){
					bFinished = true;
				}
			}
			// to RightUp
			else if( dir == 5 ){
				_x += clipX;
				_y -= clipY;
				if( _x >= StageWidth ){
					bFinished = true;
				}
			}
			// to RightDown
			else if( dir == 6 ){
				_x += clipX;
				_y += clipY;
				if( _x >= StageWidth ){
					bFinished = true;
				}				
			}	
			// to LeftDown
			else if( dir == 7 ){
				_x -= clipX;
				_y += clipY;
				if( _x <= -StageWidth ){
					bFinished = true;
				}
			}

		}
		
		if( bFinished ){
			delete runObj.onEnterFrame;
			delete runObj;
			
			mask.clear();
			delete mask;
			
			if( mcPre == undefined ){
				delete obj;
			}
			
			Trigger_TranslateComplete();
			return;
		}
	}
}

Ani_Cover = function( count :Number, dir :Number ){
	trace( "Ani_Cover count: " + count + "  dir: " + dir );
	var		mc = _objMain;
	var		mcPre = _objPre;
	
	var runObj = createEmptyMovieClip( "runObj", _layerRunObj );
	InitRect( runObj );
	mc.setMask( runObj );
	mc._visible = true;
	
	var 	clipX :Number= StageWidth / count;
	var 	clipY :Number= StageHeight / count;
	
	with( mc ){
		// to left
		if( dir == 0 ){
			_x = StageWidth;
			_y = 0;
		}
		// to top
		else if( dir == 1 ){
			_x = 0;
			_y = StageHeight;
		}
		// to right
		else if( dir == 2 ){
			_x = -StageWidth;
			_y = 0;
		}
		// to bottom
		else if( dir == 3 ){
			_x = 0;
			_y = -StageHeight;
		}
		// to LeftUp
		else if( dir == 4 ){
			_x = StageWidth;
			_y = StageHeight;
		}
		// to RightUp
		else if( dir == 5 ){
			_x = -StageWidth;
			_y = StageHeight;
		}
		// to LeftDown
		else if( dir == 6 ){
			_x = StageWidth;
			_y = -StageHeight;
		}
		// to RightDown
		else if( dir == 7 ){
			_x = -StageWidth;
			_y = -StageHeight;
		}
	}
	
	runObj.onEnterFrame = function() {
		var		bFinished :Boolean = false
		
		with( mc ){
			// to left
			if( dir == 0 ){
				_x -= clipX;
				if( _x <= 0 ){
					bFinished = true;
				}
			}
			// to top
			else if( dir == 1 ){
				_y -= clipY;
				if( _y <= 0 ){
					bFinished = true;
				}			
			}
			// to right
			else if( dir == 2 ){
				_x += clipX;
				if( _x >= 0 ){
					bFinished = true;
				}			
			}
			// to bottom
			else if( dir == 3 ){
				_y += clipY;
				if( _y >= 0 ){
					bFinished = true;
				}					
			}
			// to leftup
			else if( dir == 4 ){
				_x -= clipX;
				_y -= clipY;
				if( _x <= 0 ){
					bFinished = true;
				}				
			}
			// to rightup
			else if( dir == 5 ){
				_x += clipX;
				_y -= clipY;
				if( _x >= 0 ){
					bFinished = true;
				}
			}
			// to LeftDown
			else if( dir == 6 ){
				_x -= clipX;
				_y += clipY;
				if( _x <= 0 ){
					bFinished = true;
				}
			}			
			// to RightDown
			else if( dir == 7 ){
				_x += clipX;
				_y += clipY;
				if( _x >= 0 ){
					bFinished = true;
				}
			}
		}

		if( bFinished ){
			mc.setMask( NULL );
			runObj.clear();
			delete runObj.onEnterFrame;
			delete runObj;
		
			Trigger_TranslateComplete();
			return;
		}
	}
}


Ani_FadeInBlack = function( count :Number ){
	trace( "Ani_FadeInBlack count =" + count );
	
	var		mc = _objMain;
	var 	clipAlpha :Number= 100 / count;
	
	mc._alpha = 0;

	var objBlack = createEmptyMovieClip( "objBlack", _layerBlack );
	objBlack._alpha = 0;
	InitRect( objBlack );
	
	var	objRun = createEmptyMovieClip( "objRun", _layerRunObj );

	var		index = 0;
	objRun.onEnterFrame = function() {
		if( index < count/2 ){
			//objBlack._visible = true;
			objBlack._alpha = index * clipAlpha * 2;
		}
		else if( index == count/2 ){
			mc._visible = true;
		}
		else if( index < count ){
			mc._alpha = (index - count/2) * clipAlpha *2;
		}
		else{
			mc._alpha = 100;
			
			objBlack.clear();
			delete objRun.onEnterFrame;
			delete objRun;
			delete objBlack;
			
			Trigger_TranslateComplete();
			return;
		}
		
		index++;
	}
}

Ani_FadeIn = function( count :Number ){
	trace( "Ani_FadeIn count =" + count );
	
	var		mc = _objMain;	
	var		mcPre = _objPre;
	
	var 	clipAlpha :Number= 100 / count;
	
	mc._visible = true;
	mc._alpha = 0;
	var runObj = createEmptyMovieClip( "runObj", _layerRunObj );
	runObj.onEnterFrame = function() {
		mc._alpha += clipAlpha;
		if( mcPre != undefined ){
			//mcPre._alpha = 100 - alpha;
		}

		if( mc._alpha >= 100 ){
			if( mcPre != undefined ){
				//mcPre._visible = false;
			}
			
			delete runObj.onEnterFrame;
			delete runObj;
			
			Trigger_TranslateComplete();
			return;
		}
	}
}

Ani_Push = function( count :Number, dir :Number ){
	trace( "Ani_Push:  count: " + count + "  dir: " + dir );
	
	var		mc = _objMain;
	var		mcPre = _objPre;
	
	var 	clipX :Number= StageWidth / count;
	var 	clipY :Number= StageHeight / count;
	
	var 	mask1 = createEmptyMovieClip( "mask1", _layerRunObj );
	InitRect( mask1 );
	mask1._x = 0;
	mask1._y = 0;
	mc.setMask( mask1 );
	
	var		mask2;
	if( mcPre != undefined ){
		var mask2 = createEmptyMovieClip( "mask2", _layerRunObj2 );
		InitRect( mask2 );
		mask2._x = 0;
		mask2._y = 0;
		mcPre.setMask( mask2 )
	}
	
	with( mc ){
		_visible = true;
		// to left
		if( dir == 0 ){	
			_x = StageWidth;
		}
		// to top
		else if( dir == 1 ){
			_y = StageHeight;
		}
		// to right
		else if( dir == 2 ){
			_x = -StageWidth;
		}
		// to bottom
		else if( dir == 3 ){
			_y = -StageHeight;
		}
	}
	
	mask1.onEnterFrame = function() {
		var		bFinished :Boolean = false
		
		with( mc ){
			// to left
			if( dir == 0 ){	
				_x -= clipX;
				if( mcPre != undefined ){
					mcPre._x -= clipX;
				}
				if( _x <= 0 ){
					bFinished = true;
				}
			}
			// to top
			else if( dir == 1 ){
				_y -= clipY;
				if( mcPre != undefined ){
					mcPre._y -= clipY;
				}			
				if( _y <= 0 ){
					bFinished = true;
				}
			}
			// to right
			else if( dir == 2 ){
				_x += clipX;
				if( mcPre != undefined ){
					mcPre._x += clipX;
				}					
				if( _x >= 0 ){
					bFinished = true;
				}
			}
			// to bottom
			else if( dir == 3 ){
				_y += clipY;
				if( mcPre != undefined ){
					mcPre._y += clipY;
				}				
				if( _y >= 0 ){
					bFinished = true;
				}
			}
		}
		
		if( bFinished ){
			if( mcPre != undefined ){
				mcPre._visible = false;
				mcPre.setMask( NULL );
				mask2.clear();
				delete mask2;
			}
			
			mask1.clear();
			mc.setMask( NULL );
			delete mask1.onEnterFrame;
			delete mask1;
	
			Trigger_TranslateComplete();
			return;
		}
	}	
}

Ani_Wipe = function( count :Number, dir :Number ){
	trace( "Ani_Wipe:  count: " + count + "  dir: " + dir );
	
	var		mc = _objMain;
	var		mcPre = _objPre;
	
	var 	clipX :Number= StageWidth / count;
	var 	clipY :Number= StageHeight / count;
	var 	runObj = createEmptyMovieClip( "runObj", _layerRunObj );
	InitRect( runObj );
	
	mc.setMask( runObj );
	mc._visible = true;
	
	with( runObj ){
		// to left
		if( dir == 0 ){	
			_x = StageWidth;
			_width = 0;
		}
		// to top
		else if( dir == 1 ){
			_y = StageHeight;
			_height = 0;
		}
		// to right
		else if( dir == 2 ){
			_width = 0;
		}
		// to bottom
		else if( dir == 3 ){
			_height = 0;
		}
	}
	runObj.onEnterFrame = function() {
		var		bFinished :Boolean = false
		with( runObj ){
			// to left
			if( dir == 0 ){	
				_x -= clipX;
				_width += clipX;
				if( _x <= 0 ){
					bFinished = true;
				}
			}
			// to top
			else if( dir == 1 ){
				_y -= clipY;
				_height += clipY;
				if( _y <= 0 ){
					bFinished = true;
				}
			}
			// to right
			else if( dir == 2 ){
				_width += clipX			
				if( _width >= StageWidth ){
					bFinished = true;
				}
			}
			// to bottom
			else if( dir == 3 ){
				_height += clipY;	
				if( _height >= StageHeight ){
					bFinished = true;
				}
			}
		}
		
		if( bFinished ){
			mc.setMask( NULL );
			
			runObj.clear();
			delete runObj.onEnterFrame;
			delete runObj;
			
			Trigger_TranslateComplete();
			return;
		}
	}	
}

Ani_Wedge = function( count :Number ){
	trace( "Ani_Wedge:  count: " + count );
	
	var	mc 	= _objMain;
	var mcPre = _objPre;
	
	var runObjD = createEmptyMovieClip( "runObj", _layerRunObj );
	with( runObj ){
		clear();
		_x = 0;
		_y = 0;
		_visible = false;
	}
	mc.setMask( runObj );
	mc._visible = true;

	var 	ash = Math.PI / count
	var		index = 0;
	runObj.onEnterFrame = function() {
		index ++;
		if( index >= count ){
			mc.setMask( NULL );
			runObj.clear();
			
			delete runObj.onEnterFrame;
			delete runObj;
			
			Trigger_TranslateComplete();
			return;
		}
		
		var		a = ash * index;
		
		x = StageWidth/2;
		y = StageHeight/2;
		
		var		l = Math.floor( y * Math.tan( a ) );
		x1 = x - l
		x2 = x + l

		if( l < x && l > 0 ){
			with( runObj ){
				clear();
				beginFill( 0xFF0000, 0 );
				moveTo( x, y);	
				
				if( a < Math.PI / 2 ){
					lineTo( x1, 0 );
					lineTo( x2, 0 );
				}
				else{
					lineTo( x1, StageHeight );
					lineTo( 0, StageHeight );
					lineTo( 0, 0 );
					lineTo( StageWidth, 0 );
					lineTo( StageWidth, StageHeight );
					lineTo( x2, StageHeight );
				}
				
				lineTo( x, y );
			}
		}
		else{
			x1 = 0;
			x2 = StageWidth;
			if( a < Math.PI / 2 ){
				h = Math.floor( x / Math.tan( a ) );
				y1 = y2 = y - h;
			}
			else{
				h = Math.floor( x / Math.tan( a ) );
				y1 = y2 = y - h;
			}
				
			with( runObj ){
				clear();
				beginFill( 0xFF0000, 0 );
				moveTo( x, y);
				lineTo( x1, y1 );
				lineTo( 0, 0 );
				lineTo( StageWidth, 0 );
				lineTo( x2, y2 )
				lineTo( x, y );
			}
		}
	}
}

Ani_Dissolve = function( count :Number ){
	trace( "Ani_Dissolve:  count: " + count );
	
	var mc = _objMain;
	var runObjD = createEmptyMovieClip( "runObjD", _layerRunObj );
	with( runObjD ){
		clear();
		_x = 0;
		_y = 0;
		_visible = false;
	}
	
	mc.setMask( runObjD );
	mc._visible = true;

	var		index = 0
	
	countX = 50;
	
	block = StageWidth / countX;
	countY = StageHeight / block;
	
	ar = new Array( count*countY );
	
	function DrawBlock( obj, i, j ){
		x = i*block
		y = j*block

		with( obj ){
			moveTo( x, y )
			lineTo( x, y+block );
			lineTo( x+block, y+block );
			lineTo( x+block, y );
			lineTo( x, y )
		}
	}
	
	function Dissolve_Init( width, height ){
		for( i = 0; i < width; i++ ){
			for( j = 0; j < height; j++ ) {
				ar[height*i+j] = random( count );
			}
		}
	}
	
	runObjD.onEnterFrame = function() {	
		if( index >= count ){
			mc.setMask( NULL );
			runObjD.clear();
			
			delete runObjD.onEnterFrame;
			delete runObjD;
			
			Trigger_TranslateComplete();
			return;
		}
		
		if( index == 0 ){
			runObjD.clear();
			Dissolve_Init( countX, countY );
		}
		
		runObjD.beginFill( 0xffaaaa, 100 );
		for( i = 0; i < countX; i++ ){
			for( j = 0; j < countY; j++ ) {
				if( ar[i*countY+j] == index ){
					DrawBlock( runObjD, i, j );
				}
			}
		}
		
		index++
	}
}

Ani_Ellipse = function( count :Number ){
	trace( "Ani_Ellipse:  count: " + count );
	
	var	mc = _objMain;
	
	var runObj = createEmptyMovieClip( "runObj", _layerRunObj );
	with( runObj ){
		clear();
		_x = StageWidth/2;
		_y = StageHeight/2;
		_visible = false;
	}
	
	mc.setMask( runObj );
	mc._visible = true;

	var		index = 0
	
	var		w = StageWidth / count;
	var		h = StageHeight / count;

	
	runObj.onEnterFrame = function() {	
		if( index > count ){
			mc.setMask( NULL );
			
			runObj.clear();
			delete runObj.onEnterFrame;
			delete runObj;
			
			Trigger_TranslateComplete();
			return;
		}
		
		with( runObj ){
			clear();
			if( index == 0 ){
				index++;
				return;
			}
			
			var		rx = w * index;
			var		ry = h * index;
			var		a = rx * 0.4142
			var		b = rx * 0.7071;
			var		c = ry * 0.4142
			var		d = ry * 0.7071		
			
			beginFill( 0xFF0000, 80 );
			moveTo( rx, 0 );
			
			curveTo( rx, c, b, d );
			curveTo( a, ry, 0, ry );
			
			curveTo( -a, ry, -b, d );
			curveTo( -rx, c, -rx, 0 );
			
			curveTo( -rx , -c, -b, -d );
			curveTo( -a, -ry, 0, -ry );
			
			curveTo( a, -ry, b, -d );
			curveTo( rx, -c, rx, 0 );
			
			endFill();	
		}
		
		index++;
	}	
}

Ani_BoxOut = function( count :Number ){
	trace( "Ani_Rect:  count: " + count );
	
	var	mc = _objMain;
	
	var runObj = createEmptyMovieClip( "runObj", _layerRunObj );
	with( runObj ){
		clear();
		_x = StageWidth/2;
		_y = StageHeight/2;
		_visible = false;
	}
	
	mc.setMask( runObj );
	mc._visible = true;

	var		index = 0
	
	var		ws = StageWidth/2 / count;
	var		hs = StageHeight/2 / count;
	runObj.onEnterFrame = function() {	
		if( index > count ){
			mc.setMask( NULL );
			
			runObj.clear();
			delete runObj.onEnterFrame;
			delete runObj;
			
			Trigger_TranslateComplete();
			return;
		}
		
		with( runObj ){
			clear();
			if( index == 0 ){
				index++;
				return;
			}
			
			w = ws * index;
			h = hs * index;
			
			beginFill( 0xffaaaa, 100 );
			moveTo( -w, -h )	
			lineTo(  w, -h );
			lineTo(  w,  h );
			lineTo( -w,  h );
			lineTo( -w, -h );
		}
		
		index++;
	}	
}


Ani_BoxIn = function( count :Number ){
	trace( "Ani_Rect:  count: " + count );
	
	var		mc = _objMain;
	
	var runObj = createEmptyMovieClip( "runObj", _layerRunObj );
	with( runObj ){
		clear();
		_x = StageWidth/2;
		_y = StageHeight/2;
		_visible = false;
	}
	
	mc.setMask( runObj );
	mc._visible = true;

	var		index = 0
	
	var		wr = StageWidth/2
	var		hr = StageHeight/2
	
	var		ws = wr / count;
	var		hs = hr / count;
	runObj.onEnterFrame = function() {	
		if( index > count ){
			mc.setMask( NULL );
			
			runObj.clear();
			delete runObj.onEnterFrame;
			delete runObj;
		
			Trigger_TranslateComplete();
			return;
		}
		
		with( runObj ){
			clear();
			if( index == 0 ){
				index++;
				return;
			}
			
			w = ws * (count-index);
			h = hs * (count-index);
			
			beginFill( 0xffaaaa, 100 );
			moveTo( -wr, -hr )	
			lineTo(  wr, -hr );
			lineTo(  wr,  hr );
			lineTo( -wr,  hr );
			lineTo( -wr, -hr );
			
			moveTo( -w, -h )	
			lineTo( -w,  h );
			lineTo(  w,  h );
			lineTo(  w, -h );
			lineTo( -w, -h );
		}
		
		index++;
	}	
}

Ani_Wheel = function( count :Number, amount :Number ){
	trace( "Ani_Wheel:  count: " + count + "amount: " + amount );
	
	var		mc = _objMain;

	var runObj = createEmptyMovieClip( "runObj", _layerRunObj );
	with( runObj ){
		clear();
		_x = StageWidth/2;
		_y = StageHeight/2;
		_visible = false;
	}
	
	mc.setMask( runObj );
	mc._visible = true;

	var		index = 0
	
	var		r = Math.max( StageWidth, StageHeight ) * 0.7;
	angleCount = (2*Math.PI)/amount;
	anglePart = angleCount/count;
	
	runObj.onEnterFrame = function() {	
		if( index > count ){
			mc.setMask( NULL );
			
			runObj.clear();
			delete runObj.onEnterFrame;
			delete runObj;

			Trigger_TranslateComplete();
			return;
		}
		
		with( runObj ){
			clear();
			if( index == 0 ){
				index++;
				return;
			}			
			
			beginFill( 0xffaaaa, 100 );
			moveTo( 0,  0 )	
			for( a = 0; a < amount; a++ ){
				xx = r*Math.sin(angleCount*a);
				yy = -r*Math.cos(angleCount*a);
				lineTo( xx, yy );
				
				for( i = 1; i <= index; i++ ){
					angle = angleCount*a + anglePart*(i+1);
					xx = r*Math.sin(angle);
					yy = -r*Math.cos(angle)
					lineTo( xx, yy );
				}

				lineTo( 0, 0 );
			}
		}
		
		index++;
	}
}

Ani_NewsFlash = function( count :Number ){
	trace( "Ani_NewsFlash:  count: " + count );
	
	var	mc = _objMain;
	
	var mask = createEmptyMovieClip( "mask", _layerRunObj );
	InitRect( mask );
	mc.setMask( mask );
	
	var		a0 = 0;					// 0
	var		a1 = -4*Math.PI;		// 720;
	var		aa = a1/count;
	
	var		z0 = 0.2;
	var		z1 = 1.0;
	var		za = (z1-z0)/count;

	var		index = 0
	mask.onEnterFrame = function() {	
		if( index > count ){
			mask.clear();
			delete mask.onEnterFrame;
			delete mask;
			
			mc.setMask( NULL );
			mc._rotation = 0;

			Trigger_TranslateComplete();
			return;
		}
	
		if( index == 0 ){
			mc._visible = true;
		}
		
		trace( a0 + index*aa );
		mc.Place( StageWidth/2, StageHeight/2, StageWidth, StageHeight, z0 + index*za, a0 + index*aa );
		index++;
	}	
}

Ani_Diamond = function( count :Number ){
	trace( "Ani_Diamond:  count: " + count );
	
	var runObj = createEmptyMovieClip( "runObj", _layerRunObj );
	with( runObj ){
		clear();
		_x = StageWidth/2;
		_y = StageHeight/2;
		_visible = false;
	}
	
	_objMain.setMask( runObj );
	_objMain._visible = true;

	var		index = 0
	
	var		ws = StageWidth / count;
	var		hs = StageHeight / count;
	runObj.onEnterFrame = function() {	
		if( index > count ){
			_objMain.setMask( NULL );
			
			runObj.clear();
			delete runObj.onEnterFrame;
			delete runObj;
			
			Trigger_TranslateComplete();
			return;
		}
		
		with( runObj ){
			clear();
			if( index == 0 ){
				index++;
				return;
			}
			
			w = ws * index;
			h = hs * index;
			
			beginFill( 0xffaaaa, 100 );
			moveTo( 0, -h )	
			lineTo( w,  0 );
			lineTo( 0,  h );
			lineTo( -w, 0 );
			lineTo( 0, -h );
		}
		
		index++;
	}	
}

Ani_Plus = function( count :Number ){
	trace( "Ani_Plus:  count: " + count );
	
	var runObj = createEmptyMovieClip( "runObj", _layerRunObj );
	with( runObj ){
		clear();
		_x = StageWidth/2;
		_y = StageHeight/2;
		_visible = false;
	}
	
	_objMain.setMask( runObj );
	_objMain._visible = true;

	var		index = 0
	
	var		cx = StageWidth/2;
	var		cy = StageHeight/2;
	
	var		ws = cx / count;
	var		hs = cy / count;
	runObj.onEnterFrame = function() {	
		if( index > count ){
			_objMain.setMask( NULL );
			
			runObj.clear();
			delete runObj.onEnterFrame;
			delete runObj;
			
			Trigger_TranslateComplete();
			return;
		}
		
		with( runObj ){
			clear();
			if( index == 0 ){
				index++;
				return;
			}
			
			w = ws * index;
			h = hs * index;
			
			beginFill( 0xffaaaa, 100 );
			moveTo( -w, -cy )
			lineTo(  w, -cy );
			lineTo(  w, -h );
			lineTo( cx, -h );
			lineTo( cx,  h );
			lineTo(  w,  h );
			lineTo(  w, cy );
			lineTo( -w, cy );
			lineTo( -w,  h );
			lineTo( -cx, h );
			lineTo( -cx, -h );
			lineTo( -w,  -h );
			lineTo( -w,  -cy );
		}
		
		index++;
	}	
}

// 	0: Horz In
//	1: Horz Out
//	2: Vert In
//	3: Vert Out
Ani_Split = function( count :Number, dir :Number ){
	trace( "Ani_Split() count: " + count + " dir: " + dir  );
	
	var runObj = createEmptyMovieClip( "runObj", _layerRunObj );
	with( runObj ){
		clear();
		_x = StageWidth/2;
		_y = StageHeight/2;
		_visible = false;
	}
	
	_objMain.setMask( runObj );
	_objMain._visible = true;

	var		index = 0
	
	var		cx = StageWidth/2;
	var		cy = StageHeight/2;
	
	var		ws = cx / count;
	var		hs = cy / count;
	runObj.onEnterFrame = function() {	
		if( index > count ){
			_objMain.setMask( NULL );
			
			runObj.clear();
			delete runObj.onEnterFrame;
			delete runObj;
			
			Trigger_TranslateComplete();
			return;
		}
		
		with( runObj ){
			clear();
			if( index == 0 ){
				index++;
				return;
			}
			
			w = ws * index;
			h = hs * index;
			
			beginFill( 0xffaaaa, 100 );
			
			if( dir == 0 ){
				moveTo( -cx, -cy )
				lineTo(  cx, -cy )
				lineTo(  cx, -cy + h );
				lineTo( -cx, -cy + h );
				lineTo( -cx, -cy );
				
				moveTo( -cx,  cy )
				lineTo(  cx,  cy )
				lineTo(  cx,  cy - h );
				lineTo( -cx,  cy - h );
				lineTo( -cx,  cy );				
			}
			else if( dir == 1 ){
				moveTo( -cx, -h );
				lineTo(  cx, -h );
				lineTo(  cx,  h );
				lineTo( -cx,  h );
				lineTo( -cx, -h );
			}
			else if( dir == 2 ){
				moveTo( -cx, -cy )
				lineTo( -cx+w, -cy )
				lineTo( -cx+w,  cy );
				lineTo( -cx,  cy );
				lineTo( -cx, -cy );
				
				moveTo( cx-w, -cy )
				lineTo( cx, -cy )
				lineTo( cx,  cy );
				lineTo( cx-w,  cy );
				lineTo( cx-w, -cy );
			}
			else if( dir == 3 ){
				moveTo( -w, -cy );
				lineTo( -w,  cy );
				lineTo(  w,  cy );
				lineTo(  w, -cy );
				lineTo( -w, -cy );
			}
		}
		
		index++;
	}	
}


ShowLoading = function( mcPage :MovieClip, bShow :Number ){
	var nTime = 0;
	var	nClick = 0;
	
	LoadingProc = function( mcLoading : MovieClip, mcPage : MovieClip ){
		var lb = mcPage.getBytesLoaded();
		var tb = mcPage.getBytesTotal();
		
		if( tb == 0 ){
			trace(  mcPage + " .............0/0" );
		}
		
		mcPage._visible = false;
		
		//trace( "mcPage._visible " + mcPage._visible );
	
		percent = Math.round((lb/tb)*100);
	
		// 模拟下载进度
		//if( percent > nTime ){
		//	percent = nTime;
		//	nTime += random( 10 );
		//}
			
		//trace( lb + "/" + tb + "   " + percent );
		if( percent == 0 )
			return;
		
		//trace( percent + "%" );
		if( percent < 100 ){
			mcLoading._visible = true;
			
			var		str:String;
			if( nClick % 4 == 0 )
				str = "    ";
			else if( nClick % 4 == 1 )
				str = ".   ";
			else if( nClick % 4 == 2 )
				str = "..  ";
			else
				str = "... ";
			nClick ++;
			
			mcLoading.txt.text = "  Buffering next" + str + percent + "%"
			
			var _txtFormat  = new TextFormat("Arial", 14, 0xFFFFFF, false );
			mcLoading.txt.setTextFormat(_txtFormat);			
		}
		
		if (percent >= 100) {
			//trace( "delete LoadingBar.onEnterFrame" );
			delete LoadingBar.onEnterFrame;
			mcLoading.txt.text = "";
			mcLoading.clear();
			
			_objMain = mcPage;
			
			//trace( " loadSlide " + _objMain._width + " - " + _objMain._height );			
			with( _objMain ){
				_zoomx = _width / StageWidth;
				_zoomy = _height / StageHeight;
				
				_width = StageWidth;
				_height = StageHeight;
			}
			
			LoadComplete();
		}
	}	
	
	var LoadingBar = createEmptyMovieClip( "LoadingBar", _layerLoading );
	var nWidth = StageWidth
	var nHeight = 20;
	
	//进度条 
	with( LoadingBar ){
		_visible = false;
		
		beginFill( 0x111111, 20 );
		moveTo( 0, 0);
		lineTo( nWidth, 0 );
		lineTo( nWidth, nHeight );
		lineTo( 0, nHeight );
		lineTo( 0, 0 );
	 
		createTextField("txt", 30, 0, -2, nWidth, 16 );
		txt.autoSize = "left";
		
		_x = 0;
		_y = StageHeight-20;
		
		LoadingBar.onEnterFrame = function() {
			_parent.LoadingProc( LoadingBar, mcPage );
		}

	}
}

//	切换新的页面
swapSlide = function(){
	if( _objMain != undefined ){
		if( _objPre != undefined ){
			unloadMovie( _objPre );
		}
		_objPre = _objMain;
		_objPre.swapDepths( _layerPrev );
	}
}

loadSlide = function( slideIndex :Number ){
	//swapSlide();
	
	var	str :String = "slide" + slideIndex;
	var obj = createEmptyMovieClip( str, _layerMain )
	
	_pageIndex = slideIndex;
	
	var	strFile :String = GetImage();
	loadMovie( strFile, obj );

	ShowLoading( obj, 0 );
	
	stop();
}

AnimSlide = function( count :Number){
	var		mc = _objMain;
	
	var runObj = createEmptyMovieClip( "runObj", _layerRunObj );
	InitRect( runObj );
	runObj._visilbe = false;
	mc.setMask( runObj );
	
	index = 0;
	az = 0.1/count;
	
	runObj.onEnterFrame = function() {
		if( index >= count ){
			delete runObj.onEnterFrame;
			delete runObj;
			
			//play();
			AnimComplete();
			return;
		}
		
		mc.Zoom( StageWidth, StageHeight, 1.0 + az*index );
		index++
	}
}
