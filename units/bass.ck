BPM tempo;

Gain master;
PulseOsc voice1 => master;
SinOsc voice2 => master;
master => ADSR adsr => LPF filter => dac;

//

.2 => voice1.width;

60 => Std.mtof => filter.freq;
2.0 => filter.Q;

(1.0 / 2.0) / 4.0 => master.gain;

//

while(true) {
    tempo.quarterNote => now;    
    32 => Std.mtof => voice1.freq;
    voice1.freq() => voice2.freq;
    
    1 => adsr.keyOn;
    tempo.quarterNote - adsr.releaseTime() => now;

    1 => adsr.keyOff;
    adsr.releaseTime() => now;
}