/*
	score.ck
	
	ASSUMPTION: class files called from initialize.ck
	
*/

PoetIntrument1 poetInstrument1[];
PoetIntrument2 poetInstrument2[];
//PoetIntrument3 poetInstrument3[];


// create our OSC receiver
OscRecv recv;
// use port 7475
7475 => recv.port;
// start listening (launch thread)
recv.listen();

// create an addressess in the receiver, store in new variables

// Poet instrument events
recv.event( "/pitchShiftStart, s, f" ) @=> OscEvent oePoetInst1Toggle;
recv.event( "/pitchShiftDial, s, f" ) @=> OscEvent oePoetInst1Control;
recv.event( "/pitchFollowerStart, s, f" ) @=> OscEvent oePoetInst2Toggle;
recv.event( "/pitchFollowerDial, s, f" ) @=> OscEvent oePoetInst2Control;
recv.event( "/button3, s, f" ) @=> OscEvent oePoetInst3Toggle;
recv.event( "/dial3, s, f" ) @=> OscEvent oePoetInst3Control;

// Audience instrument events
recv.event( "/sndbuf/buf/rate, s, f" ) @=> OscEvent oeAudienceInst1Toggle;
recv.event( "/sndbuf/buf/rate, s, f" ) @=> OscEvent oeAudienceInst1Control;
recv.event( "/sndbuf/buf/rate, s, f" ) @=> OscEvent oeAudienceInst2Toggle;
recv.event( "/sndbuf/buf/rate, s, f" ) @=> OscEvent oeAudienceInst2Control;
recv.event( "/sndbuf/buf/rate, s, f" ) @=> OscEvent oeAudienceInst3Toggle;
recv.event( "/sndbuf/buf/rate, s, f" ) @=> OscEvent oeAudienceInst3Control;


/* Event handlers for Poet Instrument 1 */

fun void PoetInstrumentOneToggle()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oePoetInst1Toggle => now;

		// grab the next message from the queue. 
		while ( oePoetInst1Toggle.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oePoetInst1Toggle.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oePoetInst1Toggle.getFloat() => messageValue;
			// print
			<<< "Poet Instrument 1 - Toggle:", IPAddress, ",", messageValue >>>;
			// go do something...
            if (messageValue == 1)
            {
                 PoetIntrument1 => poetInstrument1[IPAddress];
            } else {
                poetInstrument1.Clear([IPAddress]);
            }

		}
	}
}

fun void PoetInstrumentOneDialTurn()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oePoetInst1Control => now;

		// grab the next message from the queue. 
		while ( oePoetInst1Control.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oePoetInst1Control.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oePoetInst1Control.getFloat() => messageValue;
			// print
			<<< "Poet Instrument 1 - Dial Turn:", IPAddress, ",", messageValue >>>;
			// go do something...
			
		}
	}	
}

/* Event handlers for Poet Instrument 2 */

fun void PoetInstrumentTwoToggle()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oePoetInst2Toggle => now;

		// grab the next message from the queue. 
		while ( oePoetInst2Toggle.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oePoetInst2Toggle.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oePoetInst2Toggle.getFloat() => messageValue;
			// print
			<<< "Poet Instrument 2 - Toggle:", IPAddress, ",", messageValue >>>;
			// go do something...
			if (messageValue == 1)
            {
                 PoetIntrument2 => poetInstrument2[IPAddress];
            } else {
                poetInstrument2.Clear([IPAddress]);
            }
		}
	}	
}

fun void PoetInstrumentTwoDialTurn()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oePoetInst2Control => now;

		// grab the next message from the queue. 
		while ( oePoetInst2Control.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oePoetInst2Control.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oePoetInst2Control.getFloat() => messageValue;
			// print
			<<< "Poet Instrument 2 - Dial Turn:", IPAddress, ",", messageValue >>>;
			// go do something...
			
		}
	}	
}

/* Event handlers for Poet Instrument 3 */

fun void PoetInstrumentThreeToggle()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oePoetInst3Toggle => now;

		// grab the next message from the queue. 
		while ( oePoetInst3Toggle.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oePoetInst3Toggle.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oePoetInst3Toggle.getFloat() => messageValue;
			// print
			<<< "Poet Instrument 3 - Toggle:", IPAddress, ",", messageValue >>>;
			// go do something...
            /*
			if (messageValue == 1)
            {
                 PoetIntrument3 => poetInstrument3[IPAddress];
            } else {
                poetInstrument3.Clear([IPAddress]);
            }
            */
		}
	}	
}

fun void PoetInstrumentThreeDialTurn()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oePoetInst3Control => now;

		// grab the next message from the queue. 
		while ( oePoetInst3Control.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oePoetInst3Control.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oePoetInst3Control.getFloat() => messageValue;
			// print
			<<< "Poet Instrument 3 - Dial Turn:", IPAddress, ",", messageValue >>>;
			// go do something...
			
		}
	}
}


/* Event handlers for Audience Instrument 1 */

fun void AudienceInstrumentOneToggle()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oeAudienceInst1Toggle => now;

		// grab the next message from the queue. 
		while ( oeAudienceInst1Toggle.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oeAudienceInst1Toggle.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oeAudienceInst1Toggle.getFloat() => messageValue;
			// print
			<<< "got (via OSC):", IPAddress, ",", messageValue >>>;
			// go do something...
			
		}
	}	
}

fun void AudienceInstrumentOneControlOne()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oeAudienceInst1Control => now;

		// grab the next message from the queue. 
		while ( oeAudienceInst1Control.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oeAudienceInst1Control.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oeAudienceInst1Control.getFloat() => messageValue;
			// print
			<<< "got (via OSC):", IPAddress, ",", messageValue >>>;
			// go do something...
			
		}
	}	
}

/* Event handlers for Audience Instrument 2 */

fun void AudienceInstrumentTwoToggle()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oeAudienceInst2Toggle => now;

		// grab the next message from the queue. 
		while ( oeAudienceInst2Toggle.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oeAudienceInst2Toggle.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oeAudienceInst2Toggle.getFloat() => messageValue;
			// print
			<<< "got (via OSC):", IPAddress, ",", messageValue >>>;
			// go do something...
			
		}
	}	
}

fun void AudienceInstrumentTwoControlOne()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oeAudienceInst2Control => now;

		// grab the next message from the queue. 
		while ( oeAudienceInst2Control.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oeAudienceInst2Control.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oeAudienceInst2Control.getFloat() => messageValue;
			// print
			<<< "got (via OSC):", IPAddress, ",", messageValue >>>;
			// go do something...
			
		}
	}	
}

/* Event handlers for Audience Instrument 3 */

fun void AudienceInstrumentThreeToggle()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oeAudienceInst3Toggle => now;

		// grab the next message from the queue. 
		while ( oeAudienceInst3Toggle.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oeAudienceInst3Toggle.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oeAudienceInst3Toggle.getFloat() => messageValue;
			// print
			<<< "got (via OSC):", IPAddress, ",", messageValue >>>;
			// go do something...
			
		}
	}	
}

fun void AudienceInstrumentThreeControlOne()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oeAudienceInst3Control => now;

		// grab the next message from the queue. 
		while ( oeAudienceInst3Control.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oeAudienceInst3Control.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oeAudienceInst3Control.getFloat() => messageValue;
			// print
			<<< "got (via OSC):", IPAddress, ",", messageValue >>>;
			// go do something...
			
		}
	}	
}


/* Start Listening for events */
// Poet UI events
spork ~ PoetInstrumentOneToggle();
spork ~ PoetInstrumentOneDialTurn();
spork ~ PoetInstrumentTwoToggle();
spork ~ PoetInstrumentTwoDialTurn();
spork ~ PoetInstrumentThreeToggle();
spork ~ PoetInstrumentThreeDialTurn();

// Audience UI events
spork ~ AudienceInstrumentOneToggle();
spork ~ AudienceInstrumentOneControlOne();
spork ~ AudienceInstrumentTwoToggle();
spork ~ AudienceInstrumentTwoControlOne();
spork ~ AudienceInstrumentThreeToggle();
spork ~ AudienceInstrumentThreeControlOne();

/* Start Recording */
//Machine.add(me.dir() + "/rec-audio-stereo.ck");

/* Keep score alive until manually stopped */
while (true) { 
	10::ms => now; 
}