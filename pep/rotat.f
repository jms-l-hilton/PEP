      subroutine ROTAT
 
      implicit none
 
 
c m.e.ash    aug 1969     subroutine rotat
      include 'inodta.inc'
c
c write rotation link title page
      call PAGSET('ROTATION', 2)
      call NEWPG
      write(Iout, 100)
      write(Iout, 200)
  100 format(/////////////32x,
     .       '**********     *********    ************    ********* ',
     .       3x, '************'/32x,
     .       '***********   ***********.  ************   ********** ',
     .       3x, '************'/32x,
     .       '**       **   **       **        **        **       **',
     .       8x, '**'/32x,
     .       '**       **   **       **        **        **       **',
     .       8x, '**'/32x,
     .       '**       **   **       **        **        **       **',
     .       8x, '**'/32x,
     .       '**       **   **       **        **        **       **',
     .       8x, '**'/32x,
     .       '***********   **       **        **        ***********',
     .       8x, '**')
  200 format(32x,
     .       '**********    **       **        **        ***********',
     .       8x, '**'/32x,
     .       '**  **        **       **        **        **       **',
     .       8x, '**'/32x,
     .       '**   **       **       **        **        **       **',
     .       8x, '**'/32x,
     .       '**    **      **       **        **        **       **',
     .       8x, '**'/32x,
     .       '**     **     **       **        **        **       **',
     .       8x, '**'/32x,
     .       '**      **    ***********        **        **       **',
     .       8x, '**'/32x,
     .       '**       **    *********         **        **       **',
     .       8x, '**')
      call PLINK
 
      call SUICID('ROTAT LINK NOT IMPLEMENTED  ', 7)
 
      return
      end