transfer(1,1,monica,30638.913,-1552.48,29086.433).
transfer(1,1,john,20337.788,-253.42,20084.368   ).
transfer(1,1,mark,33331.228,-465.96,32865.268   ).
transfer(1,1,jessy,19361.277,-857.4,18503.877   ).
transfer(1,1,jessy,18503.877,-1643.52,16860.357 ).
transfer(1,1,john,20676.798,-228.49,20448.308   ).
transfer(2,2,jessy,15238.407,-1060.78,14177.627 ).
transfer(2,2,george,44214.228,-3709.37,40504.858).
transfer(2,2,mark,32865.268,-733.42,32131.848   ).
transfer(3,3,mark,36161.248,-1164.95,34996.298  ).
transfer(3,3,george,35282.768,-863.93,34418.838 ).
transfer(4,4,john,34750.818,-2769.24,31981.578  ).
transfer(4,4,mark,39420.718,-2842.18,36578.538  ).
transfer(4,4,mark,36578.538,-3619.91,32958.628  ).



total_amount([], 0). % TERMATIKOS

total_amount([ Amount | Rest  ], Sum) :- % ANADROMH
    total_amount(Rest, RestSum),
    Sum is RestSum + Amount.

total_transfer(User, Sum) :-
    findall(Amount, transfer(_, _, User, _, Amount, _), Transactions),
    total_amount(Transactions, Sum).

total_transfer_filter(User, StartTime, EndTime, Sum) :-
    findall(Amount, (transfer(Time, _, User, _, Amount, _), Time >= StartTime, Time < EndTime), Transactions),
    total_amount(Transactions, Sum).

