\version "2.25.13"

% 2 march 2026

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% http://lsr.di.unimi.it/LSR/Item?id=1026
%% see also http://lsr.di.unimi.it/LSR/Item?id=650
%% Credits PPS on Feb. 2016

%%%% Snippet start here:

%%% "arrows.ily %%%

#(define-markup-command 
  (arrow layout props 
   type ;; "open" "close" "huron" "long" "large" "wings" "relief"
   fletching? ;; #t or #f
   axis ;; X or Y
   direction ;; RIGHT or LEFT, UP or DOWN, 
   a-length ;; any number >= #0
   boldness) ;; #0 < any number < #1
  (string? boolean? ly:dir? ly:dir? number? number?)
  "Draw arrows with variable length & boldness."
  (define fletching #t)  
  (interpret-markup layout props
   (cond 
    
    ;; "open" optimal thickness #0.14
    ((and (string=? type "open")(and (eq? axis X)(eq? direction 1)))
     (if (eq? fletching fletching?)
      (markup 
       (#:override (cons (quote filled) #f)
	(#:path boldness
	 `((moveto    0.0  0.0)
	   (curveto  -0.4  0.0  -0.7  0.18  -0.94  0.44)
	   (moveto    0.0  0.0)
	   (curveto  -0.4  0.0  -0.7 -0.18  -0.94 -0.44)
	   (moveto    0.0  0.0)
	   (lineto   ,(+ (* a-length -1) 1) 0)
	   (rmoveto   1.44  0.0)
	   (rcurveto -0.4   0.0 -0.7  0.18 -0.94  0.44)
	   (rmoveto   0.94 -0.44)
	   (rcurveto -0.4   0.0 -0.7 -0.18 -0.94 -0.44)
	   (rmoveto   0.44  0.44)
	   (rcurveto -0.4   0.0 -0.7  0.18 -0.94  0.44)
	   (rmoveto   0.94 -0.44)
	   (rcurveto -0.4   0.0 -0.7 -0.18 -0.94 -0.44)
	   (rmoveto   0.44  0.44)
	   (rcurveto -0.4   0.0 -0.7  0.18 -0.94  0.44)
	   (rmoveto   0.94 -0.44)
	   (rcurveto -0.4   0.0 -0.7 -0.18 -0.94 -0.44)
	   (rmoveto   0.44  0.44)
	   (rcurveto -0.4   0.0 -0.7  0.18 -0.94  0.44)
	   (rmoveto   0.94 -0.44)
	   (rcurveto -0.4   0.0 -0.7 -0.18 -0.94 -0.44)))))
      (markup 
       (#:override (cons (quote filled) #f)
	(#:path boldness
	 `((moveto    0.0  0.0)
	   (curveto  -0.4  0.0  -0.7  0.18  -0.94  0.44)
	   (moveto    0.0  0.0)
	   (curveto  -0.4  0.0  -0.7 -0.18  -0.94 -0.44)
	   (moveto    0.0  0.0)
	   (lineto   ,(* a-length -1) 0)))))))
    
    ((and (string=? type "open")(and (eq? axis X)(eq? direction -1)))
     (if (eq? fletching fletching?)
      (markup 
       (#:override (cons (quote filled) #f)
	(#:path boldness
	 `((moveto    0.0  0.0)
	   (curveto   0.4  0.0   0.7  0.18   0.94  0.44)
	   (moveto    0.0  0.0)
	   (curveto   0.4  0.0   0.7 -0.18   0.94 -0.44)
	   (moveto    0.0  0.0)
	   (lineto   ,(- a-length 1) 0)
	   (rmoveto  -1.44   0.0)
	   (rcurveto  0.4   0.0  0.7  0.18  0.94  0.44)
	   (rmoveto  -0.94 -0.44)
	   (rcurveto  0.4   0.0  0.7 -0.18  0.94 -0.44)
	   (rmoveto  -0.44  0.44)
	   (rcurveto  0.4   0.0  0.7  0.18  0.94  0.44)
	   (rmoveto  -0.94 -0.44)
	   (rcurveto  0.4   0.0  0.7 -0.18  0.94 -0.44)
	   (rmoveto  -0.44  0.44)
	   (rcurveto  0.4   0.0  0.7  0.18  0.94  0.44)
	   (rmoveto  -0.94 -0.44)
	   (rcurveto  0.4   0.0  0.7 -0.18  0.94 -0.44)
	   (rmoveto  -0.44  0.44)
	   (rcurveto  0.4   0.0  0.7  0.18  0.94  0.44)
	   (rmoveto  -0.94 -0.44)
	   (rcurveto  0.4   0.0  0.7 -0.18  0.94 -0.44)))))
      (markup 
       (#:override (cons (quote filled) #f)
	(#:path boldness
	 `((moveto    0.0  0.0)
	   (curveto   0.4  0.0   0.7  0.18   0.94  0.44)
	   (moveto    0.0  0.0)
	   (curveto   0.4  0.0   0.7 -0.18   0.94 -0.44)
	   (moveto    0.0  0.0)
	   (lineto   ,a-length 0)))))))
    
    ((and (string=? type "open")(and (eq? axis Y)(eq? direction 1)))
     (if (eq? fletching fletching?)
      (markup 
       (#:override (cons (quote filled) #f)
	(#:path boldness
	 `((moveto    0.0  0.0)
	   (curveto   0.0 -0.4  0.18  -0.7   0.44 -0.94)
	   (moveto    0.0  0.0)
	   (curveto   0.0 -0.4 -0.18  -0.7  -0.44 -0.94)
	   (moveto    0.0  0.0)
	   (lineto    0.0  ,(+ (* a-length -1) 1))
	   (rmoveto   0.0   1.44)
	   (rcurveto  0.0  -0.4  0.18 -0.7  0.44 -0.94)
	   (rmoveto  -0.44  0.94)
	   (rcurveto  0.0  -0.4 -0.18 -0.7 -0.44 -0.94)
	   (rmoveto   0.44  0.44)
	   (rcurveto  0.0  -0.4  0.18 -0.7  0.44 -0.94)
	   (rmoveto  -0.44  0.94)
	   (rcurveto  0.0  -0.4 -0.18 -0.7 -0.44 -0.94)
	   (rmoveto   0.44  0.44)
	   (rcurveto  0.0  -0.4  0.18 -0.7  0.44 -0.94)
	   (rmoveto  -0.44  0.94)
	   (rcurveto  0.0  -0.4 -0.18 -0.7 -0.44 -0.94)
	   (rmoveto   0.44  0.44)
	   (rcurveto  0.0  -0.4  0.18 -0.7  0.44 -0.94)
	   (rmoveto  -0.44  0.94)
	   (rcurveto  0.0  -0.4 -0.18 -0.7 -0.44 -0.94)))))
      (markup 
       (#:override (cons (quote filled) #f)
	(#:path boldness
	 `((moveto    0.0  0.0)
	   (curveto   0.0 -0.4  0.18  -0.7   0.44 -0.94)
	   (moveto    0.0  0.0)
	   (curveto   0.0 -0.4 -0.18  -0.7  -0.44 -0.94)
	   (moveto    0.0  0.0)
	   (lineto    0.0 ,(* a-length -1))))))))
    
    ((and (string=? type "open")(and (eq? axis Y)(eq? direction -1)))
     (if (eq? fletching fletching?)
      (markup 
       (#:override (cons (quote filled) #f)
	(#:path boldness
	 `((moveto    0.0  0.0)
	   (curveto   0.0  0.4  0.18   0.7   0.44  0.94)
	   (moveto    0.0  0.0)
	   (curveto   0.0  0.4 -0.18   0.7  -0.44  0.94)
	   (moveto    0.0  0.0)
	   (lineto    0.0  ,(- a-length 1))
	   (rmoveto   0.0  -1.44)
	   (rcurveto  0.0   0.4  0.18  0.7  0.44  0.94)
	   (rmoveto  -0.44 -0.94)
	   (rcurveto  0.0   0.4 -0.18  0.7 -0.44  0.94)
	   (rmoveto   0.44 -0.44)
	   (rcurveto  0.0   0.4  0.18  0.7  0.44  0.94)
	   (rmoveto  -0.44 -0.94)
	   (rcurveto  0.0   0.4 -0.18  0.7 -0.44  0.94)
	   (rmoveto   0.44 -0.44)
	   (rcurveto  0.0   0.4  0.18  0.7  0.44  0.94)
	   (rmoveto  -0.44 -0.94)
	   (rcurveto  0.0   0.4 -0.18  0.7 -0.44  0.94)
	   (rmoveto   0.44 -0.44)
	   (rcurveto  0.0   0.4  0.18  0.7  0.44  0.94)
	   (rmoveto  -0.44 -0.94)
	   (rcurveto  0.0   0.4 -0.18  0.7 -0.44  0.94)))))
      (markup 
       (#:override (cons (quote filled) #f)
	(#:path boldness
	 `((moveto    0.0  0.0)
	   (curveto   0.0  0.4  0.18   0.7   0.44  0.94)
	   (moveto    0.0  0.0)
	   (curveto   0.0  0.4 -0.18   0.7  -0.44  0.94)
	   (moveto    0.0  0.0)
	   (lineto    0.0 ,a-length)))))))
    
    ;; "close" optimal thickness #0.14
    ((and (string=? type "closed")(and (eq? axis X)(eq? direction 1)))
     (if (eq? fletching fletching?)
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto    0.0   0.0)
	   (curveto  -0.06  0.00  -0.55 -0.07  -0.97 -0.47)
	   (curveto  -0.99 -0.38  -0.92 -0.20  -0.92 -0.02)
	   (lineto   ,(+ (* a-length -1) 3.03) -0.02)
	   (rcurveto -0.06  0.00  -0.55 -0.07  -0.97 -0.48)
	   (rlineto  -2.03  0.00)
	   (rcurveto  0.14  0.14   0.48  0.41   0.95  0.50)
	   (rcurveto -0.06  0.00  -0.55  0.07  -0.95  0.50)
	   (rlineto   2.03  0.00)
	   (rcurveto  0.14 -0.14   0.48 -0.41   0.95 -0.48)
	   (lineto   ,(+ (* a-length -1) 3.03)  0.02)
	   (lineto   -0.92  0.02)
	   (curveto  -0.92  0.20  -0.99  0.38  -0.97  0.47)
	   (curveto  -0.55  0.07  -0.06  0.00   0.00  0.00)))))
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto    0.0  0.0)
	   (curveto -0.06  0.00  -0.55 -0.07  -0.97 -0.47)
	   (curveto -0.99 -0.38  -0.92 -0.20  -0.92 -0.02)
	   (lineto ,(* a-length -1) -0.02)
	   (lineto ,(* a-length -1)  0.02)
	   (lineto -0.92  0.02)
	   (curveto -0.92  0.20  -0.99  0.38  -0.97  0.47)
	   (curveto -0.55  0.07  -0.06  0.00   0.00  0.00)))))))
    
    ((and (string=? type "closed")(and (eq? axis X)(eq? direction -1)))
     (if (eq? fletching fletching?)
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto    0.0   0.0)
	   (curveto   0.06  0.00  0.55  -0.07  0.97 -0.47)
	   (curveto   0.99 -0.38  0.92  -0.20  0.92 -0.02)
	   (lineto   ,(- a-length 3.03) -0.02)
	   (rcurveto  0.06  0.00  0.55  -0.07  0.97 -0.48)
	   (rlineto   2.03  0.00)
	   (rcurveto -0.14  0.14 -0.48   0.41 -0.95  0.50)
	   (rcurveto  0.06  0.00  0.55   0.07  0.95  0.50)
	   (rlineto  -2.03  0.00)
	   (rcurveto -0.14 -0.14 -0.48  -0.41 -0.95 -0.48)
	   (lineto   ,(- a-length 3.03)  0.02)
	   (lineto    0.92  0.02)
	   (curveto   0.92  0.20  0.99   0.38  0.97  0.47)
	   (curveto   0.55  0.07  0.06   0.00  0.00  0.00)))))
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto   0.0   0.0)
	   (curveto  0.06  0.00  0.55 -0.07  0.97 -0.47)
	   (curveto  0.99 -0.38  0.92 -0.20  0.92 -0.02)
	   (lineto   ,a-length -0.02)
	   (lineto   ,a-length  0.02)
	   (lineto   0.92  0.02)
	   (curveto  0.92  0.20  0.99  0.38  0.97  0.47)
	   (curveto  0.55  0.07  0.06  0.00  0.00  0.00)))))))
    
    ((and (string=? type "closed")(and (eq? axis Y)(eq? direction 1)))
     (if (eq? fletching fletching?)
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto    0.00  0.00)
	   (curveto   0.00 -0.06  -0.07 -0.55  -0.47 -0.97)
	   (curveto  -0.38 -0.99  -0.20 -0.92  -0.02 -0.92)
	   (lineto   -0.02  ,(+ (* a-length -1) 3.03))
	   (rcurveto  0.00 -0.06  -0.07 -0.55  -0.48 -0.97)
	   (rlineto   0.00 -2.03)
	   (rcurveto  0.14  0.14   0.41  0.48   0.50  0.95 )
	   (rcurveto  0.00 -0.06   0.07 -0.55   0.50 -0.95)
	   (rlineto   0.00  2.03)
	   (rcurveto -0.14  0.14  -0.41  0.48  -0.48  0.95)
	   (lineto    0.02  ,(+ (* a-length -1) 3.03))
	   (lineto    0.02 -0.92)
	   (curveto   0.20 -0.92   0.38 -0.99   0.47 -0.97)
	   (curveto   0.07 -0.55   0.00 -0.06   0.00  0.00)))))
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto   0.00  0.00)
	   (curveto  0.00 -0.06  -0.07 -0.55 -0.47 -0.97)
	   (curveto -0.38 -0.99  -0.20 -0.92 -0.02 -0.92)
	   (lineto  -0.02  ,(* a-length -1))
	   (lineto   0.02  ,(* a-length -1))
	   (lineto   0.02 -0.92 )
	   (curveto  0.20 -0.92   0.38 -0.99   0.47 -0.97)
	   (curveto  0.07 -0.55   0.00 -0.06   0.00  0.00)))))))
    
    ((and (string=? type "closed")(and (eq? axis Y)(eq? direction -1)))
     (if (eq? fletching fletching?)
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto    0.0  0.0)
	   (curveto  0.00  0.06  -0.07  0.55 -0.47  0.97)
	   (curveto -0.38  0.99  -0.20  0.92 -0.02  0.92)
	   (lineto  -0.02  ,(- a-length 3.03))
	   
	   (rcurveto  0.00  0.06  -0.07  0.55  -0.48  0.97)
	   (rlineto   0.00  2.03)
	   (rcurveto  0.14 -0.14   0.41 -0.48   0.50 -0.95 )
	   (rcurveto  0.00  0.06   0.07  0.55   0.50  0.95)
	   (rlineto   0.00 -2.03)
	   (rcurveto -0.14 -0.14  -0.41 -0.48  -0.48 -0.95)
	   
	   (lineto   0.02  ,(- a-length 3.03))
	   (lineto   0.02  0.92 )
	   (curveto  0.20  0.92   0.38  0.99   0.47  0.97)
	   (curveto  0.07  0.55   0.00  0.06   0.00  0.00)))))
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto    0.0  0.0)
	   (curveto  0.00  0.06  -0.07  0.55 -0.47  0.97)
	   (curveto -0.38  0.99  -0.20  0.92 -0.02  0.92)
	   (lineto  -0.02  ,a-length)
	   (lineto   0.02  ,a-length)
	   (lineto   0.02  0.92 )
	   (curveto  0.20  0.92   0.38  0.99   0.47  0.97)
	   (curveto  0.07  0.55   0.00  0.06   0.00  0.00)))))))    
    
    ;; "huron" optimal thickness #0.15
    ((and (string=? type "huron")(and (eq? axis X)(eq? direction 1)))
     (if (eq? fletching fletching?)
      (markup 
       (#:override (cons (quote filled) #f)
	(#:path boldness
	 `((moveto    0.0  0.0)
	   (lineto   -0.6 -0.5)
	   (moveto    0.0  0.0)
	   (lineto   -0.6  0.5)
	   (moveto    0.0  0.0)
	   (lineto   ,(+ (* a-length -1) 0.6) 0)
	   (rmoveto   1.6  0.0)
	   (rlineto  -0.6  -0.5)
	   (rmoveto   0.6   0.5)
	   (rlineto  -0.6   0.5)
	   (rmoveto   0.2  -0.5)
	   (rlineto  -0.6  -0.5)
	   (rmoveto   0.6   0.5)
	   (rlineto  -0.6   0.5)
	   (rmoveto   0.2  -0.5)
	   (rlineto  -0.6  -0.5)
	   (rmoveto   0.6   0.5)
	   (rlineto  -0.6   0.5)
	   (rmoveto   0.2  -0.5)
	   (rlineto  -0.6  -0.5)
	   (rmoveto   0.6   0.5)
	   (rlineto  -0.6   0.5)
	   (rmoveto   0.2  -0.5)
	   (rlineto  -0.6  -0.5)
	   (rmoveto   0.6   0.5)
	   (rlineto  -0.6   0.5)))))
      (markup 
       (#:override (cons (quote filled) #f)
	(#:path boldness
	 `((moveto    0.0  0.0)
	   (lineto   -0.6 -0.5)
	   (moveto    0.0  0.0)
	   (lineto   -0.6  0.5)
	   (moveto    0.0  0.0)
	   (lineto   ,(* a-length -1) 0)))))))
    
    ((and (string=? type "huron")(and (eq? axis X)(eq? direction -1)))
     (if (eq? fletching fletching?)
      (markup 
       (#:override (cons (quote filled) #f)
	(#:path boldness
	 `((moveto    0.0  0.0)
	   (lineto    0.6 -0.5)
	   (moveto    0.0  0.0)
	   (lineto    0.6  0.5)
	   (moveto    0.0  0.0)
	   (lineto   ,(- a-length 0.6) 0)
	   (rmoveto  -1.6   0.0)
	   (rlineto   0.6  -0.5)
	   (rmoveto  -0.6   0.5)
	   (rlineto   0.6   0.5)
	   (rmoveto  -0.2  -0.5)
	   (rlineto   0.6  -0.5)
	   (rmoveto  -0.6   0.5)
	   (rlineto   0.6   0.5)
	   (rmoveto  -0.2  -0.5)
	   (rlineto   0.6  -0.5)
	   (rmoveto  -0.6   0.5)
	   (rlineto   0.6   0.5)
	   (rmoveto  -0.2  -0.5)
	   (rlineto   0.6  -0.5)
	   (rmoveto  -0.6   0.5)
	   (rlineto   0.6   0.5)
	   (rmoveto  -0.2  -0.5)
	   (rlineto   0.6  -0.5)
	   (rmoveto  -0.6   0.5)
	   (rlineto   0.6   0.5)))))
      (markup 
       (#:override (cons (quote filled) #f)
	(#:path boldness
	 `((moveto    0.0  0.0)
	   (lineto    0.6 -0.5)
	   (moveto    0.0  0.0)
	   (lineto    0.6  0.5)
	   (moveto    0.0  0.0)
	   (lineto   ,a-length 0)))))))
    
    ((and (string=? type "huron")(and (eq? axis Y)(eq? direction 1)))
     (if (eq? fletching fletching?)
      (markup 
       (#:override (cons (quote filled) #f)
	(#:path boldness
	 `((moveto    0.0  0.0)
	   (lineto   -0.5 -0.6)
	   (moveto    0.0  0.0)
	   (lineto    0.5 -0.6)
	   (moveto    0.0  0.0)
	   (lineto    0.0 ,(+ (* a-length -1) 0.6))
	   (rmoveto   0.0   1.6)
	   (rlineto   -0.5 -0.6)
	   (rmoveto   0.5   0.6)
	   (rlineto   0.5  -0.6)
	   (rmoveto  -0.5   0.2)
	   (rlineto  -0.5  -0.6)
	   (rmoveto   0.5   0.6)
	   (rlineto   0.5  -0.6)
	   (rmoveto  -0.5   0.2)
	   (rlineto  -0.5  -0.6)
	   (rmoveto   0.5   0.6)
	   (rlineto   0.5  -0.6)
	   (rmoveto  -0.5   0.2)
	   (rlineto  -0.5  -0.6)
	   (rmoveto   0.5   0.6)
	   (rlineto   0.5  -0.6)
	   (rmoveto  -0.5   0.2)
	   (rlineto  -0.5  -0.6)
	   (rmoveto   0.5   0.6)
	   (rlineto   0.5  -0.6)))))
      (markup 
       (#:override (cons (quote filled) #f)
	(#:path boldness
	 `((moveto    0.0  0.0)
	   (lineto   -0.5 -0.6)
	   (moveto    0.0  0.0)
	   (lineto    0.5 -0.6)
	   (moveto    0.0  0.0)
	   (lineto    0.0 ,(* a-length -1))))))))
    
    ((and (string=? type "huron")(and (eq? axis Y)(eq? direction -1)))
     (if (eq? fletching fletching?)
      (markup 
       (#:override (cons (quote filled) #f)
	(#:path boldness
	 `((moveto    0.0  0.0)
	   (lineto   -0.5  0.6)
	   (moveto    0.0  0.0)
	   (lineto    0.5  0.6)
	   (moveto    0.0  0.0)
	   (lineto    0.0 ,(- a-length 0.6))
	   (rmoveto   0.0  -1.6)
	   (rlineto   -0.5  0.6)
	   (rmoveto   0.5  -0.6)
	   (rlineto   0.5   0.6)
	   (rmoveto  -0.5  -0.2)
	   (rlineto  -0.5   0.6)
	   (rmoveto   0.5  -0.6)
	   (rlineto   0.5   0.6)
	   (rmoveto  -0.5  -0.2)
	   (rlineto  -0.5   0.6)
	   (rmoveto   0.5  -0.6)
	   (rlineto   0.5   0.6)
	   (rmoveto  -0.5  -0.2)
	   (rlineto  -0.5   0.6)
	   (rmoveto   0.5  -0.6)
	   (rlineto   0.5   0.6)
	   (rmoveto  -0.5  -0.2)
	   (rlineto  -0.5   0.6)
	   (rmoveto   0.5  -0.6)
	   (rlineto   0.5   0.6)))))
      (markup 
       (#:override (cons (quote filled) #f)
	(#:path boldness
	 `((moveto    0.0  0.0)
	   (lineto   -0.5  0.6)
	   (moveto    0.0  0.0)
	   (lineto    0.5  0.6)
	   (moveto    0.0  0.0)
	   (lineto    0.0 ,a-length)))))))  
    
    ;; "long" optimal thickness #0.07
    ((and (string=? type "long")(and (eq? axis X)(eq? direction 1)))
     (if (eq? fletching fletching?)
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto    0.0  0.0)
	   (lineto   -2.50 -0.60)
	   (curveto  -2.40 -0.40 -2.35 -0.15 -2.35 -0.05)
	   (lineto  ,(* (- a-length 2.40) -1) -0.05)
	   (rlineto  -0.30 -0.55)
	   (rlineto  -2.10  0.00)
	   (rlineto   0.30  0.60)
	   (rlineto  -0.30  0.60)
	   (rlineto   2.10  0.00)
	   (rlineto   0.30 -0.55)
	   (lineto  ,(* (- a-length 2.40) -1)  0.05)
	   (lineto   -2.35  0.05)
	   (curveto  -2.35  0.10 -2.40  0.40 -2.50  0.60)
	   (lineto    0.00  0.00)
	   (closepath)))))
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto    0.00  0.00)
	   (lineto   -2.50 -0.60)
	   (curveto  -2.40 -0.40 -2.35 -0.15 -2.35 -0.05)
	   (lineto   ,(* a-length -1) -0.05)
	   (lineto   ,(* a-length -1)  0.05)
	   (lineto   -2.35  0.05)
	   (curveto  -2.35  0.10 -2.40  0.40 -2.50  0.60)
	   (lineto    0.00  0.00)
	   (closepath)))))))
    
    ((and (string=? type "long")(and (eq? axis X)(eq? direction -1)))
     (if (eq? fletching fletching?)
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto    0.00  0.00)
	   (lineto    2.50 -0.60)
	   (curveto   2.40 -0.40  2.35 -0.15  2.35 -0.05)
	   (lineto  ,(- a-length 2.40) -0.05)
	   (rlineto   0.30 -0.55)
	   (rlineto   2.10  0.00)
	   (rlineto  -0.30  0.60)
	   (rlineto   0.30  0.60)
	   (rlineto  -2.10  0.00)
	   (rlineto  -0.30 -0.55)
	   (lineto  ,(- a-length 2.40)  0.05)
	   (lineto    2.35  0.05)
	   (curveto   2.35  0.10  2.40  0.40  2.50  0.60)
	   (lineto    0.00  0.00)
	   (closepath)))))
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto    0.00  0.00)
	   (lineto    2.50 -0.60)
	   (curveto   2.40 -0.40  2.35 -0.15  2.35 -0.05)
	   (lineto   ,a-length -0.05)
	   (lineto   ,a-length  0.05)
	   (lineto    2.35  0.05)
	   (curveto   2.35  0.10  2.40  0.40  2.50  0.60)
	   (lineto    0.00  0.00)
	   (closepath)))))))
    
    ((and (string=? type "long")(and (eq? axis Y)(eq? direction 1)))
     (if (eq? fletching fletching?)
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto    0.00 0.00)
	   (lineto   -0.60 -2.50)
	   (curveto  -0.40 -2.40 -0.15 -2.35 -0.05 -2.35)
	   (lineto   -0.05 ,(+ (* a-length -1) 2.40))
	   (rlineto  -0.55 -0.30)
	   (rlineto   0.00 -2.10)
	   (rlineto   0.60  0.30)
	   (rlineto   0.60 -0.30)
	   (rlineto   0.00  2.10)
	   (rlineto  -0.55  0.30)
	   (lineto    0.05 ,(+ (* a-length -1) 2.40))
	   (lineto    0.05 -2.35)
	   (curveto   0.10 -2.35  0.40 -2.40  0.60 -2.50)
	   (lineto    0.00  0.00)
	   (closepath)))))
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto    0.00  0.00)
	   (lineto   -0.60 -2.50)
	   (curveto  -0.40 -2.40 -0.15 -2.35 -0.05 -2.35)
	   (lineto   -0.05 ,(* a-length -1))
	   (lineto    0.05 ,(* a-length -1))
	   (lineto    0.05 -2.35)
	   (curveto   0.10 -2.35  0.40  -2.40  0.60 -2.50)
	   (lineto    0.00  0.00)
	   (closepath)))))))
    
    ((and (string=? type "long")(and (eq? axis Y)(eq? direction -1)))
     (if (eq? fletching fletching?)
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto    0.00  0.00)
	   (lineto   -0.60  2.50)
	   (curveto  -0.40  2.40  -0.15  2.35 -0.05 2.35)
	   (lineto   -0.05 ,(- a-length 2.40))
	   (rlineto  -0.55  0.30)
	   (rlineto   0.00  2.10)
	   (rlineto   0.60 -0.30)
	   (rlineto   0.60  0.30)
	   (rlineto   0.00 -2.10)
	   (rlineto  -0.55 -0.30)
	   (lineto    0.05 ,(- a-length 2.40))
	   (lineto    0.05  2.35)
	   (curveto   0.10  2.35  0.40  2.40  0.60 2.50)
	   (lineto    0.00  0.00)
	   (closepath)))))
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto    0.00  0.00)
	   (lineto    -0.60 2.50)
	   (curveto  -0.40   2.40 -0.15  2.35 -0.05 2.35)
	   (lineto   -0.05 ,a-length)
	   (lineto    0.05 ,a-length)
	   (lineto    0.05  2.35)
	   (curveto    0.10  2.35  0.40  2.40  0.60 2.50)
	   (lineto    0.00  0.00)
	   (closepath)))))))
    
    ;; "large" optimal thickness #0.07
    ((and (string=? type "large")(and (eq? axis X)(eq? direction 1)))
     (if (eq? fletching fletching?)
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto    0.0  0.0)
	   (lineto  -1.5  2.0)
	   (lineto  -1.5  1.0)
	   (lineto  ,(* a-length -1)  1.5)
	   (rlineto  1.0 -1.5)
	   (rlineto -1.0 -1.5)
	   (lineto  ,(* a-length -1) -1.5)
	   (lineto  -1.5 -1.0)
	   (lineto  -1.5 -2.0)
	   (lineto   0.0  0.0)
	   (closepath)))))
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto  0.0  0.0)
	   (lineto -1.5  2.0)
	   (lineto -1.5  1.0)
	   (lineto ,(* a-length -1)  1.5)
	   (lineto ,(* a-length -1) -1.5)
	   (lineto -1.5 -1.0)
	   (lineto -1.5 -2.0)
	   (lineto  0.0  0.0)
	   (closepath)))))))
    
    ((and (string=? type "large")(and (eq? axis X)(eq? direction -1)))
     (if (eq? fletching fletching?)
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto   0.0  0.0)
	   (lineto   1.5  2.0)
	   (lineto   1.5  1.0)
	   (lineto  ,a-length  1.5)
	   (rlineto -1.0 -1.5)
	   (rlineto  1.0 -1.5)
	   (lineto  ,a-length -1.5)
	   (lineto   1.5 -1.0)
	   (lineto   1.5 -2.0)
	   (lineto   0.0  0.0)
	   (closepath)))))
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto  0.0  0.0)
	   (lineto  1.5  2.0)
	   (lineto  1.5  1.0)
	   (lineto ,a-length  1.5)
	   (lineto ,a-length -1.5)
	   (lineto  1.5 -1.0)
	   (lineto  1.5 -2.0)
	   (lineto  0.0  0.0)
	   (closepath)))))))
    
    ((and (string=? type "large")(and (eq? axis Y)(eq? direction 1)))
     (if (eq? fletching fletching?)
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto   0.0  0.0)
	   (lineto   2.0 -1.5)
	   (lineto   1.0 -1.5)
	   (lineto   1.5 ,(* a-length -1))
	   (rlineto -1.5  1.0)
	   (rlineto -1.5 -1.0)
	   (lineto  -1.5 ,(* a-length -1))
	   (lineto  -1.0 -1.5)
	   (lineto  -2.0 -1.5)
	   (lineto   0.0  0.0)
	   (closepath)))))
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto  0.0  0.0)
	   (lineto  2.0 -1.5)
	   (lineto  1.0 -1.5)
	   (lineto  1.5 ,(* a-length -1))
	   (lineto -1.5 ,(* a-length -1))
	   (lineto -1.0 -1.5)
	   (lineto -2.0 -1.5)
	   (lineto  0.0  0.0)
	   (closepath)))))))
    
    ((and (string=? type "large")(and (eq? axis Y)(eq? direction -1)))
     (if (eq? fletching fletching?)
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto   0.0  0.0)
	   (lineto   2.0  1.5)
	   (lineto   1.0  1.5)
	   (lineto   1.5 ,a-length)
	   (rlineto -1.5 -1.0)
	   (rlineto -1.5  1.0)
	   (lineto  -1.5 ,a-length)
	   (lineto  -1.0  1.5)
	   (lineto  -2.0  1.5)
	   (lineto   0.0  0.0)
	   (closepath)))))
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto  0.0  0.0)
	   (lineto  2.0  1.5)
	   (lineto  1.0  1.5)
	   (lineto  1.5 ,a-length)
	   (lineto -1.5 ,a-length)
	   (lineto -1.0  1.5)
	   (lineto -2.0  1.5)
	   (lineto  0.0  0.0)
	   (closepath)))))))
    
    ;; "wings" optimal thickness #0.1
    ((and (string=? type "wings")(and (eq? axis X)(eq? direction 1)))
     (if (eq? fletching fletching?)
      (markup 
       (#:override (cons (quote filled) #f)
	(#:path boldness
	 `((moveto   0.00  0.00)
	   (lineto  -1.40  1.40)
	   (lineto  -2.00  1.40)
	   (lineto  -0.87  0.23)
	   (lineto  ,(* (- a-length 3.88) -1)  0.22)
	   (lineto  ,(* (- a-length 2.80) -1)  1.40)
	   (lineto  ,(* (- a-length 2.20) -1)  1.40)
	   (lineto  ,(* (- a-length 3.40) -1)  0.00)
	   (lineto  ,(* (- a-length 2.20) -1) -1.40)
	   (lineto  ,(* (- a-length 2.80) -1) -1.40)
	   (lineto  ,(* (- a-length 3.88) -1) -0.22)
	   (lineto  ,(* (- a-length 3.88) -1) -0.22)
	   (lineto  -0.87 -0.22)
	   (lineto  -2.0 -1.40)
	   (lineto  -1.40 -1.40)
	   (closepath)
	   (moveto  ,(* (- a-length 2.90) -1)  0.00)
	   (rlineto -1.20  1.40)
	   (rlineto -0.60  0.00)
	   (rlineto  1.20 -1.40)
	   (rlineto -1.20 -1.40)
	   (rlineto  0.60  0.00)
	   (rlineto  1.20  1.40)
	   (rmoveto -1.10  0.00)
	   (rlineto -1.20  1.40)
	   (rlineto -0.60  0.00)
	   (rlineto  1.20 -1.40)
	   (rlineto -1.20 -1.40)
	   (rlineto  0.60  0.00)
	   (rlineto  1.20  1.40)
	   (closepath)))))
      (markup 
       (#:override (cons (quote filled) #f)
	(#:path boldness
	 `((moveto   0.00  0.00)
	   (lineto  -1.40  1.40)
	   (lineto  -2.00  1.40)
	   (lineto  -0.87  0.23)
	   (lineto  ,(* a-length -1)  0.22)
	   (lineto  ,(* a-length -1) -0.22)
	   (lineto  -0.87 -0.22)
	   (lineto  -2.00 -1.40)
	   (lineto  -1.40 -1.40)
	   (closepath)))))))
    
    ((and (string=? type "wings")(and (eq? axis X)(eq? direction -1)))
     (if (eq? fletching fletching?)
      (markup 
       (#:override (cons (quote filled) #f)
	(#:path boldness
	 `((moveto  -0.00  0.00)
	   (lineto   1.40  1.40)
	   (lineto   2.00  1.40)
	   (lineto   0.87  0.23)
	   (lineto  ,(- a-length 3.88)  0.22)
	   (lineto  ,(- a-length 2.80)  1.40)
	   (lineto  ,(- a-length 2.20)  1.40)
	   (lineto  ,(- a-length 3.40)  0.00)
	   (lineto  ,(- a-length 2.20) -1.40)
	   (lineto  ,(- a-length 2.80) -1.40)
	   (lineto  ,(- a-length 3.88) -0.22)
	   (lineto  ,(- a-length 3.88) -0.22)
	   (lineto   0.87 -0.22)
	   (lineto   2.0 -1.40)
	   (lineto   1.40 -1.40)
	   (closepath)
	   (moveto  ,(- a-length 2.90)  0.00)
	   (rlineto  1.20  1.40)
	   (rlineto  0.60  0.00)
	   (rlineto -1.20 -1.40)
	   (rlineto  1.20 -1.40)
	   (rlineto -0.60  0.00)
	   (rlineto -1.20  1.40)
	   (rmoveto  1.10  0.00)
	   (rlineto  1.20  1.40)
	   (rlineto  0.60  0.00)
	   (rlineto -1.20 -1.40)
	   (rlineto  1.20 -1.40)
	   (rlineto -0.60  0.00)
	   (rlineto -1.20  1.40)
	   (closepath)))))
      (markup 
       (#:override (cons (quote filled) #f)
	(#:path boldness
	 `((moveto   0.00  0.00)
	   (lineto   1.40  1.40)
	   (lineto   2.00  1.40)
	   (lineto   0.87  0.23)
	   (lineto  ,a-length  0.22)
	   (lineto  ,a-length -0.22)
	   (lineto   0.87 -0.22)
	   (lineto   2.00 -1.40)
	   (lineto   1.40 -1.40)
	   (closepath)))))))
    
    ((and (string=? type "wings")(and (eq? axis Y)(eq? direction 1)))
     (if (eq? fletching fletching?)
      (markup 
       (#:override (cons (quote filled) #f)
	(#:path boldness
	 `((moveto  0.00  0.00)
	   (lineto  1.40 -1.40)
	   (lineto  1.40 -2.00)
	   (lineto  0.23 -0.87)
	   (lineto  0.22 ,(* (- a-length 3.88) -1))
	   (lineto  1.40 ,(* (- a-length 2.80) -1))
	   (lineto  1.40 ,(* (- a-length 2.20) -1))
	   (lineto  0.00 ,(* (- a-length 3.40) -1))
	   (lineto -1.40 ,(* (- a-length 2.20) -1))
	   (lineto -1.40 ,(* (- a-length 2.80) -1))
	   (lineto -0.22 ,(* (- a-length 3.88) -1))
	   (lineto -0.22 ,(* (- a-length 3.88) -1))
	   (lineto -0.22 -0.87)
	   (lineto -1.40 -2.0)
	   (lineto -1.40 -1.40)
	   (closepath)
	   (moveto   0.00 ,(* (- a-length 2.90) -1))
	   (rlineto  1.40 -1.20)
	   (rlineto  0.00 -0.60)
	   (rlineto -1.40  1.20)
	   (rlineto -1.40 -1.20)
	   (rlineto  0.00  0.60)
	   (rlineto  1.40  1.20)
	   (rmoveto  0.00 -1.10)
	   (rlineto  1.40 -1.20)
	   (rlineto  0.00 -0.60)
	   (rlineto -1.40  1.20)
	   (rlineto -1.40 -1.20)
	   (rlineto  0.00  0.60)
	   (rlineto  1.40  1.20)
	   (closepath)))))
      (markup 
       (#:override (cons (quote filled) #f)
	(#:path boldness
	 `((moveto  0.00  0.00)
	   (lineto  1.40 -1.40)
	   (lineto  1.40 -2.00)
	   (lineto  0.23 -0.87)
	   (lineto  0.22 ,(* a-length -1))
	   (lineto -0.22 ,(* a-length -1))
	   (lineto -0.22 -0.87)
	   (lineto -1.40 -2.00)
	   (lineto -1.40 -1.40)
	   (closepath)))))))
    
    ((and (string=? type "wings")(and (eq? axis Y)(eq? direction -1)))
     (if (eq? fletching fletching?)
      (markup 
       (#:override (cons (quote filled) #f)
	(#:path boldness
	 `((moveto  0.00  0.00)
	   (lineto  1.40  1.40)
	   (lineto  1.40  2.00)
	   (lineto  0.23  0.87)
	   (lineto  0.22 ,(- a-length 3.88))
	   (lineto  1.40 ,(- a-length 2.80))
	   (lineto  1.40 ,(- a-length 2.20))
	   (lineto  0.00 ,(- a-length 3.40))
	   (lineto -1.40 ,(- a-length 2.20))
	   (lineto -1.40 ,(- a-length 2.80))
	   (lineto -0.22 ,(- a-length 3.88))
	   (lineto -0.22 ,(- a-length 3.88))
	   (lineto -0.22  0.87)
	   (lineto -1.40  2.00)
	   (lineto -1.40  1.40)
	   (closepath)
	   (moveto   0.00 ,(- a-length 2.90))
	   (rlineto  1.40  1.20)
	   (rlineto  0.00  0.60)
	   (rlineto -1.40 -1.20)
	   (rlineto -1.40  1.20)
	   (rlineto  0.00 -0.60)
	   (rlineto  1.40 -1.20)
	   (rmoveto  0.00  1.10)
	   (rlineto  1.40  1.20)
	   (rlineto  0.00  0.60)
	   (rlineto -1.40 -1.20)
	   (rlineto -1.40  1.20)
	   (rlineto  0.00 -0.60)
	   (rlineto  1.40 -1.20)
	   (closepath)))))
      (markup 
       (#:override (cons (quote filled) #f)
	(#:path boldness
	 `((moveto  0.00  0.00)
	   (lineto  1.40  1.40)
	   (lineto  1.40  2.00)
	   (lineto  0.23  0.87)
	   (lineto  0.22 ,a-length)
	   (lineto -0.22 ,a-length)
	   (lineto -0.22  0.87)
	   (lineto -1.40  2.00)
	   (lineto -1.40  1.40)
	   (closepath))))))) 
    
    ;; "relief" optimal thickness #0.01
    ((and (string=? type "relief")(and (eq? axis X)(eq? direction 1)))
     (if (eq? fletching fletching?)
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto   0.00  0.00)
	   (lineto  -3.00  1.00)
	   (lineto  -1.50  0.00)
	   (lineto  -2.15  0.00)
	   (curveto -2.15 -0.15 -2.30 -0.15 -2.30 -0.15)
	   (lineto  -3.00 -1.00)
	   (lineto  -1.50  0.00)
	   (closepath)
	   (lineto  -3.00 -1.00)
	   (lineto   0.00  0.00)
	   (closepath)
	   (moveto  -2.00  0.00)
	   (lineto  ,(* (- a-length 0.30) -1)  0.00)
	   (lineto  ,(* (- a-length 0.30) -1)  0.15)
	   (rlineto  0.70  0.00)
	   (rlineto -1.00  0.85)
	   (rlineto  0.50 -0.85)
	   (rlineto -0.50  0.85)
	   (rlineto  2.50  0.00)
	   (rlineto  1.00 -0.85)
	   (lineto  -2.30  0.15)
	   (lineto  -3.00  1.00)
	   (lineto  -2.30  0.15)
	   (curveto -2.20  0.15 -2.15  0.10 -2.15  0.00)
	   (closepath)
	   (moveto  -2.30 -0.15)
	   (lineto  ,(* (- a-length 0.30) -1) -0.15)
	   (lineto  ,(* (- a-length 0.30) -1)  0.00)
	   (lineto  ,(* (- a-length 0.30) -1) -0.15)
	   (rmoveto  0.70  0.00)
	   (rlineto -1.00 -0.85)
	   (rlineto  0.50  0.85)
	   (rlineto  0.50  0.00)
	   (rmoveto -1.00 -0.85)
	   (rlineto  2.50  0.00)
	   (rlineto  1.00  0.85)
	   (rlineto -1.00 -0.85)
	   (closepath)))))
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto   0.00  0.00)
	   (lineto  -3.00  1.00)
	   (lineto  -1.50  0.00)
	   (lineto  -2.15  0.00)
	   (curveto -2.15 -0.15 -2.30 -0.15  -2.30 -0.15)
	   (lineto  -3.00 -1.00)
	   (lineto  -1.50  0.00)
	   (closepath)
	   (lineto  -3.00 -1.00)
	   (lineto   0.00  0.00)
	   (closepath)
	   (moveto  -2.00  0.00)
	   (lineto ,(* (- a-length 0.30) -1)  0.00)
	   (lineto ,(* (- a-length 0.30) -1)  0.15)
	   (lineto  -2.30  0.15)
	   (lineto  -3.00  1.00)
	   (lineto  -2.30  0.15)
	   (curveto -2.20  0.15  -2.15  0.10  -2.15  0.00)
	   (closepath)
	   (moveto  -2.30 -0.15)
	   (lineto ,(* (- a-length 0.30) -1) -0.15)
	   (lineto ,(* (- a-length 0.30) -1)  0.00)
	   (lineto ,(* (- a-length 0.30) -1) -0.15)
	   (closepath)))))))
    
    ((and (string=? type "relief")(and (eq? axis X)(eq? direction -1)))
     (if (eq? fletching fletching?)
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto   0.00  0.00)
	   (lineto   3.00  1.00)
	   (lineto   1.50  0.00)
	   (lineto   2.15  0.00)
	   (curveto  2.15 -0.15  2.30 -0.15 2.30 -0.15)
	   (lineto   3.00 -1.00)
	   (lineto   1.50  0.00)
	   (closepath)
	   (lineto   3.00 -1.00)
	   (lineto   0.00  0.00)
	   (closepath)
	   (moveto   2.00  0.00)
	   (lineto  ,(- a-length 0.30)  0.00)
	   (lineto  ,(- a-length 0.30)  0.15)
	   (rlineto -0.70  0.00)
	   (rlineto  1.00  0.85)
	   (rlineto -0.50 -0.85)
	   (rlineto  0.50  0.85)
	   (rlineto -2.50  0.00)
	   (rlineto -1.00 -0.85)
	   (lineto   2.30  0.15)
	   (lineto   3.00  1.00)
	   (lineto   2.30  0.15)
	   (curveto  2.20  0.15  2.15  0.10  2.15  0.00)
	   (closepath)
	   (moveto   2.30 -0.15)
	   (lineto  ,(- a-length 0.30) -0.15)
	   (lineto  ,(- a-length 0.30)  0.00) 
	   (lineto  ,(- a-length 0.30) -0.15)
	   (rmoveto -0.70  0.00)
	   (rlineto  1.00 -0.85)
	   (rlineto -0.50  0.85)
	   (rlineto -0.50  0.00)
	   (rmoveto  1.00 -0.85)
	   (rlineto -2.50  0.00)
	   (rlineto -1.00  0.85)
	   (rlineto  1.00 -0.85)
	   (closepath)))))
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto  0.00  0.00)
	   (lineto  3.00  1.00)
	   (lineto  1.50  0.00)
	   (lineto  2.15  0.00)
	   (curveto 2.15 -0.15  2.30 -0.15 2.30 -0.15)
	   (lineto  3.00 -1.00)
	   (lineto  1.50  0.00)
	   (closepath)
	   (lineto  3.00 -1.00)
	   (lineto  0.00  0.00)
	   (closepath)
	   (moveto  2.00  0.00)
	   (lineto ,a-length  0.00)
	   (lineto ,a-length  0.15)
	   (lineto  2.30  0.15)
	   (lineto  3.00  1.00)
	   (lineto  2.30  0.15)
	   (curveto 2.20  0.15  2.15  0.10  2.15  0.00)
	   (closepath)
	   (moveto  2.30 -0.15)
	   (lineto ,a-length -0.15)
	   (lineto ,a-length  0.00)
	   (lineto ,a-length -0.15)
	   (closepath)))))))
    
    ((and (string=? type "relief")(and (eq? axis Y)(eq? direction 1)))
     (if (eq? fletching fletching?)
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto   0.00   0.00)
	   (lineto   1.00  -3.00)
	   (lineto   0.00  -1.50)
	   (lineto   0.00  -2.15)
	   (curveto -0.15  -2.15 -0.15 -2.30 -0.15 -2.30)
	   (lineto  -1.00  -3.00)
	   (lineto   0.00  -1.50)
	   (closepath)
	   (lineto  -1.00 -3.00)
	   (lineto   0.00  0.00)
	   (closepath)
	   (moveto   0.00 -2.00)
	   (lineto   0.00 ,(* (- a-length 0.30) -1))
	   (lineto   0.15 ,(* (- a-length 0.30) -1))
	   (rlineto  0.00  0.70)
	   (rlineto  0.85 -1.00)
	   (rlineto -0.85  0.50)
	   (rlineto  0.85 -0.50)
	   (rlineto  0.00  2.50)
	   (rlineto -0.85  1.00)
	   (lineto   0.15 -2.30)
	   (lineto   1.00 -3.00)
	   (lineto   0.15 -2.30)
	   (curveto  0.15 -2.20  0.10 -2.15  0.00 -2.15)
	   (closepath)
	   (moveto  -0.15  -2.30)
	   (lineto  -0.15  ,(* (- a-length 0.30) -1))
	   (lineto   0.00  ,(* (- a-length 0.30) -1))
	   (lineto  -0.15  ,(* (- a-length 0.30) -1))
	   (rmoveto  0.00  0.70)
	   (rlineto -0.85 -1.00)
	   (rlineto  0.85  0.50)
	   (rlineto  0.00  0.50)
	   (rmoveto -0.85 -1.00)
	   (rlineto  0.00  2.50)
	   (rlineto  0.85  1.00)
	   (rlineto -0.85 -1.00)
	   (closepath)))))
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto   0.00  0.00)
	   (lineto   1.00 -3.00)
	   (lineto   0.00 -1.50)
	   (lineto   0.00 -2.15)
	   (curveto -0.15 -2.15 -0.15 -2.30 -0.15  -2.30)
	   (lineto  -1.00 -3.00)
	   (lineto   0.00 -1.50)
	   (closepath)
	   (lineto  -1.00 -3.00)
	   (lineto   0.00  0.00)
	   (closepath)
	   (moveto   0.00 -2.00)
	   (lineto   0.00 ,(* (- a-length 0.30) -1))
	   (lineto   0.15 ,(* (- a-length 0.30) -1))
	   (lineto   0.15 -2.30)
	   (lineto   1.00 -3.00)
	   (lineto   0.15 -2.30)
	   (curveto  0.15 -2.20  0.10  -2.15  0.00  -2.15)
	   (closepath)
	   (moveto  -0.15 -2.30)
	   (lineto  -0.15 ,(* (- a-length 0.30) -1))
	   (lineto   0.00 ,(* (- a-length 0.30) -1))
	   (lineto  -0.15 ,(* (- a-length 0.30) -1))
	   (closepath)))))))
    
    ((and (string=? type "relief")(and (eq? axis Y)(eq? direction -1)))
     (if (eq? fletching fletching?)
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto   0.00  -0.00)
	   (lineto   1.00   3.00)
	   (lineto   0.00   1.50)
	   (lineto   0.00   2.15)
	   (curveto -0.15   2.15 -0.15  2.30 -0.15  2.30)
	   (lineto  -1.00   3.00)
	   (lineto   0.00   1.50)
	   (closepath)
	   (lineto  -1.00  3.00)
	   (lineto   0.00  0.00)
	   (closepath)
	   (moveto   0.00  2.00)
	   (lineto   0.00 ,(- a-length 0.30))
	   (lineto   0.15 ,(- a-length 0.30))
	   (rlineto  0.00 -0.70)
	   (rlineto  0.85  1.00)
	   (rlineto -0.85 -0.50)
	   (rlineto  0.85  0.50)
	   (rlineto  0.00 -2.50)
	   (rlineto -0.85 -1.00)
	   (lineto   0.15  2.30)
	   (lineto   1.00  3.00)
	   (lineto   0.15  2.30)
	   (curveto  0.15  2.20  0.10  2.15  0.00  2.15)
	   (closepath)
	   (moveto  -0.15   2.30)
	   (lineto  -0.15  ,(- a-length 0.30))
	   (lineto   0.00  ,(- a-length 0.30))
	   (lineto  -0.15  ,(- a-length 0.30))
	   (rmoveto  0.00 -0.70)
	   (rlineto -0.85  1.00)
	   (rlineto  0.85 -0.50)
	   (rlineto  0.00 -0.50)
	   (rmoveto -0.85  1.00)
	   (rlineto  0.00 -2.50)
	   (rlineto  0.85 -1.00)
	   (rlineto -0.85  1.00)
	   (closepath)))))
      (markup 
       (#:override (cons (quote filled) #t)
	(#:path boldness
	 `((moveto   0.00  0.00)
	   (lineto   1.00  3.00)
	   (lineto   0.00  1.50)
	   (lineto   0.00  2.15)
	   (curveto -0.15  2.15 -0.15  2.30 -0.15  2.30)
	   (lineto  -1.00  3.00)
	   (lineto   0.00  1.50)
	   (closepath)
	   (lineto  -1.00  3.00)
	   (lineto   0.00  0.00)
	   (closepath)
	   (moveto   0.00  2.00)
	   (lineto   0.00 ,(- a-length 0.30))
	   (lineto   0.15 ,(- a-length 0.30))
	   (lineto   0.15  2.30)
	   (lineto   1.00  3.00)
	   (lineto   0.15  2.30)
	   (curveto  0.15  2.20  0.10   2.15  0.00  2.15)
	   (closepath)
	   (moveto  -0.15  2.30)
	   (lineto  -0.15 ,(- a-length 0.30))
	   (lineto   0.00 ,(- a-length 0.30))
	   (lineto  -0.15 ,(- a-length 0.30))
	   (closepath)))))))
    
    (else (ly:error "Arrows' parameter(s) do not fit")))))
				  
%%% end "arrows.ily %%%
				  
%%% The syntax is :
%%% \arrow #'type #'fletching #'axis #'direction #'length #'boldness
				  
\header {
  title =  "Meditation 3"
  composer =  "Yann Ics"
  subtitle =  " "
  subsubtitle =  " "
  tagline = \markup { \teeny \typewriter "Copyleft March 2026" }
}


\markup {
  \column {
    \vspace #0.5
    \line  \smallCaps { Lament of the Soul }
    \wordwrap \italic \small { 
      La partie quatuor à cordes peut être jouée seule à l'instar d'une coda dans la continuité de la méditation 1. Aussi et ainsi, la partie de la grande cornemuse (appelée pìob-mhòr en gaélique et notée en A) peut être jouée solo. Le tempo est purement indicatif et doit être adapté au jeu du sonneur.
    }
    \vspace #0.5
    \wordwrap \italic \small { 
      Le point d'orgue de la mesure 8 est à l'instar des G.P. de la première méditation, 
      une suspension du temps, traduit par une longue prise d'archet du violoncelliste, suivie respectivement par l'alto 2, 1 et violon jusqu'à l'extrême pointe, marquée par une césure avant de relancer l'archet de la pointe.
    }
  }
}
				  
\markup \vspace #0.5

PartPOneVoiceOne =  \relative d'' {
  \clef "treble"
  \time 2/2
  \key c \major | % 1
  \tempo "Lento" 2 = 56
  \override Score.MetronomeMark.padding = #2
  R1*6  | % 7
  \appoggiatura {  \small \stemUp d16 } es1 ~ \downbow _\f | % 8
  \break
  es1\> ^\fermata \breathe  | % 9
  \tempo 2=70 d1\< \upbow _\mp  | % 10
  f1\!  | % 11
  es,1 | % 12
  r2 \stemUp g2 ~ \upbow _\ppp\<  | % 13
  \stemUp g2 \stemUp as2  _\f | % 14
  \stemUp a2 \stemDown c2  | % 15
  \stemDown bes2 r2 | % 16
  R1 | % 17
  bes,1 ~ \upbow _\ppp\<  | % 18
  \stemUp bes2   _\f\> aes2_\mp | % 19
  R1 | % 20
  bes''1 ~ _\p\<  | % 21
  \stemDown bes2\! r2   | % 22
  bes1 _\mf\<  | % 23
  as1  _\f | % 24
  c1 | % 25
  bes1 | % 26 
}
				  
PartPTwoVoiceOne =  \relative e {
  \clef "alto"
  \time 2/2
  \key c \major | % 1
  r2. \stemUp e8 -. -> _\mp r8 | % 2
  R1 | % 3
  r4 \stemUp e8 -. -> r8 r2 | % 4
  r2. \stemUp e8 -. -> r8 | % 5
  R1 | % 6
  r4 \stemDown c'2. ~ \downbow _\f  | % 7
  \key c \major c1 ~ | % 8
  c1\> ^\fermata \breathe  | % 9
  bes1~ \< \upbow _\mp  | % 10
  bes1\! | % 11
  R1 | % 12
  \stemUp bes8 ^"pizz."  r8 r4 r2 | % 13
  bes1 ~ \upbow _\ppp\< ^ "arco"  | % 14
  \stemUp bes2   _\f  r2| % 15
  R1 | % 16
  \stemUp c,8  ^"pizz." r8 r4 r2 | % 17
  f'1 ~ \upbow _\ppp\< ^ "arco"  | % 18
  \stemDown f2   _\f r2 | % 19
  r2 \stemUp f,8  ^"pizz." _\mp r4. | % 20
  R1*2  | % 22
  r2 \stemDown d'8   r4. | % 23
  r2 \stemDown d8   r4. | % 24
  r2 \stemDown c8   r4. | % 25
  bes1 ^ "arco" | % 26
  r2 \stemDown c'2 ~ _\mp | % 27
  \stemDown c2 \stemDown es2 ~ | % 28
  \stemDown es2 \stemDown f2 ~ | % 29
  \stemDown f2 r2  | % 30
}
				  
PartPThreeVoiceOne =  \relative c {
  \clef "alto"
  \time 2/2
  \key c \major | % 1
  r2. \stemUp c8 -. -> _\mp r8 | % 2
  R1 | % 3
  r4 \stemUp c8 -. -> r8 r2 | % 4
  r2. \stemUp c8 -. -> r8 | % 5
  r2. \stemDown d'4 ~ \downbow _\f | % 6
  d1 ~  | % 7
  \key c \major d1 ~ | % 8
  d1\> ^\fermata \breathe  | % 9
  d1\< \upbow  _\mp  | % 10
  f1\!  | % 11
  bes,1 | % 12
  R1 | % 13
  f1 ~ \upbow _\ppp\<  | % 14
  \stemUp f2  _\f r2  | % 15
  R1 | % 16
  \stemUp es8  ^"pizz." r8 r4 r2 | % 17
  \stemDown es'2 ^ "arco" \stemDown d2 | % 18
  \stemDown cis2 \stemDown d2 | % 19
  r2 \stemUp as8  ^"pizz." _\mp r4. | % 20
  R1*2  | % 22
  r2 \stemDown g'8   r4. | % 23
  r2 \stemDown f8  r4. | % 24
  r2 \stemDown es8  r4. | % 25
  \stemDown d2 ^ "arco" \stemUp bes2 | % 26
  r2 \stemUp bes2 ~ _\mp | % 27
  \stemUp bes2 \stemUp as2  | % 28
  \stemDown bes'2 ~ \stemDown bes2 ~ | % 29
  \stemDown bes2 r2  | % 30
}

PartPFourVoiceOne =  \relative c, {
  \clef "bass"
  \time 2/2
  \key c \major | % 1
  R1*4 | % 5
  \stemUp c2 ~ \downbow _\f \stemUp c8 ~ \stemUp <c c'>4. ~ -> ~ | % 6
  <c c'>1 ~ ~  | % 7
  \key c \major <c c'>1 ~ ~ | % 8
  <c c'>1\> ^\fermata \breathe  | % 9
  bes'1~ \< \upbow  _\mp  | % 10
  bes1\! | % 11
  R1 | % 12
  \stemUp c8  ^"pizz."  r8 r4 r2 | % 13
  bes'1 \upbow _\f ^ "arco" | % 14
  a1  | % 15
  g1 | % 16
  R1*3 | % 19
  r2 \stemUp bes,8  ^"pizz." _\mp r4. | % 20
  R1*2  | % 22
  bes''1 ^ "arco" | % 23
  as1 | % 24
  g1 | % 25
  f1 | % 26  
}
				  
PartPFiveVoiceOne =  \relative es' {
  \clef "treble"
  \time 2/2
   \key es \major | % 1
  R1*7  | % 8
  s1_\markup{\translate #'(-1 . 0) \arrow #"open" ##f #Y #UP #3 #0.14 ""}-\markup{\lower #6 \hspace #-3 \italic{Entrée des bourdons du pìob-mhòr}} | % 9
  \grace {  \small \stemUp es32 } d1 | % 10
  f1 
%{
  ^\markup \translate #'(32.5 . 11) \teeny \italic {"note concernant la cornemuse"}
  ^\markup \translate #'(30 . 9) \teeny \italic {"si besoin"} 
%}
  | % 11
  \grace {  \small \stemUp g32 } es1 | % 12
  c1 | % 13
  \grace {  \small \stemUp f32 [ \stemUp c32 ] } \stemDown es2 \grace {  \small \stemUp bes'32 [ \stemUp es,32 ] } \stemDown g2 | % 14
  \grace {  \small \stemUp bes32 [ \stemUp g32 ] } \stemDown as2 \grace {  \small \stemUp bes32 [ \stemUp as32 ] } \stemDown bes2 | % 15
  \grace {  \small \stemUp c,32 } bes1 | % 16
  as1 | % 17
  \grace {  \small \stemUp es'32 } c1 | % 18
  \grace {  \small \stemUp as'32 } \stemDown g2 \grace {  \small \stemUp f32 } \stemDown es2 | % 19
  \grace {  \small \stemUp f32 } \stemDown d2 \grace {  \small \stemUp es32 } \stemDown c2 | % 20
  \grace {  \small \stemUp d32 } as1 | % 21
  bes1  | % 22
  bes'1 | % 23
  \stemDown as2.. \stemDown f8 | % 24
  \stemDown g2. \stemDown es4 | % 25
  \stemDown f2 \stemDown bes,2 | % 26
  as1 | % 27
  \stemDown c2 \stemDown es2 | % 28
  \grace {  \small \stemUp f32 } d1 | % 29
  bes1 \bar "||" | % 30
  \pageBreak
  
  \tempo 4=38
  \numericTimeSignature
\time 4/4
  \grace {  \small \stemUp as'32 } \stemDown d,8. [ ^ "Dithis singling" \grace { \stemUp f32 } \stemDown bes,16 ] \grace {  \small \stemUp as'32 } \stemDown f8. [ \grace {  \small \stemUp f32 } \stemDown bes,16 ] \grace { \stemUp as'32 } \stemDown es8. [ \grace {  \small \stemUp f32 } \stemDown bes,16 ] \grace {  \small \stemUp as'32 } \stemDown c,8. [ \grace { \stemUp f32 } \stemDown bes,16 ] | % 31
  \grace {  \small \stemUp as'32 } \stemDown es8 [ \grace {  \small \stemUp as32 } \stemDown g8 \grace {  \small \stemUp bes32 } \stemDown as8 \stemDown bes8 ]
  \grace {  \small \stemUp bes,32 [ \stemUp es32 ] } \stemDown bes8. [ \grace { \stemUp f'32 } \stemDown bes,16 ] \grace {  \small \stemUp as'32 } \stemDown as,8. [ \grace {  \small \stemUp f'32 } \stemDown bes,16 ]  | % 32
  \time 3/4
  \grace {  \small \stemUp as'32 } \stemDown c,8. [ \grace { \stemUp f32 } \stemDown bes,16 ] \grace {  \small \stemUp as'32 } \stemDown g16 [ \stemDown bes,16 \grace {  \small \stemUp f'32 } \stemDown es8 ] \grace {  \small \stemUp as32 } \stemDown d,8 [ \grace {  \small \stemUp f32 } \stemDown c8 ] 
  \time 2/4
  \grace {  \small \stemUp as'32 } \stemDown as,8. [ \grace { \stemUp f'32 } \stemDown bes,16 ] \grace {  \small \stemUp as'32 } \stemDown bes,8. [ \grace {  \small \stemUp f'32 } \stemDown bes,16 ] | % 33
  \time 4/4
  \stemDown bes'8. [ \grace {  \small \stemUp f32 } \stemDown bes,16 ] \grace {  \small \stemUp bes'32 } \stemDown as8. [ \grace {  \small \stemUp f32 } \stemDown bes,16 ] \grace {  \small \stemUp as'32 } \stemDown g8. [ \grace {  \small \stemUp f32 } \stemDown bes,16 ] \grace { \stemUp as'32 } \stemDown f8. [ \grace {  \small \stemUp f32 } \stemDown bes,16 ]  | % 34
  \grace {  \small \stemUp as'32 } \stemDown as,8. [ \grace {  \small \stemUp f'32 } \stemDown bes,16 ] \grace {  \small \stemUp as'32 } \stemDown c,8 [ \grace { \stemUp f32 } \stemDown es8 ] \grace {  \small \stemUp as32 } \stemDown d,8. [ \grace {  \small \stemUp f32 } \stemDown bes,16 ] \grace {  \small \stemUp as'32 } \stemDown bes,8. [ \grace {  \small \stemUp f'32 } \stemDown bes,16 ] \bar "||" | % 35
  
  \grace {  \small \stemUp as'32 } \stemDown d,8. [ ^ "Dithis doubling" \grace { \stemUp f32 } \stemDown d16 ] \grace {  \small \stemUp as'32 } \stemDown f8. [ \grace {  \small \stemUp bes32 } \stemDown f16 ] \grace {  \small \stemUp as32 } \stemDown es8. [ \grace {  \small \stemUp f32 } \stemDown es16 ] \grace { \stemUp as32 } \stemDown c,8. [ \grace {  \small \stemUp f32 } \stemDown c16 ]  | % 36
  \grace {  \small \stemUp as'32 } \stemDown es8 [ \grace {  \small \stemUp bes'32 } \stemDown g8 \grace {  \small \stemUp bes32 } \stemDown as8 \grace {  \small \stemUp bes32 [ \stemUp as32 ] } \stemDown bes8 ] \grace {  \small \stemUp as32 } \stemDown bes,8. [ \grace {  \small \stemUp f'32 } \stemDown bes,16 ] \grace {  \small \stemUp as'32 } \stemDown as,8. [ \grace {  \small \stemUp f'32 } \stemDown as,16 ] | % 37
  \time 3/4
  \grace {  \small \stemUp as'32 } \stemDown c,8. [ \grace { \stemUp f32 } \stemDown c16 ] \grace {  \small \stemUp as'32 } \stemDown g8 [ \grace {  \small \stemUp f32 } \stemDown es8 \grace {  \small \stemUp as32 } \stemDown d,8 \grace {  \small \stemUp f32 } \stemDown c8 ] 
  \time 2/4 
  \grace {  \small \stemUp as'32 } \stemDown as,8. [ \grace {  \small \stemUp f'32 } \stemDown as,16 ] \grace {  \small \stemUp as'32 } \stemDown bes,8. [ \grace {  \small \stemUp f'32 } \stemDown bes,16 ]  | % 38
  \time 4/4
  \grace {  \small \stemUp bes'32 [ \stemUp as32 ] } \stemDown bes8 [ \grace {  \small \stemUp f32 } \stemDown bes,8 ]
  \grace {  \small \stemUp bes'32 } \stemDown as8. [ \grace {  \small \stemUp bes32 } \stemDown as16 ] \grace {  \small \stemUp bes32 } \stemDown g8. [ \grace { \stemUp bes32 } \stemDown g16 ] \grace {  \small \stemUp as32 } \stemDown f8. [ \grace {  \small \stemUp bes32 } \stemDown f16 ] | % 39
  \grace {  \small \stemUp as32 } \stemDown as,8. [ \grace {  \small \stemUp f'32 } \stemDown as,16 ] \grace {  \small \stemUp as'32 } \stemDown c,8 [ \grace { \stemUp f32 } \stemDown c8 ] \grace {  \small \stemUp as'32 } \stemDown d,8. [ \grace {  \small \stemUp f32 } \stemDown d16 ] \grace {  \small \stemUp as'32 } \stemDown bes,8. [ \grace {  \small \stemUp f'32 } \stemDown bes,16 ] \bar "||" | % 40
 
  \grace {  \small \stemUp as'32 } \stemDown d,8. [ ^ "Taorluath" \grace {
    \stemUp as32 [ \stemUp es'32 \stemUp as,32 \stemUp f'32 ] } \stemDown bes,16 ] \grace {  \small \stemUp as'32 } \stemDown f8. [ \grace { \stemUp as,32 [ \stemUp es'32 \stemUp as,32 \stemUp f'32 ] } \stemDown bes,16 ] \grace {  \small \stemUp as'32 } \stemDown es8. [ \grace { \stemUp as,32 [ \stemUp es'32 \stemUp as,32 \stemUp f'32 ] } \stemDown bes,16 ] \grace {  \small \stemUp as'32 } \stemDown c,8. [ \grace { \stemUp as32 [ \stemUp es'32 \stemUp as,32 \stemUp f'32 ] } \stemDown bes,16 ]  | % 41
  \grace {  \small \stemUp as'32 } \stemDown es8 [ \grace {  \small \stemUp bes'32 } \stemDown g8 \grace {  \small \stemUp bes32 } \stemDown as8 \stemDown bes8 ] \grace {  \small \stemUp bes,32 [ \stemUp f'32 \stemUp bes,32 \stemUp as32 ] } \stemDown bes8. ^\fermata [ \grace {  \small \stemUp as32 [ \stemUp es'32 \stemUp as,32 \stemUp f'32 ] } \stemDown bes,16 ] \grace { \stemUp as'32 } \stemDown as,8. [ \grace {  \small \stemUp bes'32 [ \stemUp d,32 \stemUp as32 ] } \stemDown bes16 ]  | % 42
  \time 3/4
  \grace {  \small \stemUp as'32 } \stemDown c,8. [ \grace { \stemUp as32 [ \stemUp es'32 \stemUp as,32 \stemUp f'32 ] } \stemDown bes,16 ] \grace {  \small \stemUp as'32 } \stemDown g16 [ \stemDown bes,16 \grace {  \small \stemUp bes'32 } \stemDown es,8 ] \grace { \stemUp as32 } \stemDown d,8 [ \grace {  \small \stemUp bes'32 } \stemDown c,8 ] 
  \time 2/4
  \grace {  \small \stemUp as'32 } \stemDown as,8. [ \grace { \stemUp es'32 [ \stemUp as,32 \stemUp f'32 ] } \stemDown bes,16 ] \grace {  \small \stemUp as'32 } \stemDown bes,8. [ \grace {  \small \stemUp as32 [ \stemUp es'32 \stemUp as,32 \stemUp f'32 ] } \stemDown bes,16 ] | % 43
  \time 4/4
  \stemDown bes'8. [ \grace {  \small \stemUp as,32 [ \stemUp es'32 \stemUp as,32 \stemUp f'32 ] } \stemDown bes,16 ] \grace {  \small \stemUp bes'32 } \stemDown as8. [ \grace {  \small \stemUp as,32 [ \stemUp es'32 \stemUp as,32 \stemUp f'32 ] } \stemDown bes,16 ] \grace {  \small \stemUp as'32 } \stemDown g8. [ \grace { \small \stemUp as,32 [ \stemUp es'32 \stemUp as,32 \stemUp f'32 ] } \stemDown bes,16 ] \grace {  \small \stemUp g'32 } \stemDown f8. [ \grace {  \small \stemUp as,32 [ \stemUp es'32 \stemUp as,32 \stemUp f'32 ] } \stemDown bes,16 ]  | % 44
  \grace {  \small \stemUp as'32 } \stemDown as,8. [ \grace {  \small \stemUp es'32 [ \stemUp as,32 \stemUp f'32 ] } \stemDown bes,16 ] \grace {  \small \stemUp as'32 } \stemDown c,8 [ \stemDown es8 ] \grace {  \small \stemUp as32 } \stemDown d,8. [ \grace {  \small \stemUp as32 [ \stemUp es'32 \stemUp as,32 \stemUp f'32 ] } \stemDown bes,16 ] \grace {  \small \stemUp as'32 } \stemDown bes,8. [ \grace {  \small \stemUp as32 [ \stemUp es'32 \stemUp as,32 \stemUp f'32 ] } \stemDown bes,16 ] \bar "||" | % 45

  \grace {  \small \stemUp es32 } \stemDown d4 ^ "Ùrlar" \stemDown f4 \grace { \stemUp g32 } \stemDown es4 \stemDown c4 | % 46
  \grace {  \small \stemUp f32 [ \stemUp c32 ] } \stemDown es8 [ \grace {  \small \stemUp bes'32 [ \stemUp es,32 ] } \stemDown g8 \grace {  \small \stemUp bes32 [ \stemUp g32 ] } \stemDown as8 \stemDown bes8 ] \grace { \stemUp c,32 } \stemDown bes4  \stemUp as4  | % 47
  \time 3/4
  \grace {  \small \stemUp es'32 } \stemDown c4 \grace {  \small \stemUp as'32 } \stemDown g8 [ \grace {  \small \stemUp f32 } \stemDown es8 \grace {  \small \stemUp f32 } \stemDown d8 \grace {  \small \stemUp es32 } \stemDown c8 ] 
  \time 2/4
  \grace {  \small \stemUp d32 } \stemUp as4 \stemDown bes4 | % 48
  \time 4/4  \stemDown bes'4 \stemDown as8.. [ \stemDown f32 ] \stemDown g8. [ \stemDown es16 ] \stemDown f8 [ \stemDown bes,8 ] | % 49
  \stemUp as4 \stemDown c8 [ \stemDown es8 ] \grace {  \small \stemUp f32 } \stemDown d4 \stemDown bes4 \fermata | % 50
  s1-\markup{\translate #'(5.5 . 1.5) \arrow #"open" ##f #Y #UP #3 #0.14 ""}-\markup { \italic{Arrêt bourdons}} | % 51 
  R1 \bar "|."
}
				  				  
\score {
  <<
    \new StaffGroup <<
      \new Staff
      <<
	\set Staff.instrumentName = "Violin"
	\set Staff.shortInstrumentName = ""
	\context Staff << 
	  \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
	  \context Voice = "PartPOneVoiceOne" {  \PartPOneVoiceOne }
	>>
      >>
      \new Staff
      <<
	\set Staff.instrumentName = "Alto 1"
	\set Staff.shortInstrumentName = ""
	\context Staff << 
	  \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
	  \context Voice = "PartPTwoVoiceOne" {  \PartPTwoVoiceOne }
	>>
      >>
      \new Staff
      <<
	\set Staff.instrumentName = "Alto 2"
	\set Staff.shortInstrumentName = ""
	\context Staff << 
	  \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
	  \context Voice = "PartPThreeVoiceOne" {  \PartPThreeVoiceOne }
	>>
      >>
      \new Staff
      <<
	\set Staff.instrumentName = "Cello"
	\set Staff.shortInstrumentName = ""
	\context Staff << 
	  \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
	  \context Voice = "PartPFourVoiceOne" {  \PartPFourVoiceOne }
	>>
      >>
    >>
    \new Staff
    <<
      \set Staff.instrumentName = "pìob-mhòr"
      \set Staff.shortInstrumentName = ""
      \omit Staff.KeySignature
      \set Staff.extraNatural = ##f
      \key d \major
      \accidentalStyle forget
      \context Staff << 
	\mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
	\context Voice = "PartPFiveVoiceOne" { \transpose es' d'' {\PartPFiveVoiceOne}  }
      >>
    >>
  >>
  \layout {\context {
    \Staff
    \RemoveAllEmptyStaves
  }
	 }
}


