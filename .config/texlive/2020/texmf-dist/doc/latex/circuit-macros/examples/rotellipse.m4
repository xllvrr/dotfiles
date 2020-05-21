.PS
# `rotellipse.m4'
gen_init

[
    E: ellipse shaded "red" outlined "blue"
    
    A: rotellipse(1,1,outlined "red" shaded "blue") with .w at E.e
      Point_(45)
    B: rotellipse(,,dotted fill_(0.9))
    C: rotellipse(,,colored "red") with .s at last [].n
    thinlines_
    showbox_(A)
    showbox_(B)
    showbox_(C)
    thicklines_

] with .sw at 1,1

.PE
