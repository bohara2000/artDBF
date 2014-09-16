// initialize.ck

// Add all classes here!

/* NOTE 7/29/14: for now we will not use the LicK library */
// Load our LicK library - for now, all of it...
//Machine.add(me.dir()+"/lick-import.ck");

// Add tempo class
Machine.add(me.dir()+"/BPM.ck");

// Add Instruments used by poet
Machine.add(me.dir()+"/PoetInstrument1.ck");
Machine.add(me.dir()+"/PoetInstrument2.ck");
Machine.add(me.dir()+"/PoetInstrument3.ck");

// Add instruments used by audience
Machine.add(me.dir()+"/AudienceInstrument1.ck");
Machine.add(me.dir()+"/AudienceInstrument2.ck");
Machine.add(me.dir()+"/AudienceInstrument3.ck");

// our score
Machine.add(me.dir()+"/score.ck");


