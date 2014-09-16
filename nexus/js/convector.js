


$(document).on("pagebeforecreate",function(){
	//Check for support for DeviceOrientation event
	/*	
	if(window.DeviceOrientationEvent) {
		
		alert("supporting deviceorientation alpha: " + alpha + '<br/>beta: ' + beta + '<br />gamma: ' + gamma);	
	} else if(window.DeviceMotionEvent) {

		// Check for support for DeviceMotion events
		var x = event.accelerationIncludingGravity.x;
		var y = event.accelerationIncludingGravity.y;
		var z = event.accelerationIncludingGravity.z;
		var r = event.rotationRate;
		alert("supporting devicemotion"); 
	} else {
		alert("no device orientation support");
	}
	*/
	// substitute mouseEvent for tilt canvas
	var elementID = 'mouseTouch'; // Unique ID

	$('<canvas>').attr({
	    id: elementID,
            nx: "mouse"
	}).css({
	    width: '200px',
	    height: '200px'
	}).appendTo('#ui1_xyaxis');

	var canvas = document.getElementById(elementID); // Use the created element
	
	});


$(document).on("pagecreate",function(){
  //alert("loading page");
  var xmlToParse = getUrlVars()["poemSelect"];
  if (xmlToParse == undefined) {
		xmlToParse = "Convector_Howlers.xml";  
  }
  $.ajax({
    type: "GET",
    url: xmlToParse,
    dataType: "xml",
    success: parseXml
  });
  
  $( "[data-role='navbar']" ).navbar();
  $( "[data-role='header'], [data-role='footer']" ).toolbar();
  $( "div.box" ).on( "swipeleft", swipeleftHandler );
  $( "div.box" ).on( "swiperight", swiperightHandler );
  
  $("#poemSelect").change( function(){
			 var xmlToParse = $( this ).val();
			 if (xmlToParse == undefined) {
				xmlToParse = "Convector_Howlers.xml";  
			 }
			 $.ajax({
			 type: "GET",
			 url: xmlToParse,
			 dataType: "xml",
			 success: parseXml
			});
		});

  $(document).bind('pageinit', function() {
      $("#target").on("change keydown", function(e) {
	var userInput = $(this).val();
	if (e.which === 0){
	  e.which = userInput.charAt(userInput.length-1).charCodeAt(0);
	}        
	var code = e.which;
	
	var chunk = { 
			oscName: "/target",
			asciivalue: code
		    }
	$.post( "lib/jqueryOSCRelay.php", chunk)
		.done(function( data ) {
		    //$("#result").append( "Data Loaded: " + data );
		  });
      });            
    });
    
    
  /*
  $('#target').bind('keydown', function(e) {
	var code = e.which;
	
	var chunk = { 
			oscName: "/target",
			asciivalue: code
		    }
	$.post( "lib/jqueryOSCRelay.php", chunk)
		.done(function( data ) {
		    $("#result").append( "Data Loaded: " + data );
		  });
  });
 */	  
});

var counter = 0;		

function swiperightHandler( event ){
    $( $( "div.poem" )[ Math.abs(counter) % $( "div.poem" ).length ] ).hide().removeClass( "swipe" );
    counter++;
	 //var x = $( "div.poem" )[ Math.abs(counter) % $( "div.poem" ).length ].id;    
    $( $( "div.poem" )[ Math.abs(counter) % $( "div.poem" ).length ] ).toggle( "slow" ).addClass( "swipe" );
    
}		

function swipeleftHandler( event ){
    $( $( "div.poem" )[ Math.abs(counter) % $( "div.poem" ).length ] ).hide().removeClass( "swipe" );
    counter--;
    //var x = $( "div.poem" )[ Math.abs(counter) % $( "div.poem" ).length ].id;
    $( $( "div.poem" )[ Math.abs(counter) % $( "div.poem" ).length ] ).toggle( "slow" ).addClass( "swipe" );
    
}		

// Read a page's GET URL variables and return them as an associative array.
function getUrlVars()
{
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for(var i = 0; i < hashes.length; i++)
    {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}

function parseXml(xml) {
	//alert("parsing XML");
	$('#box').empty();
	// find the title and put the text in a div tag
	$(xml).find('title').each(function(){
		//alert($(this).text());
		$('#box').append("<div class='poem title ui-corner-all'>" + $(this).text() + "</div>");
			
	});
	
	// find the author and copyright and put them in a single div tag
	$(xml).find('author').each(function(){
		//alert($(this).text());
		$('#box').append("<div class='poem author ui-corner-all'><br />" + "&copy;" + $(xml).find('copyright').text() + " By " + $(this).text() + "</div>");
			
	});
	
	// find a preface and put it in a div tag
	$(xml).find('preface').each(function(){
		//alert('found stanza');
		$('#box').append("<div class='poem preface ui-corner-all'><emphasis>" + $(this).text().replace("\n", "<br />") + "</emphasis></div>");
	});
	
	// find every beat and put it in a div tag
	$(xml).find('beat').each(function(){
		//alert('found beat');
		$('#box').append("<div class='poem ui-corner-all'>" + $(this).text().replace("\n", "<br />") + "</div>");
	});
	
	$( "div.poem:first-child" ).show( "slow" ).addClass( "swipe" );
}

