#Triangulation!

#H�r �r ett exempel p� god kodvana - en mainfunktion som kallar p� tv� hj�lpfunktioner.

#Mainfunktionen heter circle_intersection och tar in behandlad m�tdata fr�n 
#dataframen.
circle_help_function <- function(circ1, circ2, tol){
  #Vi b�rjar med att namnge v�ra variabler och l�gga till toleransparameter
  x1 <- circ1[1]
  y1 <- circ1[2]
  r1 <- circ1[3] + tol
  x2 <- circ2[1]
  y2 <- circ2[2]
  r2 <- circ2[3] + tol
  
  #R�knar ut intersection points.
  #Analytiskt uttryck som tar l�ng tid att komma fram till...
  #H�r kollar vi p� tv� punkter som tv� cirklar sk�r i varandra.

  bigR <- sqrt((x2-x1)^2+(y2-y1)^2)
  tmp_vect <- c(y2-y1,x1-x2)
  sqrt_term <- (1/2)*sqrt(2*(r1^2+r2^2)/(bigR^2) - (r1^2-r2^2)^2/(bigR^4)-1)
  diff <- sqrt_term*tmp_vect
  origin_points <- (1/2)*(c(x1 + x2, y1 + y2)) + (r1^2-r2^2)/(2*bigR^2)*c(x2 - x1, y2 - y1)
  coords1 <- origin_points + diff
  coords2 <- origin_points - diff
  
  result_coords <- rbind(coords1, coords2)

  return(result_coords)
  
  
  
}

true_intersection <- function(coordinate_matrix1, coordinate_matrix2){
  #Ska ta in alla intersections och se vilka som ligger n�rmast varandra!
  #
  #Best value s�tts till ett godtyckligt, h�gt tal
  best_value <- 100000000
  index <- 0
  for(i in 1:nrow(coordinate_matrix1)){
    for(j in 1:nrow(coordinate_matrix2)){
      #R�kna ut L2-norm f�r varje koordinatpunkt - uppdatera 
      #index ifall vi har en bra �verensst�mmelse!
      val <- norm(coordinate_matrix1[i, ] - coordinate_matrix2[j, ], "2")
      if(is.na(val)){
        print("Skalade du verkligen avst�ndet med velocity?")
      }
      if(val < best_value){
        best_value <- val
        index <- i
        
      }
    }
  }
  true_intersect <- coordinate_matrix1[index, ]
  return(toString(true_intersect))
}


#Ska returna 2x2 matris f�r intersection points som input...

circle_intersection <- function(circle_mat, tol = 0.00005){
  #circle_mat 3x3-matris med x_koord_mast, y_koord_mast, avst�nd_tillk�lla
  #f�r Mast 1, 2 och 3.
  #Mainfunktion. Alltid bra f�r �verblicken att ha en mainfunktion 
  #som kallar p� "hj�lpfunktioner"!
  #Kommer att ge tillbaks en stringrepresentation av koordinaterna d�r det 
  #f�rsta v�rdet �r x-koordinat och det andra v�rdet �r y-koordinat
  
  #tol f�r numerisk stabilitet - undviker avrundningsfel som om�jligg�r en 
  #analytisk l�sning!
  circle1 <- circle_mat[1, ]
  circle2 <- circle_mat[2, ]
  circle3 <- circle_mat[3, ]

  
  coordinates1 <- circle_help_function(circle1, circle2, tol)
  coordinates2 <- circle_help_function(circle1, circle3, tol)
  
  true_intersect <- true_intersection(coordinates1, coordinates2)
  
  
}


