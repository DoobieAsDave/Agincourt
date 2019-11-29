.75 => dac.gain;

BPM tempo;
tempo.setBPM(122.0);

//

/* Machine.add(me.dir() + "drums/hihat.ck");
Machine.add(me.dir() + "drums/rim.ck");
while(true) second => now; */

int windId, choirId, choir2Id, choir3Id, kickId, hihatId, clapId, subId, rimId;

//Machine.add(me.dir() + "record.ck");

// Start

Machine.add(me.dir() + "units/wind.ck") => windId;

tempo.note * 4 => now;

Machine.add(me.dir() + "units/samples/choir.ck") => choirId;

tempo.note * 8 => now;

Machine.add(me.dir() + "units/samples/choir2.ck") => choir2Id;

tempo.note * 8 => now;

Machine.add(me.dir() + "drums/kick.ck") => kickId;
Machine.add(me.dir() + "drums/hihat.ck") => hihatId;

tempo.note * 8 => now;

Machine.add(me.dir() + "drums/clap.ck") => clapId;

tempo.note * 8 => now;

Machine.add(me.dir() + "units/sub.ck") => subId;

tempo.note * 4 => now;

Machine.add(me.dir() + "drums/rim.ck") => rimId;

tempo.note * 4 => now;

Machine.add(me.dir() + "units/samples/choir3.ck") => choir3Id;

tempo.note * 64 => now;

// start end

Machine.remove(rimId);

tempo.note * 4 => now;

Machine.remove(clapId);

tempo.note * 4 => now;

Machine.remove(kickId);

tempo.note * 4 => now;

Machine.remove(subId);

tempo.note * 4 => now;

Machine.remove(hihatId);

tempo.note * 8 => now;

Machine.remove(subId);

tempo.note * 8 => now;

Machine.remove(choirId);

tempo.note * 4 => now;

Machine.remove(choir2Id);

tempo.note * 4 => now;

Machine.remove(choir3Id);

tempo.note * 4 => now;

Machine.remove(windId);