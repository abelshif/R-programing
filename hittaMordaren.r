#Relevant för G och VG:

#Tidpunkt för när telefonen ringde hittar ni i kolonnen time0. 
#Mordet ägde rum vid tidpunkt time0 = 416 +/- 9 minuter.
#Mördaren ringde ifrån en iPhone
#Försök att hitta ett uttryck för detta tidsspann och hitta max 6 misstänkta!




#ENDAST RELEVANT INFO FÖR VG:
#Mordet ägde rum vid koordinaterna X = 2.22, Y = 2.92.  Ta hjälp av denna 
#informationen för att hitta mördaren!

#timem1, timem2 och timem3 mäter tidpunkten då masterna tog emot signalen från 
#källan vid tidpunkt time0 som telefonen ringde ifrån. Fundera på vad som är 
#relevant för att räkna ut avståndet till källan - är time0 i sig viktig eller 
#är det differenserna timem1 - time0, timem2 - time0 och timem3 - time0?

#Kolla i filen triangulation.r. Du ska använda denna för att hjälpa dig hitta 
#mördaren och behöver INTE göra några ändringar i triangulation.r. Du behöver 
#inte förstå den till fullo. 
#Du vill kalla på mainfunktionen circle_intersection som tar in en 3x3-matris 
#med följande information (till exempel):

example_matrix <- matrix(c(4,7,2,6,4,1,6,6,7), ncol = 3, byrow = TRUE)
#Att namnge kolonner behövs inte, men finns här som förtydligande för väntat 
#format på input till circle_intersection.
colnames(example_matrix) <- c("X-coord_mast", "Y-coord_mast", "Avstånd till källa")
rownames(example_matrix) <- c("Mast 1", "Mast 2", "Mast 3")
print(example_matrix)
# Hämtar triangulation filen förutsatt den finns i samma working directory.
# på detta sättet kan vi hämta funktionen circle_intersection utan att kopiera 
# koden till denna filen
source("triangulation.r", encoding = "latin1")
koordinater <- circle_intersection(example_matrix)
koordinater
# x- och y-koordinater till var mobilen befann sig.  


#Variabler:

#Hastighet att använda vid skalning av tid för att få ut distans till mastar. 
#Telefonsignaler breder ut sig radiellt med uuuungefär ljusets hastighet.
velocity <- 3*10^8

#De fasta koordinaterna för masterna. Alltså var masterna befinner sig i ett 
# x-, y-plan. Foga samman denna information med ditt beräknade avstånd till 
#källan med tid omgjord till distans
master <- matrix(c(4,7,6,4,6,6), ncol = 2, byrow = TRUE)

#Din kod följer här. Du får gärna kopiera koden från triangulation.r här eller  
#använda source som visat ovan

#Lycka till! :)