create(Position) :-
    (Row, Col) = Position,
    Low = 1,  
    High = 7,  
    between(Low, High, Row),  
    between(Low, High, Col).
    
    
attack((Row1, Col1), (Row2, Col2)) :-
    Row1 =:= Row2;
    Col1 =:= Col2;
    abs(Row1 - Row2) =:= abs(Col1 - Col2).