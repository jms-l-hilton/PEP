      SUBROUTINE NAMPMA(NUMPAR,NAMES,KLDT,KTOTDT)
      IMPLICIT NONE
C         GENERATES A LIST OF NAMES OF PARAMETERS FOR WHICH THERE ARE
C         PARTIAL DERIVATIVES ON A OBSLIB SERIES

      include 'pepglob.inc'
C
C         PARAMETERS
      INTEGER*4 NUMPAR,KLDT,KTOTDT
      CHARACTER*8 NAMES(2,1)
C
C         COMMON
C -------NOTE: MUST INCLUDE PEP BLKDATA4 FOR THESE NAMES ----------
      include '../pep/prmnms.inc'
      include 't2a.inc'
      include 't3a.inc'
      CHARACTER*4 SITF(2,2)
      EQUIVALENCE (SITF,RITA)
C
C         LOCALS
      CHARACTER*8 PREFIX,BNAME,CNAME,PLNNAM, TEMP, NONAME/'NONAME'/
      INTEGER*4 I,IMAX,IOFF,J,K,L,ND,NLAN,NSCAN
      CHARACTER*8 COORD(6)/'RAD','LONG','LAT','UP','WEST','NORTH'/,
     1     CORREC(3) /'DENOX','DEQUAT','DLAT'/,
     2     MASSN/'MASS'/, ZEE/'Z'/, PLSR/'PLSR'/, CON1/'CON( )'/,
     3     CON2/'CON(  )'/
      INTEGER*2 NCZONE,NCTESS,NSZONE,NSTESS,NTZONE(11),NTTESS(11)
      CHARACTER*8 EROTAT/'EROTAT'/, MROTAT/'MROTAT'/
      CHARACTER*1 MINUS/'-'/
      CHARACTER*8 BLANKS/'        '/
      CHARACTER*8 DTNAMS(4)/'ET-UT2','A1-UT1','XWOB','YWOB'/
C
C         INITIALIZE AND RESET HARMONIC ORDERS FROM EXPANDED FORM
      K=0
      NCZONE=NCZNEA+1
      NSZONE=NSZNEA+1
      NCTESS=0
      IF(NCTSSA.GE.0) NCTESS=(0.999+SQRT(8.0*NCTSSA+9.0))/2.
      NSTESS=0
      IF(NSTSSA.GE.0) NSTESS=(0.999+SQRT(8.0*NSTSSA+9.0))/2.
      IF(NUMTRA.GT.0) THEN
         DO I=1,NUMTRA
            NTZONE(I)=NTZNEA(I)+1
            NTTESS(I)=0
            IF(NTTSSA(I).GE.0) NTTESS(I)=
     .       (0.999+SQRT(8.0*NTTSSA(I)+9.0))/2
         END DO
      ENDIF
C
C         LEFT JUSTIFY PLNNAM
      PLNNAM=NONAME
      I=NSCAN(PNAMA,8,BLANKS)+1
      IF(I.GT.0) THEN
         TEMP=BLANKS
         CALL MVC(PNAMA,I,9-I,TEMP,1)
         PLNNAM=TEMP
      ENDIF
C
C           SET UP PULSAR NAME
      CALL MVC(SPOTA,1,4,PLSR,5)
C
C         OBSERVING SITE COORDINATES
      DO J=1,2
         IF(J.EQ.2 .AND. SITF(1,1).EQ.SITF(1,2)) GOTO 15
         DO I=1,6
            IF(LSCRDA(I,J).NE.0) THEN
               K=K+1
               CALL MVC(SITF(1,J),1,8,NAMES(1,K),1)
               IF(KSITEA(J).GE.0 .OR. I.NE.3) THEN
                  NAMES(2,K)=COORD(I)
               ELSE
                  NAMES(2,K)=ZEE
               ENDIF
            ENDIF
         END DO
      END DO
   15 CONTINUE
C
C         EQUATOR-EQUINOX CORRECTIONS
      DO I=1,3
         IF(LEQNA(I).GT.0) THEN
            K=K+1
            CALL MVC(SITF(1,1),1,4,NAMES(1,K),1)
            CALL MVC(SERA,1,4,NAMES(1,K),5)
            NAMES(2,K)=CORREC(I)
         ENDIF
      END DO
C
C           SKY CORRECTIONS
      DO I=1,NSKYCA
         IF(LSKYA(I).GT.0) THEN
            K=K+1
            NAMES(1,K)=CTLGA
            NAMES(2,K)=BLANKS
            ND=1
            IF(I.GT.9) ND=2
            IF(I.GT.99) ND=3
            CALL EBCDI(I,NAMES(2,K),ND)
         ENDIF
      END DO
C
C         SOLAR SYSTEM PARAMETERS
      DO I=1,NMPRM
         IF(LPRMA(I).EQ.0) GOTO 70
         K=K+1
         L=LPRMA(I)
         IF(L.LE.30) THEN
C
C     MASSES
            NAMES(1,K)=MASSN
            NAMES(2,K)=BNAME(L)
            GOTO 60
         ENDIF
C
C     OTHER PARAMS
C     NO SPECIAL NAME
         TEMP=QPRMTR
         CALL EBCDIX(L,TEMP,7,2)
         NAMES(1,K)=TEMP
         NAMES(2,K)=BLANKS
         DO J=1,PRMSMX
            IF(L.EQ.IPRMS(J)) THEN
C     SPECIAL NAME
               NAMES(1,K)=PRMS(J)
               GOTO 60
            ENDIF
         END DO
C
   60 END DO
   70 CONTINUE
C
C         EMBARY AND EARTH PARAMETERS
      PREFIX=BNAME(3)
      CALL BDYPMA(LGSA(1,1),PREFIX,K,NAMES)
C
C         EARTH ROTATION
      CALL BDYPMA(LGSA(1,3),EROTAT,K,NAMES)
C
C         ET-UT2, A1-UT1, WOBBLE DATES
      KLDT=K+3
      KTOTDT=0
      IF(NUMDTA.LE.0) GOTO 95
      IOFF=1
      KTOTDT=6
      IF(NMDT1A.GT.200) GOTO 85
      IOFF=0
      KTOTDT=2
   85 IMAX=KTOTDT/2
      DO 92 I=1,IMAX
      DO 90 J=1,2
      K=K+1
      NAMES(1,K)=DTNAMS(I+IOFF)
      NAMES(2,K)=BLANKS
 90   CONTINUE
   92 IOFF=1
C
C         EARTH HARMONICS
  95  IF(NCENTA.EQ.3 .AND. NPLNTA.NE.10) THEN
         IF(NCZONE.GT.1)
     1    CALL HRMPMA(LCZHRA,PREFIX,K,NAMES,1,NCZONE)
         IF(NCTESS.GT.1) THEN
            CALL HRMPMA(LCCHRA,PREFIX,K,NAMES,2,NCTESS)
            CALL HRMPMA(LCSHRA,PREFIX,K,NAMES,3,NCTESS)
         ENDIF
      ENDIF
C
C         MOON PARAMETERS
      PREFIX=BNAME(10)
      CALL BDYPMA(LGSA(1,2),PREFIX,K,NAMES)
C
C         MOON ROTATION
      CALL BDYPMA(LGSA(1,4),MROTAT,K,NAMES)
C
C         MOON HARMONICS
      IF(NCENTA.EQ.10) THEN
         IF(NCZONE.GT.1)
     1    CALL HRMPMA(LCZHRA,PREFIX,K,NAMES,1,NCZONE)
         IF(NCTESS.GT.1) THEN
            CALL HRMPMA(LCCHRA,PREFIX,K,NAMES,2,NCTESS)
            CALL HRMPMA(LCSHRA,PREFIX,K,NAMES,3,NCTESS)
         ENDIF
      ENDIF
      IF(NPLNTA.EQ.10 .OR. NPLN2A.EQ.10) THEN
         IF(NSZONE.GT.1)
     1    CALL HRMPMA(LSZHRA,PREFIX,K,NAMES,1,NSZONE)
         IF(NSTESS.GT.1) THEN
            CALL HRMPMA(LSCHRA,PREFIX,K,NAMES,2,NSTESS)
            CALL HRMPMA(LSSHRA,PREFIX,K,NAMES,3,NSTESS)
         ENDIF
      ENDIF
C
C           SET UP PLANET POINTER
      NLAN=0
      IF(NPLNTA.GT.0.AND.NPLNTA.LE.30) NLAN=NPLNTA
      IF(NCENTA.GT.0) NLAN=NCENTA
      IF(NLAN.EQ.3.OR.NLAN.EQ.10) NLAN=0
C         PARAMETERS OF OBSERVING BODY NOT THE EARTH
      IF(N6A.GE.NMBOD) CALL BDYPMA(LSCA,SCNAMA,K,NAMES)
C
C         PLANET IC'S AND CON'S
      CNAME=PLNNAM
      IF(NLAN.NE.NPLNTA) CNAME=BNAME(NLAN)
      IF(NLAN.LE.0) GOTO 130
      CALL BDYPMA(LPLA,CNAME,K,NAMES)
C
C         PLANET SHAPE HARMONICS
      TEMP=CNAME
      TEMP(1:1)=MINUS
      PREFIX=TEMP
      IF(LNFORA.GT.0) CALL HRMPMA(LSZHRA,PREFIX,K,NAMES,-1,LNFORA)
      IF(LNGDA.GT.0) CALL HRMPMA(LSZHRA,PREFIX,K,NAMES,-2,LNGDA)
      IF(LNFORA.GT.0.OR.LNGDA.GT.0) GOTO 120
      IF(NSZONE.GT.1)
     1  CALL HRMPMA(LSZHRA,PREFIX,K,NAMES,1,NSZONE)
      IF(NSTESS.LE.1) GOTO 120
      CALL HRMPMA(LSCHRA,PREFIX,K,NAMES,2,NSTESS)
      CALL HRMPMA(LSSHRA,PREFIX,K,NAMES,3,NSTESS)
 120  CONTINUE
C
C         PLANET HARMONICS
      IF((NCENTA.LE.0).OR.(NCENTA.EQ.3).OR.(NCENTA.EQ.10))
     1  GOTO 130
      IF(NCZONE.GT.1)
     1  CALL HRMPMA(LCZHRA,CNAME,K,NAMES,1,NCZONE)
      IF(NCTESS.LE.1) GOTO 130
      CALL HRMPMA(LCCHRA,CNAME,K,NAMES,2,NCTESS)
      CALL HRMPMA(LCSHRA,CNAME,K,NAMES,3,NCTESS)
 130  CONTINUE
C
C         SATELLITE,PROBE PARAMETERS
      PREFIX=PLNNAM
      CALL BDYPMA(LSBA,PREFIX,K,NAMES)
C
C         PLANET SPOT COORDINATES
      I=NPLNTA
      CALL SPTPMA(I,K,NAMES,LSPCDA,SPOTA)
      I=NPLN2A
      CALL SPTPMA(I,K,NAMES,LSPC2A,SPOT2A)
C
C         PLANET RADAR BIASES
      I=NPLNTA
      CALL RBSPMA(I,K,NAMES,LRBSA,SITF,SERA)
C
C         PLANET OPTICAL PHASE CORRECTIONS
      CALL PHSPMA(I,K,NAMES,LPHSA,NCPHA,SITF,SERA)
C
C         LOOP THROUGH TARGET BODIES
      DO I=1,NUMTRA
         IF(NTRGA(I).GT.0) THEN
            L=NTRGA(I)
            PREFIX=BNAME(L)
C
C         TARGET BODY IC'S AND PARAMETERS
            CALL BDYPMA(LTBODA(1,I),PREFIX,K,NAMES)
C
C         TARGET BODY HARMONICS
            IF(NTZONE(I).GT.1)
     1       CALL HRMPMA(LTZHRA(1,I),PREFIX,K,NAMES,1,NTZONE(I))
            IF(NTTESS(I).GT.1) THEN
               CALL HRMPMA(LTCHRA(1,I),PREFIX,K,NAMES,2,NTTESS(I))
               CALL HRMPMA(LTSHRA(1,I),PREFIX,K,NAMES,3,NTTESS(I))
            ENDIF
         ENDIF
      END DO
C
C           EXO-PLANET PARAMETER NAMES
      DO I=1,NMPEXA
         L=NPLEXA(I)
         PREFIX=BNAME(L)
         CALL BDYPMA(LPEXA(1,I),PREFIX,K,NAMES)
      END DO
C
C           PULSAR PARAMETER NAMES
      IF(N9A.LE.1) GOTO 182
      TEMP=CON1
      ND=1
      DO I=1,N9A
         L=LPSRCA(I)
         IF(L.LE.0) GOTO 182
         K=K+1
         NAMES(1,K)=PLSR
         IF(L.GE.10) THEN
            TEMP=CON2
            ND=2
         ENDIF
         CALL EBCDIX(L,TEMP,5,ND)
         NAMES(2,K)=TEMP
      END DO
  182 CONTINUE
C
C         SET NUMPAR=K(SHOULD=NPARAM)
      NUMPAR=K
      RETURN
      END