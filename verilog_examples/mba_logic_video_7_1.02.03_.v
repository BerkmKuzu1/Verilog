module moduleName (
    input x,
    input y,
    input z,
    output f2
);
    
    //gate level design

    wire x_not;
    wire y_not;
    wire and1_out;
    wire and2_out;
    wire and3_out;

    not G1(x_not, x);
    not G2(y_not, y);
    and G3(and1_out,x_not,y_not,z);
    and G4(and2_out,x_not,z,y);
    and G5(and3_out,x,y_not);
    or G6(f2,and1_out,and2_out,and3_out);


endmodule