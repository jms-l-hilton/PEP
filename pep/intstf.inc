C            MISCELLANEOUS SHARED INTEGRATION STUFF
      COMMON/INTSTF/ TLPT,TLPT0,FN(2),GAMA,GAMAT,GAMA3,GAMAT3,MASS1(18),
     1 MASSE,FRACT,PINT5,TVARY0,TVARY,CVEL,CVEL2,MERTH,MMOON,RLFACT,
     2 A44,B2G2,B2G21,B2M1,G11,G21,G22,G7,XMASS(0:11),SHAR2,C3(3),
     3 SUNRD2,X0M(6,3),DX0M(6,6,3),ASUNMOR(3),AEMBMOR(3),
     4 JD,NUMTAR,INDEX1,JNDEX1,INDEX2,NTAB,MTAB,NTABR,NREC,
     5 NTRG(i_mxtrg),ORBINT,ROTINT,CORINT
      REAL*10 TLPT,TLPT0,FN,GAMA,GAMAT,GAMA3,GAMAT3,MASS1,
     1 MASSE,FRACT,PINT5,TVARY0,TVARY,CVEL,CVEL2,MERTH,MMOON,RLFACT,
     2 A44,B2G2,B2G21,B2M1,G11,G21,G22,G7,XMASS,SHAR2,C3,SUNRD2,
     3 X0M,DX0M,ASUNMOR,AEMBMOR
      INTEGER*4 JD,NUMTAR,INDEX1,JNDEX1,INDEX2,NTAB,MTAB,NTABR,NREC,NTRG
      LOGICAL*4 ORBINT,ROTINT,CORINT
      REAL*10 BINT,MINT5,RELMON
      EQUIVALENCE (BINT,MINT5,PINT5),(RELMON,RLFACT)
c notes: Mass1 not set/used in MOR
c Cvel not set/used in SB