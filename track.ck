.75 => dac.gain;

BPM tempo;
tempo.setBPM(122.0);

//

//Machine.add(me.dir() + "record.ck");

Machine.add(me.dir() + "units/samples/choir.ck");
Machine.add(me.dir() + "units/wind.ck");

Machine.add(me.dir() + "drums/kick.ck");
Machine.add(me.dir() + "drums/hihat.ck");
Machine.add(me.dir() + "drums/clap.ck");
Machine.add(me.dir() + "drums/rim.ck");