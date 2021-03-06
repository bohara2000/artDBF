/*
	Create a canvas element and add it to the page

*/
$( document ).ready(function() {
	// Handler for .ready() called.
	//Check for support for DeviceOrientation event
	var orientationBeingRead = false;
	
	if(window.DeviceOrientationEvent) {
	window.addEventListener('deviceorientation', function(event) {
			
			var alpha = event.alpha;
			var beta = event.beta;
			var gamma = event.gamma;
			
			//alert('alpha ' + alpha +  ' beta ' + beta + ' gamma ' + gamma);
			
			if(alpha != null || beta != null || gamma != null ) {
			  orientationBeingRead = true;
			}
		  }, false);
	} else if(window.DeviceMotionEvent) {
	// Check for support for DeviceMotion events
	window.addEventListener('devicemotion', function(event) {
			var x = event.accelerationIncludingGravity.x;
			var y = event.accelerationIncludingGravity.y;
			var z = event.accelerationIncludingGravity.z;
			var r = event.rotationRate;

			if(x > 0 || y > 0 || z > 0 || r > 0) {
			  orientationBeingRead = true;        
			}
		  });
	}
	
	if (orientationBeingRead) {
		appendTilt();		
	} else {
		appendMouse();
	}
	
});

function appendMouse() {
    var mouseInstructions = $("#audienceUI1Instructions");
	mouseInstructions.text('Move your finger across the screen. See what happens');
	var mouseElement = "<canvas nx='position' id='mouseReader'></canvas>";               // Create element with HTML  
    
    $("#work_area").append(mouseElement);         // Append the new elements 
}

function appendTilt() {
    var mouseInstructions = $("#audienceUI1Instructions");
	mouseInstructions.text('Tilt your phone. See what happens');
	var mouseElement = "<canvas id='shakerstilt' nx='tilt' style='min-height:465px;width:340px'></canvas>";               // Create element with HTML  
    
    $("#work_area").append(mouseElement);         // Append the new elements 
}
