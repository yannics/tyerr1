\version "2.25.13"

% 28 august 2025

% http://lsr.di.unimi.it/LSR/Item?u=1&id=961
%% => http://lilypond.1069038.n5.nabble.com/scheme-problem-colored-background-layers-tc169023.html

#(define-markup-command (Arrow layout props color angle length moveX moveY) 
  (color? number? number? number? number?)
  (interpret-markup layout props
   #{
   \markup {
   \with-dimensions #'(0 . 0) #'(0 . 0)
   \translate #(cons moveX moveY)
   \rotate #angle
   \override #'(thickness . 3)    % line thickness
   \fontsize #5                   % arrow-head size
   \with-dimensions #'(0 . 0) #'(0 . 0)
   \with-color $color
   \translate #(cons 0 (- 0 length))
   \combine
   \draw-line #(cons 0 length)    % can be replaced by \draw-dashed-line or \draw-dotted-line
   \translate-scaled #'(0 . -0.5) % might have to be adjusted if line thickness is changed
   \with-color $color 
   \arrow-head #Y #DOWN ##f       % ##t - filled arrow-head, ##f - empty arrow-head
 }
   #}))

\header {
  title =  "Meditation 1"
  composer =  "Yann Ics"
  subtitle =  " "
  subsubtitle =  " "
  tagline = \markup { \teeny \typewriter "Copyleft October 2025" }
}

\markup {
  \column {
    \line  \smallCaps { Requiem da Camera }
    \line \bold \tiny { Introit & Kyrie eleison }
    \wordwrap \italic \small { 
      Le texte est noté en phonétique IPA (International Phonetic Alphabet) et est purement indicatif permettant de contextualiser l'interprétation.
    }
  }
}

\markup \vspace #0.5

violon =  \relative f'' {
  \tempo "Lento" %2 = 56
  \override Score.MetronomeMark.padding = #2
  \clef "treble" \time 2/2  | % 1
  R1 | % 2
  r4  f2.\p ~ | % 3
  f2  e2 ~ | % 4
  e4  es2. ~ | % 5
  es2  d2 ~ | % 6
  d2 r2 | % 7
  d2\mf  f2 | % 8
  e1 \breathe | % 9
  c2-\markup{ \dynamic p \italic sub. } 
  ^\markup \translate #'(40 . 15) \teeny \italic {"Au chant, la langue reste collée sur le palais durant les silences de suspension."}
  ^\markup \translate #'(32.5 . 11) \teeny \italic {"Bien tenir toute la durée de la ronde de la mesure 8, puis bien marquer la césure, comme"}
  ^\markup \translate #'(30 . 9) \teeny \italic {"une brève suspension du temps afin de mettre en relief la reprise piano subito de la mesure 9."}
  d2 | 
  d2
  <d es>2 ~ | % 11
  es2 r2 | % 12
  r2  d,2\mf | % 13
  f2\>  e2 ~ | % 14
  \once \override Hairpin.circled-tip = ##t
  e1\p\> | % 15
  R1\! R1 | % 17
  \override TextSpanner.bound-details.left.text = \markup { \teeny \upright "Transparent" }
  f''2.-\markup{\dynamic p \italic cantabile}\startTextSpan
 % ^\markup{\teeny (Transparent)}
  es4 | % 18
  as,4  c4  f,2 | % 19
  fis4  c'4  f2  | 
  cis2  c2\stopTextSpan | % 21
  \once \override Rest.stencil =
  #(lambda (grob)
    (grob-interpret-markup grob #{
     \markup \raise #-1.7 \bold "G.P."
     #}))
  r1 | % 23
  \override TextSpanner.bound-details.left.text = \markup { \teeny \upright "Éthéré" }
  d2-\markup{\dynamic p \italic cantabile}\startTextSpan
  %^\markup{\teeny (Éthéré)}
  f2 | % 24
  e1 | % 25
  c2  d2\stopTextSpan | % 26
  d2  ^\markup \small {"-    -    -    -"}
  ^\markup \translate #'(47 . 11) \teeny \bold {"G.P."} 
  ^\markup \translate #'(52 . 11) \teeny \italic{"pour Grande Pause, est une suspension significative du temps."}
  d2  | % 27
  R1 | % 28
  r2  d,,2\mf | % 29
  f2\>  e2 ~  | 
  \once \override Hairpin.circled-tip = ##t
  e1\p\> | % 31
  R1\! R1 s1  \bar "|."
}

PartPOneVoiceOneLyricsOne =  \lyricmode {
  \set ignoreMelismata = ##t
  i --\skip1 \skip1 "ɛ" --\skip1 "ɛ’" --\skip1 "tɛr" ki -- ri -- e e -- le -- i -- son\skip1 "‘dɔ" -- mi -- "nɛ" \skip1 luks "pɛr" "’pɛ" tu "ɑ" "‘lut" "ʃɛ" "ɑt" "‘ɛ" is ki -- ri -- e e -- le -- i -- son ki -- ri -- e\skip1
}

PartPOneVoiceOneLyricsTwo =  \lyricmode {
  \set ignoreMelismata = ##t
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 is\skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
}

altoone =  \relative f' {
  \clef "alto" \time 2/2  | % 1
  R1 | % 2
  f1\p | % 3
  e1 | % 4
  es1 | % 5
  d1 | % 6
  cis8
  -. -> r8 r4  es2\< ~ | % 7
  es2  f2\mf ~ | % 8
  f1 \breathe  | % 9
  es2-\markup{ \dynamic p \italic sub. }  f2 | 
  <d f>2 r2 | % 11
  R1 | % 12
  cis2\<  d2\mf | % 13
  d2\>  d2 | % 14
  r2\!  c2\p | % 15
  b2  gis2 | % 16
  c,2 r4  c8 -. -> r8 | % 17
  R1 | % 18
  r4  c8 -. -> r8 r2 | % 19
  r2.  c8 -. -> r8  | 
  R1 s1 R1 R1 | % 25
  r2  f''2\p | % 26
  d2 r2 | % 27
  R1 | % 28
  cis2\<  d2\mf | % 29
  d2\>  d2  | 
  r2\!  dis,,2\p | % 31
  e2  f2 | % 32
  e1 | % 33
  \once \override Rest.stencil =
  #(lambda (grob)
    (grob-interpret-markup grob #{
     \markup \raise #-1.7 \bold "G.P."
     #}))    
  r1 \bar "|."
}

PartPTwoVoiceOneLyricsOne =  \lyricmode {\set ignoreMelismata = ##t kwi
					 --\skip1 "ɛm" -- "ɛ’" -- t\vowelTransition "ɛr" \skip1 \skip1 "nɑm" "‘dɔ" \skip1
					 "‘ɛ" e -- le -- i -- son e -- le -- i -- son "ɛt" "ɛt" "ɛt" kri --
					 ste e -- le -- i -- son e -- le -- i -- son
				       }

PartPTwoVoiceOneLyricsTwo =  \lyricmode {
  \set ignoreMelismata = ##t
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 kri -- ste\skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
				       }

altotwo =  \relative f {
  \clef "alto" \time 2/2  | % 1
  r2  f2\p ~ | % 2
  f2  e2 ~ | % 3
  e2  es2 ~ | % 4
  es2  d2 ~ | % 5
  d1 | % 6
  ees8 -. -> r8 r4  cis2\< ~ | % 7
  cis2  d2\mf ~ | % 8
  d1 \breathe  | % 9
  \break
  cis2-\markup{ \dynamic p \italic sub. } d2 | 
  es2 r2 | % 11
  R1 | % 12
  dis2\<  e2\mf | % 13
  f2\>  e2 | % 14
  r2\!  d2\p | % 15
  f2  cis2 | % 16
  e2 r4  e8 -. -> r8 | % 17
  R1 | % 18
  r4  e8 -. -> r8 r2 | % 19
  r2.  e8 -. -> r8 |  
  R1 s1 R1 R1 | % 25
  r2  d'2\p | % 26
  dis2 r2 | % 27
  R1 | % 28
  dis2\<  e2\mf | % 29
  dis2\>  b2  |  
  r2\!  c2\p | % 31
  b2  as2 | % 32
  c,1 | % 33
  \once \override Rest.stencil =
  #(lambda (grob)
    (grob-interpret-markup grob #{
     \markup \raise #-1.7 \bold "G.P."
     #}))    
  r1 \bar "|."
}

PartPThreeVoiceOneLyricsOne =  \lyricmode {
  \set ignoreMelismata = ##t
  "ɛ" -- i\skip1 \skip1 \skip1 "ɛ" \skip1 "ɛ’" -- t\vowelTransition "ɛr" \skip1 \skip1 "nɑm" "‘dɔ" "nɑ" "‘ɛ" e -- le -- i -- son e -- le -- i -- son "ɛt" "ɛt" "ɛt" kri -- ste e -- le -- i -- son e -- le -- i -- son
}

cello =  \relative f, {
  \clef "bass" \time 2/2 | % 1
  f1\p | % 2
  e2.  es4 ~ | % 3
  es1 | % 4
  d1 | % 5
  b'1
  -\tweak layer #-1 -\markup {\Arrow #(x11-color 'grey80) #160 #26 #2 #-8 }
  -\tweak layer #-1 -\markup {\Arrow #(x11-color 'grey80) #147 #15 #2 #-8 }
  | % 6
  d1\< ~ | % 7
  d1\mf | % 8
  c1 \breathe  | % 9
  r2  d2\p ~ | 
  d2  c2 ~ | % 11
  c2 r2 | % 12
  r2  d,2\mf | % 13
  f2\>  e2 ~ | % 14
  \once \override Hairpin.circled-tip = ##t
  e1\p\> | % 15
  R1\! | % 16
  r2.  as4\p ~ | % 17
  as2  g4  es4 | % 18
  c2  cis2 ~ | % 19
  cis4  as''2. | 
  g1 | % 21
  s1 R1*5 | % 28
  r2  d,2\mf | % 29
  f2\>  e2 ~  | 
  \once \override Hairpin.circled-tip = ##t
  e1\p\> | % 31
  R1\! R1 s1 \bar "|."
}

PartPFourVoiceOneLyricsOne =  \lyricmode {
  \set ignoreMelismata = ##t
  "‘rɛ" kwi --\skip1 \skip1 "ɛm" "ɛ’" "tɛr" --\skip1 "nɑm" "nɑ" \skip1 is\skip1 ki -- ri -- e\skip1 luks --\skip1 "pɛr" "’pɛ" tu "ɑ" \skip1 \skip1 \skip1 ki -- ri -- e\skip1
}

\score {
  \new StaffGroup <<
    
    \new Staff
    <<
      \set Staff.instrumentName = "Violin"
      
      \context Staff <<
	\context Voice = "violon" { \violon }
	
	\new Lyrics \lyricsto "violon" { \set fontSize = #-2 \PartPOneVoiceOneLyricsOne }
	\new Lyrics \lyricsto "violon" { \set fontSize = #-2 \PartPOneVoiceOneLyricsTwo }
	
      >>
    >>
    \new Staff
    <<
      \set Staff.instrumentName = "Alto 1"
      
      \context Staff << 
	\context Voice = "altoone" { \altoone }
	
	\new Lyrics \lyricsto "altoone" { \set fontSize = #-2 \PartPTwoVoiceOneLyricsOne }
	\new Lyrics \lyricsto "altoone" { \set fontSize = #-2 \PartPTwoVoiceOneLyricsTwo }
      >>
    >>
    \new Staff
    <<
      \set Staff.instrumentName = "Alto 2"
      
      \context Staff << 
	\context Voice = "altotwo" { \altotwo }
	
	\new Lyrics \lyricsto "altotwo" { \set fontSize = #-2 \PartPThreeVoiceOneLyricsOne }
	
      >>
    >>
    \new Staff
    <<
      \set Staff.instrumentName = "Cello"
      
      \context Staff << 
	\context Voice = "cello" { \cello }
	
	\new Lyrics \lyricsto "cello" { \set fontSize = #-2 \PartPFourVoiceOneLyricsOne }
	
      >>
    >>
    
  >>  
}

