C           OBSERVING SITES WITH ADJUSTABLE COORDINATES
      COMMON/STCORD/ SITE(2,u_mxsit),SCORD(6,u_mxsit),T0SITE(u_mxsit),
     1 LSCRD(6,u_mxsit),NUMSIT,KSCRD(u_mxsit)
      CHARACTER*4 SITE
      REAL*10 SCORD,T0SITE
      INTEGER*2 LSCRD,NUMSIT,KSCRD
      CHARACTER*8 SITD(u_mxsit)
      EQUIVALENCE (SITE(1,1),SITD(1))
