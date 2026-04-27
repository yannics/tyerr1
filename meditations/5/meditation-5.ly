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
  as2 r8  bes4. ~ | % 19
  bes1 ~
  bes4 r8 g8 ~ g2 ~ | 
  g2.. r8 | % 21
  as1 ~  | % 22
  as1 ^ \markup
  { \translate #'(4 . 1)
    \concat {
      \smaller \general-align #Y #DOWN \note { 4 } #UP
      " = "
      \smaller \general-align #Y #DOWN \note { 4 } #UP
    }
  }
  \time 2/4 
  r8 as''4. ~ _\p | % 24
  as2~ as2
  r8  dis,4. ~ _\pp   | % 25
  dis2~ dis2  | % 26
  r8 c4. ~  | % 27
  c2~ c2~ c2~ c2| % 28
  r8  c4. ~ | % 29
  c2~ c2~ c2 | 
  r8  c4. ~ | % 31
  c2~ c2~ c2 | % 32
  \break
  \time 3/4  \tempo 4=80 
  \override Score.MetronomeMark.padding = #4
  r4  as2 ^ "pizz." _\mf  | % 35
  c8 r4. \stemDown  f4  ~ _\mp ^ "arco" \upbow | % 36
  f4 ~  <d, f'>2 ~  | % 37
  \tieDown <d f'>8  <d d'>2 ~ \downbow \tieNeutral <d es'>8~ | % 38
  <d es'>2. ~ \> | % 39
  <d es'>4  \stemUp as'2 ~ _\p  | 
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
  es2 r8  es4. ~ | % 19
  es1 ~
  es4 r8 bes'8 ~ bes2 ~| 
  bes2.. r8 | % 21
  bes1 ~ | % 22
  bes1 | % 23
  \time 2/4
  r8 f'4. ~ _\p | % 24
  f2~ f2
  r8 g4. ~ _\pp | % 25
  g2~ g2
  r8 fis4. ~ | % 27
  fis2 ~ fis2~ fis2~ fis2 | % 28
  r8 fis4.~
  fis2 ~ fis2~ fis2 
  r8 fis4.~
  fis2 ~ fis2~ fis2 
  \time 3/4  r4  c2 ^ "pizz." _\mf  | % 35
  cis8 r8  f2 ~ _\mp ^ "arco" | % 36
  f4. r8  g,4 ^ "pizz." _\mf | % 37
  g'2  g,4 | % 38
  c8  bes8 r2 | % 39
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
  as2 r8  f'4. ~ | % 19
  f1 ~
  f4 r8 cis,8~ cis2~ |
  cis2.. r8  | % 21
  b'! 1 ~ | % 22
  b1 | % 23
  \time 2/4
  r8 d4. ~ _\p | % 24
  d2~ d2
  r8  b!4. ~ _\pp | % 25
  b2~ b2
  r8  cis4. ~ 
  cis2~ cis2~ cis2~ cis2
  r8  cis4. ~ 
  cis2~ cis2~ cis2
  r8  cis4. ~ 
  cis2~ cis2~ cis2
  \time 3/4  r2  f,4 ~ _\mp  | % 35
  f2 \override Slur.positions = #'(1 . 1) bes4 ~ \upbow | % 36
  bes8 ~ [  <c, bes'>8 ~ ]  c4 ~  <c d'>4  | % 37
  <c c'>2. ~ \downbow | % 38
  <c c'>2. ~ \> | % 39
  <c c'>4  
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
  es2 r8  d4. ~ | % 19
  d1 ~
  d4 r8 e!8 e2~|
  e2.. r8 | % 21
  as1 ~ | % 22
  as1 | % 23
  \time 2/4
  r8 d4. ~ _\p | % 24
  d2~ d2
  r8  g4. ~ _\pp | % 25
  g2~ g2
  r8 f4. ~ 
  f2~ f2~ f2~ f2 
  r8 f4. ~ 
  f2~ f2~ f2
  r8 f4. ~ 
  f2~ f2~ f2 
  \time 3/4   f,2. ~ _\mp  | % 35
  f4  c2 ~ | % 36
  c2. | % 37
  c2^ "pizz." _\mf ees4 | % 38
  r4  aes'2 | % 39
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


