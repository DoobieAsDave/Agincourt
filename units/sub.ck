BPM tempo;

Gain master;
SinOsc voice1 => master;
PulseOsc voice2 => LPF filter => master;
master => ADSR adsr => dac;

//

1.25 => voice1.gain;

.3 => voice2.width;
.075 => voice2.gain;

70 => Std.mtof => filter.freq;
2.0 => filter.Q;
3.0 => filter.gain;

(5 :: ms, 50 :: ms, 1.0, 75 :: ms) => adsr.set;

(1.0 / 2.0) / 1.5 => master.gain;

//

float filterFreq;
function void modFileterFreq(int active, LPF filter, dur modTime, float min, float max, float amount) {
    amount => float step;
    max - min => float range;
    (range / amount) * 2 => float steps;

    if (active) {
        min => filterFreq;
    }
    else {
        filter.freq() => filterFreq;
    }

    while(true) {
        step +=> filterFreq;
        filterFreq => filter.freq;

        if (filterFreq >= max) {
            amount * -1 => step;
        }
        if (filterFreq <= min) {
            amount => step;
        }

        modTime / steps => now;
    }
}

spork ~ modFileterFreq(0, filter, (tempo.note * 8) / 3, Std.mtof(60), Std.mtof(76), 0.1);

25 => int key;
[key, key + 5, key + 8, key + 3] @=> int sequence[];

while(true) {
    for (0 => int step; step < sequence.cap(); step++) {
        sequence[step] => Std.mtof => voice1.freq;
        voice1.freq() => voice2.freq;

        tempo.quarterNote => now;
        
        1 => adsr.keyOn;
        (tempo.note - tempo.quarterNote) - adsr.releaseTime() => now;
        1 => adsr.keyOff;
        adsr.releaseTime() => now;
    }
}