$(document).ready(function()
{
  $.ajax({
    type: "GET",
    url: "Convector_Howlers.xml",
    dataType: "xml",
    success: parseXml
  });
  $( "div.box" ).on( "swipeleft", swipeleftHandler );
  $( "div.box" ).on( "swiperight", swiperightHandler );
  		  
});

var counter = 0;		

function swiperightHandler( event ){
    $( $( "div.poem" )[ Math.abs(counter) % $( "div.poem" ).length ] ).hide().removeClass( "swipe" );
    counter++;
    $( $( "div.poem" )[ Math.abs(counter) % $( "div.poem" ).length ] ).toggle( "slow" ).addClass( "swipe" );
}		

function swipeleftHandler( event ){
    $( $( "div.poem" )[ Math.abs(counter) % $( "div.poem" ).length ] ).hide().removeClass( "swipe" );
    counter--;
    $( $( "div.poem" )[ Math.abs(counter) % $( "div.poem" ).length ] ).toggle( "slow" ).addClass( "swipe" );
}		

function parseXml(xml) {
	//alert(xml);
	
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
		//alert('found stanza');
		$('#box').append("<div class='poem ui-corner-all'>" + $(this).text().replace("\n", "<br />") + "</div>");
	});
	
	$( "div.poem:first-child" ).addClass( "swipe" ).show( "slow" );
}