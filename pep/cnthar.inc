C           CENTRAL BODY GRAVITATIONAL POTENTIAL HARMONICS
      COMMON/CNTHAR/ CRAD,CZHAR(u_mxzon-1),
     1 CCHAR((u_mxtes*(u_mxtes+1))/2-1),
     2 CSHAR((u_mxtes*(u_mxtes+1))/2-1),
     3 NCZONE,NCTESS,NCZON1,NCTES1,
     4 ALPHC(2),DELTC(2),CALPHC,SALPHC,CDELTC,SDELTC,
     5 EPOCHC,PSIC0,OMEGC,ICZONE(u_mxzon-1),JCZONE,
     6 ICCOS((u_mxtes*(u_mxtes+1))/2-1),JCCOS,
     7 ICSIN((u_mxtes*(u_mxtes+1))/2-1),JCSIN,NTOPC,NTOPCT,NTPCTP
      REAL*10 CRAD,CZHAR,CCHAR,CSHAR,ALPHC,DELTC,CALPHC,SALPHC,
     1 CDELTC,SDELTC,EPOCHC,PSIC0,OMEGC
      INTEGER*4 NCZONE,NCTESS,NCZON1,NCTES1,ICZONE,JCZONE,
     1 ICCOS,JCCOS,ICSIN,JCSIN,NTOPC,NTOPCT,NTPCTP
