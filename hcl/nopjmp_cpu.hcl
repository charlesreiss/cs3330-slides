wire icode : 4;
wire dest : 64;
wire valP : 64;
register pP {
    thePc : 64 = 0;
}
icode = i10bytes[4..8];
dest = i10bytes[8..72];

valP = [
    icode == NOP : P_thePc + 1;
    icode == JXX : dest;
    1 : 0xBADBADBAD;
];

p_thePc = valP;
pc = P_thePc;

Stat = [
    (icode == NOP || icode == JXX) : STAT_AOK;
    icode == HALT : STAT_HLT;
    1: STAT_INS;
];
