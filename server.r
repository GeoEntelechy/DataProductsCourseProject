library(shiny)

earthRadius = 6378137
minLat = -85.05112878
maxLat = 85.05112878
minLong = -180
maxLong = 180

getWidthAndHeight = function(zoom){
    256^zoom
}
getResolution = function(lat,long,zoom){
    cos(lat * pi / 180.0) * 2 * pi * earthRadius / 
        (256^zoom)
}
getTileID = function(lat,long,zoom){
    x = (long + 180) / 360; 
    sinLat = sin(lat * pi / 180);
    y = 0.5 - log((1 + sinLat) / (1 - sinLat)) / (4 * pi);
    pixelX = min(x * getWidthAndHeight(zoom) + 0.5, 
                 max(0, getWidthAndHeight(zoom) - 1));
    pixelY = min(y * getWidthAndHeight(zoom) + 0.5, 
                 max(0, getWidthAndHeight(zoom) - 1));
    paste(pixelX, pixelY, zoom)
}

shinyServer(
    function(input, output) {
        output$numTiles <- renderPrint({format(4^input$zoomLevel,scientific=FALSE)})
        output$numPixels <- renderPrint({format(getWidthAndHeight(input$zoomLevel)^2,scientific=FALSE)})
#         # I don't trust the area and tile values, yet, so commenting out for now
#         output$pixelArea <- renderPrint({format(getResolution(input$lat,input$long,input$zoomLevel),scientific=FALSE)})
#         output$tileID <- renderPrint({getTileID(input$lat,input$long,input$zoomLevel)})
        }
    )
