#Relevant f�r G och VG:

#Tidpunkt f�r n�r telefonen ringde hittar ni i kolonnen time0. 
#Mordet �gde rum vid tidpunkt time0 = 416 +/- 9 minuter.
#M�rdaren ringde ifr�n en iPhone
#F�rs�k att hitta ett uttryck f�r detta tidsspann och hitta max 6 misst�nkta!




#ENDAST RELEVANT INFO F�R VG:
#Mordet �gde rum vid koordinaterna X = 2.22, Y = 2.92.  Ta hj�lp av denna 
#informationen f�r att hitta m�rdaren!

#timem1, timem2 och timem3 m�ter tidpunkten d� masterna tog emot signalen fr�n 
#k�llan vid tidpunkt time0 som telefonen ringde ifr�n. Fundera p� vad som �r 
#relevant f�r att r�kna ut avst�ndet till k�llan - �r time0 i sig viktig eller 
#�r det differenserna timem1 - time0, timem2 - time0 och timem3 - time0?

#Kolla i filen triangulation.r. Du ska anv�nda denna f�r att hj�lpa dig hitta 
#m�rdaren och beh�ver INTE g�ra n�gra �ndringar i triangulation.r. Du beh�ver 
#inte f�rst� den till fullo. 
#Du vill kalla p� mainfunktionen circle_intersection som tar in en 3x3-matris 
#med f�ljande information (till exempel):

example_matrix <- matrix(c(4,7,2,6,4,1,6,6,7), ncol = 3, byrow = TRUE)
#Att namnge kolonner beh�vs inte, men finns h�r som f�rtydligande f�r v�ntat 
#format p� input till circle_intersection.
colnames(example_matrix) <- c("X-coord_mast", "Y-coord_mast", "Avst�nd till k�lla")
rownames(example_matrix) <- c("Mast 1", "Mast 2", "Mast 3")
print(example_matrix)
# H�mtar triangulation filen f�rutsatt den finns i samma working directory.
# p� detta s�ttet kan vi h�mta funktionen circle_intersection utan att kopiera 
# koden till denna filen
source("triangulation.r", encoding = "latin1")
koordinater <- circle_intersection(example_matrix)
koordinater
# x- och y-koordinater till var mobilen befann sig.  


#Variabler:

#Hastighet att anv�nda vid skalning av tid f�r att f� ut distans till mastar. 
#Telefonsignaler breder ut sig radiellt med uuuungef�r ljusets hastighet.
velocity <- 3*10^8

#De fasta koordinaterna f�r masterna. Allts� var masterna befinner sig i ett 
# x-, y-plan. Foga samman denna information med ditt ber�knade avst�nd till 
#k�llan med tid omgjord till distans
master <- matrix(c(4,7,6,4,6,6), ncol = 2, byrow = TRUE)

#Din kod f�ljer h�r. Du f�r g�rna kopiera koden fr�n triangulation.r h�r eller  
#anv�nda source som visat ovan

#Lycka till! :)