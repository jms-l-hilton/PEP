C           INTERPOLATION Y-VECTORS AND TEMPORARY STORAGE
      COMMON/YVECT/ CN1X(u_nmbod+6),CN2X(u_nmprm),SECX,TCONX(30),
     1 TPNAME,TITLE(10),GMESS(10),
     2 BEPS(6),M1,M2,INT1X,INT2X,IFLTRX,LEVELX,JDD1,JDD2,
     3 JDXX0,JDXX9,JTEST,NPRMX,NCNMX,L1,L2,IPAR1,INT1,ICNX,IHRX,IMINX,
     4 KKXX(100),NPYY
      CHARACTER*8 TPNAME,TITLE,GMESS
      REAL*10 CN1X,CN2X,SECX,TCONX
      REAL*4 BEPS
      INTEGER*4 M1,M2,INT1X,INT2X,IFLTRX,LEVELX,JDD1,JDD2,JDXX0,JDXX9,
     1 JTEST,NPRMX,NCNMX
      INTEGER*2 L1,L2,IPAR1,INT1,ICNX,IHRX,IMINX,KKXX,NPYY
