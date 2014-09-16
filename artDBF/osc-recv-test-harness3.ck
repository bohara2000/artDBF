// (launch with OSC_send.ck)

// Add instruments used by audience

// the patch
AudienceInstrument3 instrument3Array[0];


Gain master => dac;
0.2 => master.gain;

// create our OSC receiver
OscRecv recv;
// use port 6449
7475 => recv.port;
// start listening (launch thread)
recv.listen();

// create an address in the receiver, store in new variable
recv.event( "/target, s, i" ) @=> OscEvent oeAudienceInst3Type;


fun void AudienceInst3TypeHandler()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oeAudienceInst3Type => now;

		// grab the next message from the queue. 
		while ( oeAudienceInst3Type.nextMsg() != 0 )
		{ 
			string IPAddress;
			int messageValue;
			// getString fetches the expected string (as indicated by "s")
			oeAudienceInst3Type.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oeAudienceInst3Type.getInt() => messageValue;
			// print
			<<< "got (via OSC):", IPAddress, ",", messageValue >>>;
			// go do something...
			
            // Check for existence of instrument for this IP address
            if( instrument3Array[IPAddress] == null)
            {
                new AudienceInstrument3 @=> instrument3Array[IPAddress];
                instrument3Array[IPAddress].gain => master;
                0.7 => instrument3Array[IPAddress].gain.gain;
            }
            if ( messageValue != 229 ) {
                instrument3Array[IPAddress].Type(messageValue);
            }
		}
	}	
}

// kick off event handlers

spork ~ AudienceInst3TypeHandler();

while (true)
{
    10::ms => now;
}