library(shiny)

#setwd("/Users/yakich/vrygit/DataProductsCourseProject")
#runApp()

shinyUI(pageWithSidebar(
    headerPanel("How Many Pixels on a Web Map?"),
    sidebarPanel(
        p('Enter values below to learn about web map tiles'),
#        p('Enter values below to learn about spherical mercator map projection tiles.'),
        sliderInput('zoomLevel', 'Choose a Map Zoom Level', 5, min = 0, max = 25, step = 1,)
#         #I don't trust the area and tile id values, yet, so commenting out for now
#         ,
#         numericInput('lat','Enter Latitude',0,-85.05112878,85.05112878),
#         numericInput("long","Enter Longitude",0,-180,180)
    ),
    mainPanel(
        h3('Number of tiles at this zoom level'),
        verbatimTextOutput('numTiles'),
        h3('Number of pixels at this zoom level'),
        verbatimTextOutput('numPixels'),
#        #I don't trust the area, tile values, yet, so commenting out for now
#         h3('Ground area in square meters of a pixel'),
#         verbatimTextOutput('pixelArea'),
#         h3('Tile ID at given lat,long'),
#         verbatimTextOutput("tileID"),
#         p('This web tool presumes an Earth radius of 6,378,137 meters and latitute min/max as -85.05112878/85.05112878 degrees.'),
        p(HTML('To learn more see <a href="http://msdn.microsoft.com/en-us/library/bb259689.aspx">this page</a> by Microsoft.'))
    )
))
