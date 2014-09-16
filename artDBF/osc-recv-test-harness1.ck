// (launch with OSC_send.ck)

// Add instruments used by audience

// the patch
AudienceInstrument1 instrument1Array[0];


Gain master => dac;
0.4 => master.gain;

// create our OSC receiver
OscRecv recv;
// use port 6449
7475 => recv.port;
// start listening (launch thread)
recv.listen();

// create an address in the receiver, store in new variable
recv.event( "/shakerchange1, s, f" ) @=> OscEvent oeAudienceInst1ShakerPreset1;
recv.event( "/shakerchange2, s, f" ) @=> OscEvent oeAudienceInst1ShakerPreset2;
recv.event( "/shakerchange3, s, f" ) @=> OscEvent oeAudienceInst1ShakerPreset3;
recv.event( "/shakerchange4, s, f" ) @=> OscEvent oeAudienceInst1ShakerPreset4;
recv.event( "/shakerobjects, s, f" ) @=> OscEvent oeAudienceInst1ShakerNumnerOfObjects;
recv.event( "/shakerstilt/x, s, f" ) @=> OscEvent oeAudienceInst1ShakerTiltX;
recv.event( "/shakerstilt/y, s, f" ) @=> OscEvent oeAudienceInst1ShakerTiltY;
recv.event( "/shakerstilt/z, s, f" ) @=> OscEvent oeAudienceInst1ShakerTiltZ;
recv.event( "/shakerstiltStart, s, f" ) @=> OscEvent oeAudienceInst1ShakerTiltStart;
recv.event( "/mouseReader/x, s, f" ) @=> oeAudienceInst1ShakerTiltX;
recv.event( "/mouseReader/y, s, f" ) @=> oeAudienceInst1ShakerTiltY;


0 => int startTilt;

fun void AudienceInst1ShakerPreset1Handler()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oeAudienceInst1ShakerPreset1 => now;

		// grab the next message from the queue. 
		while ( oeAudienceInst1ShakerPreset1.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oeAudienceInst1ShakerPreset1.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oeAudienceInst1ShakerPreset1.getFloat() => messageValue;
			// print
			<<< "got (via OSC): /shakerchange1", IPAddress, ",", messageValue >>>;
			// go do something...
			
            // Check for existence of instrument for this IP address
            if( instrument1Array[IPAddress] == null)
            {
                new AudienceInstrument1 @=> instrument1Array[IPAddress];
                instrument1Array[IPAddress].gain => master;
            }
            // Effect 1 button passes Maraca
            if(messageValue > 0)
            {
                instrument1Array[IPAddress].AddShaker(0);
            } else {
                instrument1Array[IPAddress].RemoveShaker(0);
            }
            
		}
	}	
}

fun void AudienceInst1ShakerPreset2Handler()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oeAudienceInst1ShakerPreset2 => now;

		// grab the next message from the queue. 
		while ( oeAudienceInst1ShakerPreset2.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oeAudienceInst1ShakerPreset2.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oeAudienceInst1ShakerPreset2.getFloat() => messageValue;
			// print
			<<< "got (via OSC): /shakerchange2", IPAddress, ",", messageValue >>>;
			// go do something...
			
            // Check for existence of instrument for this IP address
            if( instrument1Array[IPAddress] == null)
            {
                new AudienceInstrument1 @=> instrument1Array[IPAddress];
                instrument1Array[IPAddress].gain => master;
            }
            
            // Effect 2 button passes Tambourine
            if(messageValue > 0)
            {
                instrument1Array[IPAddress].AddShaker(6);
            } else {
                instrument1Array[IPAddress].RemoveShaker(6);
            }
            
		}
	}	
}

fun void AudienceInst1ShakerPreset3Handler()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oeAudienceInst1ShakerPreset3 => now;

		// grab the next message from the queue. 
		while ( oeAudienceInst1ShakerPreset3.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oeAudienceInst1ShakerPreset3.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oeAudienceInst1ShakerPreset3.getFloat() => messageValue;
			// print
			<<< "got (via OSC): /shakerchange3", IPAddress, ",", messageValue >>>;
			// go do something...
			
            // Check for existence of instrument for this IP address
            if( instrument1Array[IPAddress] == null)
            {
                new AudienceInstrument1 @=> instrument1Array[IPAddress];
                instrument1Array[IPAddress].gain => master;
            }
            
            // Effect 3 button passes Quarters
            if(messageValue > 0)
            {
                instrument1Array[IPAddress].AddShaker(17);
            } else {
                instrument1Array[IPAddress].RemoveShaker(17);
            }
            
		}
	}	
}

fun void AudienceInst1ShakerPreset4Handler()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oeAudienceInst1ShakerPreset4 => now;

		// grab the next message from the queue. 
		while ( oeAudienceInst1ShakerPreset4.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oeAudienceInst1ShakerPreset4.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oeAudienceInst1ShakerPreset4.getFloat() => messageValue;
			// print
			<<< "got (via OSC): /shakerchange4", IPAddress, ",", messageValue >>>;
			// go do something...
			
            // Check for existence of instrument for this IP address
            if( instrument1Array[IPAddress] == null)
            {
                new AudienceInstrument1 @=> instrument1Array[IPAddress];
                instrument1Array[IPAddress].gain => master;
            }
            
            // Effect 4 button passes Bamboo Chimes
            if(messageValue > 0)
            {
                instrument1Array[IPAddress].AddShaker(22);
            } else {
                instrument1Array[IPAddress].RemoveShaker(22);
            }
            
		}
	}	
}

fun void AudienceInst1ShakerNumberOfObjectsHandler()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oeAudienceInst1ShakerNumnerOfObjects => now;

		// grab the next message from the queue. 
		while ( oeAudienceInst1ShakerNumnerOfObjects.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oeAudienceInst1ShakerNumnerOfObjects.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oeAudienceInst1ShakerNumnerOfObjects.getFloat() => messageValue;
			// print
			<<< "got (via OSC): /shakerobjects", IPAddress, ",", messageValue >>>;
			// go do something...
			
            // Check for existence of instrument for this IP address
            if( instrument1Array[IPAddress] == null)
            {
                new AudienceInstrument1 @=> instrument1Array[IPAddress];
                instrument1Array[IPAddress].gain => master;
            }
            //if(messageValue > 0)
            //{
                instrument1Array[IPAddress].SetNumberOfObjects(messageValue);
            //}        
            
		}
	}	
}

fun void AudienceInst1ShakerTiltXHandler()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oeAudienceInst1ShakerTiltX => now;

		// grab the next message from the queue. 
		while ( oeAudienceInst1ShakerTiltX.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oeAudienceInst1ShakerTiltX.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oeAudienceInst1ShakerTiltX.getFloat() => messageValue;
			// print
			<<< "got (via OSC): /shakerstilt/x", IPAddress, ",", messageValue >>>;
			// go do something...
			
            // Check for existence of instrument for this IP address
            if( instrument1Array[IPAddress] == null)
            {
                new AudienceInstrument1 @=> instrument1Array[IPAddress];
                instrument1Array[IPAddress].gain => master;
                0.0 => instrument1Array[IPAddress].gain.gain;
            }
            if(startTilt > 0)
            {
                instrument1Array[IPAddress].AdjustShakerFrequency(messageValue % 1);
            }        
            
		}
	}	
}

fun void AudienceInst1ShakerTiltYHandler()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oeAudienceInst1ShakerTiltY => now;

		// grab the next message from the queue. 
		while ( oeAudienceInst1ShakerTiltY.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oeAudienceInst1ShakerTiltY.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oeAudienceInst1ShakerTiltY.getFloat() => messageValue;
			// print
			<<< "got (via OSC): /shakerstilt/y", IPAddress, ",", messageValue >>>;
			// go do something...
			
            // Check for existence of instrument for this IP address
            if( instrument1Array[IPAddress] == null)
            {
                new AudienceInstrument1 @=> instrument1Array[IPAddress];
                instrument1Array[IPAddress].gain => master;
                0.0 => instrument1Array[IPAddress].gain.gain;
            }
            
            if(startTilt > 0)
            {
                instrument1Array[IPAddress].AdjustShakerEnergy(messageValue % 1);
            }   
            /* */
            
		}
	}	
}

fun void AudienceInst1ShakerTiltZHandler()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oeAudienceInst1ShakerTiltZ => now;

		// grab the next message from the queue. 
		while ( oeAudienceInst1ShakerTiltZ.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oeAudienceInst1ShakerTiltZ.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oeAudienceInst1ShakerTiltZ.getFloat() => messageValue;
			// print
			<<< "got (via OSC): /shakerstilt/z", IPAddress, ",", messageValue >>>;
			// go do something...
			
            // Check for existence of instrument for this IP address
            if( instrument1Array[IPAddress] == null)
            {
                new AudienceInstrument1 @=> instrument1Array[IPAddress];
                
                //   <<< "Waiting..." >>>;
                if (startTilt > 0)
                {
                    instrument1Array[IPAddress].gain => master;
                }
            }
            /* */
            if(startTilt > 0)
            {
                instrument1Array[IPAddress].AdjustFilter(messageValue);
            }
		}
	}	
}


fun void AudienceInst1ShakerTiltStartHandler()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oeAudienceInst1ShakerTiltStart => now;

		// grab the next message from the queue. 
		while ( oeAudienceInst1ShakerTiltStart.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oeAudienceInst1ShakerTiltStart.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oeAudienceInst1ShakerTiltStart.getFloat() => messageValue;
			// print
			<<< "got (via OSC): /shakerstiltStart", IPAddress, ",", messageValue >>>;
			// go do something...
			
            // Check for existence of instrument for this IP address
            if( instrument1Array[IPAddress] == null)
            {
                new AudienceInstrument1 @=> instrument1Array[IPAddress];
                instrument1Array[IPAddress].gain => master;
            }
            
            if(messageValue > 0.0)
            {
                <<< "master gain", master.gain() >>>;
                master.gain() => instrument1Array[IPAddress].gain.gain;
                1 => startTilt;
                
            } else {
                0.0 => instrument1Array[IPAddress].gain.gain;
                0 => startTilt;
            }       
            /* */
            
		}
	}	
}


// kick off event handlers

spork ~ AudienceInst1ShakerTiltStartHandler();
//spork ~ AudienceInst1ShakerNumberOfObjectsHandler();
spork ~ AudienceInst1ShakerPreset1Handler();
spork ~ AudienceInst1ShakerPreset2Handler();
spork ~ AudienceInst1ShakerPreset3Handler();
spork ~ AudienceInst1ShakerPreset4Handler();
spork ~ AudienceInst1ShakerTiltXHandler();
spork ~ AudienceInst1ShakerTiltYHandler();
spork ~ AudienceInst1ShakerTiltZHandler();


while (true)
{
    10::ms => now;
}