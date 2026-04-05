\version "2.25.13"

% 4 april 2026

\header {
    title =  "Meditation 5"
    composer =  "Yann Ics"
    subtitle =  " "
    subsubtitle =  " "
    tagline = \markup { \teeny \typewriter "Copyleft April 2026" }
  }

\markup {
  \column {
  \vspace #0.5
    \line  \smallCaps { Deambulatio }
  }
}

PartPOneVoiceOne =  \relative bes {
  \clef "treble" \time 2/2  | % 1
  
  \tempo 2=58
  \override Score.MetronomeMark.padding = #2
  bes1 ~ _\mp | % 3
  bes4. r8  bes2 ~ | % 4
  bes2.. r8 | % 5
  bes1 ~ | % 6
  bes4. r8  bes2 ~ | % 7
  bes2.. r8 | % 8
  a1 ~ | % 9
  a4. r8  bes2 ~ | 
  bes2.. r8 | % 11
  bes1 ~ | % 12
  bes4. r8  bes2 ~ | % 13
  bes2.. r8 | % 14
  bes1 ~ | % 15
  bes4. r8  as2 ~  | % 16
  as2.. r8  | % 17
  as1 ~  | % 18
  as4. r8  bes2 ~ | % 19
  bes2.. r8 | 
  g1 ~ | % 21
  g4. r8  as2 ~  | % 22
  as2.. r8 | % 23
  as''1 ~ _\p | % 24
  as4. r8  dis,2 ~ _\pp   | % 25
  dis2.. r8  | % 26
  c1 ~  | % 27
  c1 ~ | % 28
  c4. r8  c2 ~ | % 29
  c1 ~ | 
  c4. r8  c2 ~ | % 31
  c1 ~ | % 32
  c4. r8  c2 ~ | % 33
  c1 | % 34
  \break
  \time 3/4  \tempo 4=80 
  \override Score.MetronomeMark.padding = #4
  r4  as2 ^ "pizz." _\mf  | % 35
  c4 r4 \stemDown  f4 ( ~ _\mp ^ "arco" | % 36
  f4 ~  <d, f'>2 ~ ~ | % 37
  <d f'>4 ~  <d d'>2 ~ | % 38
  <d es'>2. ~ ~ | % 39
  <d es'>4 ) \stemUp as'2 ~ _\p  | 
  \break
  as2  g4 ~  | % 41
  g2. | % 42
  es2. ~  | % 43
  es4 r2 | % 44
  R2.  | % 45
  R2. \bar "|."
}

PartPTwoVoiceOne =  \relative d'' {
  \clef "alto" \time 2/2  | % 1
  
  d1 _\mf | % 3
  f2.  f4 | % 4
  e1 ( | % 5
  c2. )  bes4 | % 6
  d2.  f,4 | % 7
  as1 | % 8
  R1 | % 9
  r2  a2 ~ |
  a4  cis,4  d2 ~ | % 11
  d4 r2. | % 12
  r2  es,2 ~ _\< | % 13
  es4 _\! _\mf  d2  cis4 | % 14
  d2. r4 | % 15
  r2  es2 ~ _\mp | % 16
  es2.. r8  | % 17
  es1 ~ | % 18
  es4. r8  es2 ~ | % 19
  es2.. r8 | 
  bes'1 ~ | % 21
  bes4. r8  bes2 ~ | % 22
  bes2.. r8 | % 23
  f'1 ~ _\p | % 24
  f4. r8  g2 ~ _\pp | % 25
  g2.. r8 | % 26
  fis1 ~ | % 27
  fis1 ~ | % 28
  fis4. r8  fis2 ~ | % 29
  fis1 ~ | 
  fis4. r8  fis2 ~ | % 31
  fis1 ~ | % 32
  fis4. r8  fis2 ~ | % 33
  fis1 | % 34
  \time 3/4  r4  c4 ^ "pizz." _\mf r4  | % 35
  cis4  f2 ~ _\mp ^ "arco" | % 36
  f4. r8  g,4 ^ "pizz." _\mf | % 37
  g'2  bes,4 | % 38
  c4  d2 | % 39
  r4  d2 ~ ^ "arco" _\p | 
  d2  b!4 ~ | % 41
  b2. | % 42
  c2. ~ | % 43
  c4 r2 | % 44
  R2. | % 45
  R2. \bar "|."
}

PartPThreeVoiceOne =  \relative bes {
  \clef "alto" \time 2/2  | % 1
  
  bes1 ~ _\mp | % 3
  bes4. r8  bes2 ~ | % 4
  bes2.. r8 | % 5
  bes1 ~ | % 6
  bes4. r8  bes2 ~ | % 7
  bes2.. r8 | % 8
  d,1 ~ | % 9
  d4. r8  bes'2 ~ |
  bes2.. r8 | % 11
  bes1 ~ | % 12
  bes4. r8  bes2 ~ | % 13
  bes2.. r8 | % 14
  bes1 ~ | % 15
  bes4. r8  as2 ~ | % 16
  as2.. r8  | % 17
  as1 ~ | % 18
  as4. r8  f'2 ~ | % 19
  f2.. r8 |
  cis,1 ~ | % 21
  cis4. r8  b'! 2 ~ | % 22
  b2.. r8 | % 23
  d1 ~ _\p | % 24
  d4. r8  b! 2 ~ _\pp | % 25
  b2.. r8  | % 26
  cis1 ~ | % 27
  cis1 ~ | % 28
  cis4. r8  cis2 ~ | % 29
  cis1 ~ | 
  cis4. r8  cis2 ~ | % 31
  cis1 ~ | % 32
  cis4. r8  cis2 ~ | % 33
  cis1 | % 34
  \time 3/4  r2  f,4 ~ _\mp  | % 35
  f2 \override Slur.positions = #'(1 . 1) bes4 ( ~ | % 36
  bes8 ~ [  <c, bes'>8 ~ ]  c4 ~  <c d'>4
  ~ | % 37
  <c c'>2. ~ ~ | % 38
  <c c'>2. ~ ~ | % 39
  <c c'>4 ) 
  f'2 ~ _\p | 
  f2  as4 ~ | % 41
  as2. | % 42
  g2. ~ | % 43
  g4 r2 | % 44
  R2. | % 45
  R2. \bar "|."
}

PartPFourVoiceOne =  \relative bes, {
  \clef "bass" \time 2/2  | % 1
  
  bes1 ~ _\mp | % 3
  bes4. r8  bes2 ~ | % 4
  bes2.. r8 | % 5
  bes1 ~ | % 6
  bes4. r8  bes2 ~ | % 7
  bes2.. r8 | % 8
  d,1 ~  | % 9
  d4. r8  bes'2 ~ | 
  bes2.. r8 | % 11
  bes1 ~ | % 12
  bes4. r8  bes2 ~ | % 13
  bes2.. r8 | % 14
  bes1 ~ | % 15
  bes4. r8  c,2 ~ | % 16
  c2.. r8  | % 17
  es1 ~ | % 18
  es4. r8  d2 ~ | % 19
  d2.. r8 |
  e! 1 ~ | % 21
  e4. r8  as2 ~ | % 22
  as2.. r8 | % 23
  d1 ~ _\p | % 24
  d4. r8  g2 ~ _\pp | % 25
  g2.. r8  | % 26
  f1 ~ | % 27
  f1 ~ | % 28
  f4. r8  f2 ~ | % 29
  f1 ~ | 
  f4. r8  f2 ~ | % 31
  f1 ~ | % 32
  f4. r8  f2 ~ | % 33
  f1 | % 34
  \time 3/4   f,2. ~ _\mp  | % 35
  f4  c2 ~ | % 36
  c2. ~ | % 37
  c2. | % 38
  r8  bes'4. ^ "pizz." _\mf r4 | % 39
  r4  c2 ~ ^ "arco" _\p | 
  c2  c4 ~ | % 41
  c2. | % 42
  es2. ~ | % 43
  es4  c,2 ~ _\mp | % 44
  c2. ~  | % 45
  c2. \bar "|."
}

\score {
  <<
    \new StaffGroup <<
      \new Staff
      <<
	\set Staff.instrumentName = "Violin"
	\context Staff << 
	  \context Voice = "PartPOneVoiceOne" {  \PartPOneVoiceOne }
	>>
      >>
      \new Staff
      <<
	\set Staff.instrumentName = "Alto 1"
	\context Staff << 
	  \context Voice = "PartPTwoVoiceOne" {  \PartPTwoVoiceOne }
	>>
      >>
      \new Staff
      <<
	\set Staff.instrumentName = "Alto 2"
	\context Staff << 
	  \context Voice = "PartPThreeVoiceOne" {  \PartPThreeVoiceOne }
	>>
      >>
      \new Staff
      <<
	\set Staff.instrumentName = "Cello"	
	\context Staff << 
	  \context Voice = "PartPFourVoiceOne" {  \PartPFourVoiceOne }
	>>
      >>
    >>
  >>
   
    }


