// mic-in to audio out

// the patch
adc  =>PitShift p=>dac;
.7=>p.shift;
0.5 => p.mix;


10::ms => dur t;
// controller
Controller uhid;


// time loop
while (true) {
    t => now;
}

class Controller
{
    // which mouse
    1 => int mouse_dev;

    // hid objects
    Hid mouse;
    HidMsg msg;

    // try
    if( !mouse.openMouse( mouse_dev ) ) me.exit();
    <<< "* mouse ready...", "" >>>;

    // launch time loop
    spork ~ time_loop();
    
    
    // time loop
    fun void time_loop() {
        float x, y;
        while( true )
        {
            // wait
            mouse => now;
            // loop over messages
            while( mouse.recv( msg ) )
            {
                if( msg.isMouseMotion() )
                {
                    // left
                    if( msg.deltaX < 0 )
                        Std.fabs(1 + 2*(-msg.deltaX)) => x;
                    // right
                    else if( msg.deltaX > 0 )
                        Std.fabs(1 + 2*(msg.deltaX)) => x;                  
                    
                    // up
                    if( msg.deltaY > 0 )
                        Std.fabs(1 + 2*(-msg.deltaY)) => y;
                    // down
                    else if( msg.deltaY < 0 )
                        Std.fabs(1 + 2*(msg.deltaY)) => y;
                    
                    <<< "x:", x, "y:", y >>>;
                }
            }
        }
    }
}