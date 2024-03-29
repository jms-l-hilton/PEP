C            EARTH, MOON, AND PLANET COORDINATES
      COMMON/MORCRD/ RVEC(6,11,11),RAB(11,11),V(3,11),VAB2(11,11),
     1 RE2,RE3,RE4,RE5,RM2,RM3,RM4,RM5,REM2,REM3,REM4,REM5,SMECOR(3),
     2 SMCOR(3),SPCOR(3,3:6),SREM,SRM,SPC(3:6),SREM2,SRM2,SPC2(3:6),
     3 SREM5,SRM5,SPC5(3:6),MPCOR(3,6)
      REAL*10 RVEC,RAB,V,VAB2,RE2,RE3,RE4,RE5,RM2,RM3,RM4,RM5,
     1 REM2,REM3,REM4,REM5,SMECOR,SMCOR,SPCOR,SREM,SRM,SPC,
     2 SREM2,SRM2,SPC2,SREM5,SRM5,SPC5,MPCOR
C RVEC(.,I,J) - COORDINATES OF BODY I W.R.T. BODY J, WHERE
C     1-9 ARE PLANETS, AND 3 IS SPECIFICALLY EARTH, NOT EMBARY,
C     10 = SUN
C     11 = MOON
C RAB(I,J) - DISTANCE FROM BODY I TO BODY J, AS ABOVE
C V(.,I) - BARYCENTRIC VELOCITY OF BODY I
C VAB2(I,J) - DOT PRODUCT OF V(.,I) AND V(.,J)
C     SOME PREDEFINED SPECIAL CASES:
      REAL*10 PECOR(6,11),PMCOR(6,11),RPE(11),RPM(11)
      REAL*10 MECOR(6),ECOR(6),MCOR(6),REM,RE,RM
      EQUIVALENCE (PECOR,RVEC(1,1,3)),(PMCOR,RVEC(1,1,11)),
     1 (MECOR,RVEC(1,11,3)),(MCOR,RVEC(1,11,10)),(ECOR,RVEC(1,3,10)),
     2 (RPE,RAB(1,3)),(RPM,RAB(1,11)),(REM,RAB(11,3)),(RE,RAB(3,10)),
     3 (RM,RAB(11,10))
