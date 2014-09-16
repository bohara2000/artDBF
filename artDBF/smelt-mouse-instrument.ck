/*----------------------------------------------------------------------------
    S.M.E.L.T. : Small Musically Expressive Laptop Toolkit

    Copyright (c) 2007 Rebecca Fiebrink and Ge Wang.  All rights reserved.
      http://smelt.cs.princeton.edu/
      http://soundlab.cs.princeton.edu/

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
    U.S.A.
-----------------------------------------------------------------------------*/

//-----------------------------------------------------------------------------
// name: tp-cond.ck
// desc: smelt of the wind
//
// authors: Rebecca Fiebrink and Ge Wang
//
// to run (in command line chuck):
//     %> chuck tp-cond.ck
//
// to run (in miniAudicle):
//     (make sure VM is started, add the thing)
//-----------------------------------------------------------------------------

// which mouse
1 => int mouse_dev;

// filter pole
.99995 => float filter_pole;
// uniform volume scaling
25 => float volume;
// level control
1 => float level;
// filter resonance
1 => float resonance;

// hid objects
HidIn mouse;
HidMsg msg;

// try
if( !mouse.openMouse( mouse_dev ) ) me.exit();
<<< "* mouse ready...", "" >>>;

// numbers
0 => int L;
1 => int R;
2 => int U;
3 => int D;

// band map
ADSR @ playing[256];
// dir map
int dir[4];

// bands
Noise noise;
ResonZ reson;
Gain gain;
OnePole pole;
LPF lpf;
Impulse imp;
JCRev reverb;
Gain out;

// sound generation
noise => reson => gain => reverb => out => dac;
// envelope generation
imp => lpf => pole => gain;
    
// multiply here
3 => gain.op;
volume => gain.gain;

// default filter param
reson.freq( 220 );
reson.Q( 5 );

// set pole position on leaky integrator
filter_pole => pole.pole;

// set LPF cutoff to 10 Hz
10 => lpf.freq;

// reverb
.05 => reverb.mix;

// freq
75 => Std.mtof => reson.freq;
5 => reson.Q;
Math.pow(reson.Q(), .8) => reson.gain;

// infinite time loop
int i;
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
                -msg.deltaX * 4 => imp.next;
            // right
            else if( msg.deltaX > 0 )
                msg.deltaX * 4 => imp.next;

            // up
            if( msg.deltaY > 0 )
                msg.deltaY * 4 => imp.next;
            // down
            else if( msg.deltaY < 0 )
                -msg.deltaY * 4 => imp.next;
        }
    }
}
