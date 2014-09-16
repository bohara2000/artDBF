// Audience Instrument 1

public class AudienceInstrument1
{
    Gain gain;
    Shakers shakeArray[1];
    JCRev r;
    // set the gain
    0.95 => r.gain;
    // set the reverb mix
    .2 => r.mix;
    
    
    // add default shaker
    Shakers defaultShaker;
    10 => defaultShaker.which;    
    Std.mtof( Math.random2f( 0.0, 128.0 ) ) => defaultShaker.freq;
    shakeArray << defaultShaker;
    100::ms => dur ShakerTempo;
    
    for(0 => int i; i < shakeArray.cap(); i++)
    {
        shakeArray[i] => r;
        spork ~ PlayShakersInArray(i);
    }
    
    // our patch
    r => gain;
    
    /*
    // which mouse
    2 => int mouse_dev;

    
    // hid objects
    Hid mouse;
    HidMsg msg;

    // try
    if( !mouse.openMouse( mouse_dev ) ) me.exit();
    <<< "* mouse ready...", "" >>>;
    */
    
    /* Attach shakers */
    fun void AddShaker(int presetValue)
    {        
        0 => int found;
        
        /* 
            Check whether the shaker object
            has already been created.        
        */
        for(0 => int i; i < shakeArray.cap(); i++)
        {
            if( shakeArray[i].preset() == presetValue )
            {
                1 => found;
                /*
                   Add the shaker back to the sound chain.
                 */
                shakeArray[i] => r;
                break;
            }
        }
        
        /*
            Add the shaker object if it hasn't
            been found.
        */
        if( found == 0 )
        {
            // create new shaker
            Shakers newShaker;
            presetValue => newShaker.which;
            0.2 => newShaker.energy;
            20 => newShaker.objects;
            shakeArray << newShaker;
            shakeArray[shakeArray.cap()-1] => r; 
            // start playing new shaker
            spork ~ PlayShakersInArray(shakeArray.cap()-1);
        }   
    }
    
    fun void RemoveShaker(int presetValue)
    {
        for(0 => int i; i < shakeArray.cap(); i++)
        {
            if( shakeArray[i].preset() == presetValue )
            {
                // remove that shaker from the sound chain
                shakeArray[i] !=> r;
                
                // now remove it from the array
                
                break;
            }
        }
    }
    
    /* Play Shakers in array */
    
    fun void PlayShakersInArray(int ShakerIndex)
    {
        while( true )
        {
            Math.random2f( 0.8, 1.3 ) => shakeArray[ShakerIndex].noteOn;
            // play for x time
            ShakerTempo => now;
        }  
    }
    
    /* Set number of shaker objects */
    fun void SetNumberOfObjects(float numberOfObjects)
    {
        for(0 => int i; i < shakeArray.cap(); i++)
        {
            numberOfObjects => shakeArray[i].objects;
        }
    }
    
    /* left/right adjusts frequency */
    fun void AdjustShakerFrequency(float deltaX)
    {
        for(0 => int i; i < shakeArray.cap(); i++)
        {
            Std.mtof( Math.floor( 128.0 * Std.fabs(deltaX) ) ) => shakeArray[i].freq;
        }
    }

    /* up/down adjust energy */
    fun void AdjustShakerEnergy(float deltaY)
    {
        for(0 => int i; i < shakeArray.cap(); i++)
        {
            Std.fabs(deltaY) => shakeArray[i].energy;
        }
    }
    
    /* top/bottom adjusts filter (assuming Low-Pass for now...)*/
    fun void AdjustFilter(float z)
    {
        //(z % 200)/200 => float t;
        //100 + Std.fabs(Math.sin(t)) * 5000 => f.freq;
        
        // adjust tempo
        Std.fabs(200 - z)::ms => ShakerTempo;
        
    }
}
