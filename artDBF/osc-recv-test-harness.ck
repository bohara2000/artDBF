// (launch with OSC_send.ck)

// Add instruments used by audience

// the patch
AudienceInstrument2 instrument2Array[0];


Gain master => dac;
0.4 => master.gain;

// create our OSC receiver
OscRecv recv;
// use port 6449
7475 => recv.port;
// start listening (launch thread)
recv.listen();

// create an address in the receiver, store in new variable
recv.event( "/percussion1/press, s, f" ) @=> OscEvent oeAudienceInst2Percussion1;
recv.event( "/percussion2/press, s, f" ) @=> OscEvent oeAudienceInst2Percussion2;
recv.event( "/percussion3/press, s, f" ) @=> OscEvent oeAudienceInst2Percussion3;
recv.event( "/percussion4/press, s, f" ) @=> OscEvent oeAudienceInst2Percussion4;


fun void AudienceInst2Percussion1Handler()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oeAudienceInst2Percussion1 => now;

		// grab the next message from the queue. 
		while ( oeAudienceInst2Percussion1.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oeAudienceInst2Percussion1.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oeAudienceInst2Percussion1.getFloat() => messageValue;
			// print
			<<< "got (via OSC):", IPAddress, ",", messageValue >>>;
			// go do something...
			
            // Check for existence of instrument for this IP address
            if( instrument2Array[IPAddress] == null)
            {
                new AudienceInstrument2 @=> instrument2Array[IPAddress];
                instrument2Array[IPAddress].gain => master;
            }
            
            if (messageValue > 0)
            {
                instrument2Array[IPAddress].PlayKick();
            } else {
                instrument2Array[IPAddress].StopKick();
            }
		}
	}	
}

fun void AudienceInst2Percussion2Handler()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oeAudienceInst2Percussion2 => now;

		// grab the next message from the queue. 
		while ( oeAudienceInst2Percussion2.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oeAudienceInst2Percussion2.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oeAudienceInst2Percussion2.getFloat() => messageValue;
			// print
			<<< "got (via OSC):", IPAddress, ",", messageValue >>>;
			// go do something...
			
            // Check for existence of instrument for this IP address
            if( instrument2Array[IPAddress] == null)
            {
                new AudienceInstrument2 @=> instrument2Array[IPAddress];
                instrument2Array[IPAddress].gain => master;
            }
            if (messageValue > 0)
            {
                instrument2Array[IPAddress].PlayCowbell();
            } else {
                instrument2Array[IPAddress].StopCowbell();
            }
		}
	}	
}

fun void AudienceInst2Percussion3Handler()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oeAudienceInst2Percussion3 => now;

		// grab the next message from the queue. 
		while ( oeAudienceInst2Percussion3.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oeAudienceInst2Percussion3.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oeAudienceInst2Percussion3.getFloat() => messageValue;
			// print
			<<< "got (via OSC):", IPAddress, ",", messageValue >>>;
			// go do something...
			
            // Check for existence of instrument for this IP address
            if( instrument2Array[IPAddress] == null)
            {
                new AudienceInstrument2 @=> instrument2Array[IPAddress];
                instrument2Array[IPAddress].gain => master;
            }
            if (messageValue > 0)
            {
                instrument2Array[IPAddress].PlayClick();
            } else {
                instrument2Array[IPAddress].StopClick();
            }
		}
	}	
}

fun void AudienceInst2Percussion4Handler()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oeAudienceInst2Percussion4 => now;

		// grab the next message from the queue. 
		while ( oeAudienceInst2Percussion4.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oeAudienceInst2Percussion4.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oeAudienceInst2Percussion4.getFloat() => messageValue;
			// print
			<<< "got (via OSC):", IPAddress, ",", messageValue >>>;
			// go do something...
			
            // Check for existence of instrument for this IP address
            if( instrument2Array[IPAddress] == null)
            {
                new AudienceInstrument2 @=> instrument2Array[IPAddress];
                instrument2Array[IPAddress].gain => master;
            }
            
            if (messageValue > 0)
            {
                instrument2Array[IPAddress].PlayHiHat();
            } else {
                instrument2Array[IPAddress].StopHiHat();
            }
		}
	}	
}

// kick off event handlers

spork ~ AudienceInst2Percussion1Handler();
spork ~ AudienceInst2Percussion2Handler();
spork ~ AudienceInst2Percussion3Handler();
spork ~ AudienceInst2Percussion4Handler();

while (true)
{
    10::ms => now;
}