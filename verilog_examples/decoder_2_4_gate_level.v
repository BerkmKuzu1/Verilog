module moduleName (
input   a,
input   b,
output  c,
output  d,
output  e,
output  f
);

wire a_not, b_not;
not g1(a_not,a);
not g2(b_not,b);
and g3(c,a_not,b_not);
and g4(d,a,b_not);
and g5(e,a_not,b);
and g6(f,a,b);

endmodule