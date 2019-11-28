BPM tempo;

Noise noise => LPF filter => Pan2 stereo => dac;

//

.05 => noise.gain;

//

float filterFreq;
float stereoPan;

function void modFilterFreq(LPF filter, dur modTime, float min, float max, float amount) {
    amount => float step;
    max - min => float range;
    (range / amount) * 2 => float steps;

    min => filterFreq;

    while(true) {
        filterFreq => filter.freq;
        step +=> filterFreq;

        if (filterFreq >= max) {
            amount * -1 => step;
        }   
        else if (filterFreq <= min) {
            amount => step;
        }

        modTime / steps => now;
    }
}
function void modStereoPan(Pan2 stereo, dur modTime, float min, float max, float amount) {
    amount => float step;
    max - min => float range;
    (range / amount) * 2 => float steps;

    min => stereoPan;

    while(true) {
        stereoPan => stereo.pan;
        step +=> stereoPan;
        
        if (stereoPan >= max) {
            amount * -1 => step;
        }
        else if (stereoPan <= min) {
            amount => step;
        }   

        modTime / steps => now;
    }
}

//

spork ~ modFilterFreq(filter, tempo.note * Math.random2f(1.5, 2.5), 60.0, 1200.0, 1.0);
spork ~ modStereoPan(stereo, tempo.note * Math.random2f(1.75, 3.25), -.5, .6, .01);

//

while(true) second => now;