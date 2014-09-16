// launch with OSC_recv.ck

// host name and port
"localhost" => string hostname;
7475 => int port;

// get command line
if( me.args() ) me.arg(0) => hostname;
if( me.args() > 1 ) me.arg(1) => Std.atoi => port;

// send object
OscSend xmit;

// aim the transmitter
xmit.setHost( hostname, port );

fun void TestAudienceUI1()
{
    // infinite time loop
    while( true )
    {
        /*
            start testing audience instrument 1
        */
        string ip;
        float temp;
        // add/remove shaker presets
        <<< "testing shaker presets" >>>;
        for (1 => int i; i <= 4; i++)
        {
            "/shakerchange" + i => string message;
            xmit.startMsg( message, "s f" );
            
            // send string arg
            "10.0.0.1" => ip;
            ip => xmit.addString;
            
            
            // add int arg
            1.0 => temp;
            temp => xmit.addFloat;
            
            // send
            //xmit.send();
            //<<< "sent", message ,"(via OSC):", ip, temp >>>;

            // advance time
            2::second => now;
            
            xmit.startMsg( message, "s f" );
            
            // send string arg
            "10.0.0.1" => ip;
            ip => xmit.addString;
            
            // add int arg
            0.0 => temp;
            temp => xmit.addFloat;
            // send
            //xmit.send();
            
            // advance time
            2::second => now;
        }
        
        <<< "testing number of shaker objects" >>>;
        // compute value that represents "5 seconds from now"
        now + 2::second => time later;
        // while we are not at later yet...
        0.0 => float t;
        while( now < later )
        {
            "/shakerobjects" => string message;
            xmit.startMsg( message, "s f" );
            
            // send string arg
            "10.0.0.1" => ip;
            ip => xmit.addString;
            
            // add int arg
            // modulate
            t % 128 => temp;
            temp => xmit.addFloat;
            t + 1.0 => t;
            <<< "sent", message ,"(via OSC):", ip, temp >>>;
            // advance time
            10::ms => now;
        }
        
        <<< "testing tilt events" >>>;
        // compute value that represents "5 seconds from now"
        now + 2::second => later;
        // while we are not at later yet...
        0.0 => t;
        while( now < later )
        {
            "/shakerstilt/x" => string message;
            xmit.startMsg( message, "s f" );
            
            // send string arg
            "10.0.0.1" => ip;
            ip => xmit.addString;
            
            // add int arg
            // modulate
            Math.sin(t) => temp;
            temp => xmit.addFloat;
            t + .02 => t;
            
            <<< "sent", message ,"(via OSC):", ip, temp >>>;
            // advance time
            10::ms => now;
        }
        
        now + 2::second => later;
        // while we are not at later yet...
        0.0 => t;
        while( now < later )
        {
            "/shakerstilt/y" => string message;
            xmit.startMsg( message, "s f" );
            
            // send string arg
            "10.0.0.1" => ip;
            ip => xmit.addString;
            
            // add int arg
            // modulate
            Math.sin(t) => temp;
            temp => xmit.addFloat;
            t + .02 => t;
            
            <<< "sent", message ,"(via OSC):", ip, temp >>>;
            // advance time
            10::ms => now;
        }
        
        now + 2::second => later;
        // while we are not at later yet...
        0.0 => t;
        while( now < later )
        {
            "/shakerstilt/z" => string message;
            xmit.startMsg( message, "s f" );
            
            // send string arg
            "10.0.0.1" => ip;
            ip => xmit.addString;
            
            // add int arg
            // modulate
            t % 128 => temp;
            temp => xmit.addFloat;
            t + 1.0 => t;
            <<< "sent", message ,"(via OSC):", ip, temp >>>;
            // advance time
            10::ms => now;
        }
        //break;
    }
}


fun void TestAudienceUI2()
{
    // infinite time loop
    while( true )
    {
        /*
            start testing audience instrument 2
        */
        xmit.startMsg( "/percussion1/press", "s f" );
        
        // send string arg
        "10.0.0.1" => string ip => xmit.addString;
        
        // add float arg
        1.0 => float temp => xmit.addFloat;
        
        // send
        //xmit.send();
        <<< "sent /percussion1/press (via OSC):", ip, temp >>>;

        // advance time
        120::ms => now;
        
        xmit.startMsg( "/percussion1/press", "s f" );
        
        // send string arg
        "10.0.0.1" => ip => xmit.addString;
        
        // add float arg
        0.0 => temp => xmit.addFloat;
        // send
        //xmit.send();
        
        xmit.startMsg( "/percussion2/press", "s f" );
        
        // send string arg
        "10.0.0.1" => ip => xmit.addString;
        
        // add float arg
        1.0 => temp => xmit.addFloat;
        
        // send
        //xmit.send();
        <<< "sent /percussion2/press (via OSC):", ip, temp >>>;

        // advance time
        120::ms => now;
        xmit.startMsg( "/percussion2/press", "s f" );
        
        // send string arg
        "10.0.0.1" => ip => xmit.addString;
        
        // add float arg
        0.0 => temp => xmit.addFloat;
        // send
        //xmit.send();
        xmit.startMsg( "/percussion3/press", "s f" );
        
        // send string arg
        "10.0.0.1" => ip => xmit.addString;
        
        // add float arg
        1.0 => temp => xmit.addFloat;
        
        // send
        //xmit.send();
        <<< "sent /percussion3/press (via OSC):", ip, temp >>>;

        // advance time
        120::ms => now;
        xmit.startMsg( "/percussion3/press", "s f" );
        
        // send string arg
        "10.0.0.1" => ip => xmit.addString;
        
        // add float arg
        0.0 => temp => xmit.addFloat;
        // send
        //xmit.send();
        
         xmit.startMsg( "/percussion4/press", "s f" );
        
        // send string arg
        "10.0.0.1" => ip => xmit.addString;
        
        // add float arg
        1.0 => temp => xmit.addFloat;
        
        // send
        //xmit.send();
        <<< "sent /percussion4/press (via OSC):", ip, temp >>>;

        // advance time
        120::ms => now;
        
        xmit.startMsg( "/percussion4/press", "s f" );
        
        // send string arg
        "10.0.0.1" => ip => xmit.addString;
        
        // add float arg
        0.0 => temp => xmit.addFloat;
        // send
        //xmit.send();
    }
}

fun void TestAudienceUI3()
{
    Hid hi;
    HidMsg msg;

    // which keyboard
    9 => int device;
    // get from command line
    if( me.args() ) me.arg(0) => Std.atoi => device;

    // open keyboard (get device number from command line)
    if( !hi.openKeyboard( device ) ) me.exit();
    <<< "keyboard '" + hi.name() + "' ready", "" >>>;

    // infinite event loop
    while( true )
    {
        // wait on event
        hi => now;

        // get one or more messages
        while( hi.recv( msg ) )
        {
            // check for action type
            if( msg.isButtonDown() )
            {
                <<< "down:", msg.which, "(code)", msg.key, "(usb key)", msg.ascii, "(ascii)" >>>;
                /*
                    start testing audience instrument 2
                */
                xmit.startMsg( "/target", "s i");
                
                // send string arg
                "10.0.0.1" => string ip => xmit.addString;
                
                // add int arg
                msg.ascii => int temp => xmit.addInt;
                
                // send
                //xmit.send();
                <<< "sent /target (via OSC):", ip, temp >>>;
            }
            
            else
            {
                //<<< "up:", msg.which, "(code)", msg.key, "(usb key)", msg.ascii, "(ascii)" >>>;
            }
        }
    }
}

//spork ~ TestAudienceUI1();
//spork ~ TestAudienceUI2();
spork ~ TestAudienceUI3();

while (true)
{
    10::ms => now;
}
