#' @title Plot and .csv files for DDT data
#'
#' @param df the used data frame
#' @param SPECIES the specified species
#'
#' @return A plot of DDT data, a .csv file, and list outputs
#' @export
#'
#' @examples \dontrun{myddt(df = ddt, species = "CCATFISH")}
#'
myddt <- function(df, SPECIES)
{

  print(ddt)

  #rel freq before subsetting:
  tab = table(df$RIVER) / length(df$RIVER)
  print(tab)

  newdf <- df%>% filter(SPECIES == {{SPECIES}})

  print(newdf)


  g <- ggplot(newdf, aes_string(x= "WEIGHT" ,y= "LENGTH")) +
    #the color according to RIVER
    geom_point(aes_string(color = "RIVER" )) +
    #Quadratic curve
    geom_smooth(formula = y~x +I(x^2), method = "lm") +
    #name as title
    ggtitle("Reagan Rasmussen")
  print(g)


  #the data frame used to make the plot is df1
  #df1 needs to be written to the working directory as a csv
  #file called LvsWforSPECIES.csv

  if(SPECIES == "CCATFISH"){
    write.csv(newdf, "LvsWforCCATFISH.csv", row.names = FALSE)
  }
  if(SPECIES == "SMBUFFALO"){
    write.csv(newdf, "LvsWforSMBUFFALO.csv", row.names = FALSE)
  }
  if(SPECIES == "LMBASS"){
    write.csv(newdf, "LvsWforLMBASS.csv", row.names = FALSE)
  }



}
