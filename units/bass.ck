BPM tempo;

Gain master;
PulseOsc voice1 => master;
SinOsc voice2 => LPF filter => master;
master => ADSR adsr => dac;

//

.2 => voice1.width;

60 => Std.mtof => filter.freq;
5.0 => filter.Q;

(1.0 / 2.0) / 10.0 => master.gain;

//

while(true) {
    tempo.halfNote => now;    
    25 => Std.mtof => voice1.freq;
    voice1.freq() * 2 => voice2.freq;
    
    1 => adsr.keyOn;
    tempo.halfNote - adsr.releaseTime() => now;

    1 => adsr.keyOff;
    adsr.releaseTime() => now;
}