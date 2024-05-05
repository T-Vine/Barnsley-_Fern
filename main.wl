$RecursionLimit = Infinity;

fa[x_, y_] := {0, 0.16*y};
fb[x_, y_] := {(0.85*x) + (0.04*y), (-0.04*x) + (0.85*y) + 1.6};
fc[x_, y_] := {(0.2*x) + (-0.26*y), (0.23*x) + (0.22*y) + 1.6};
fd[x_, y_] := {(-0.15*x) + (0.28*y), (0.26*x) + (0.24*y) + 0.44};

randomOne := fa[0.0, 0.0];
rand[x_, y_] := (
  random := RandomInteger[100];
 
  If[LessThan[1][random], randomOne := fa[x, y],
   If[LessThan[86][random], randomOne := fb[x, y],
    If[LessThan[94][random], randomOne := fc[x, y],
     If[LessThan[101][random], randomOne := fd[x, y] ]]
    ]
   ]
  );

n = 1;
x := 0.0;
y := 0.0;

p1 = {};
max = 100
Manipulate[
While[n < max,
  rand[x, y];
  x := Part[randomOne, 1];
  y := Part[randomOne, 2];
  AppendTo[p1, {x, y}];
  
  n++
  ];
  
ListPlot[p1, PlotStyle->{Green, PointSize[0.000001]}]
, {max, 10,1000000}]
