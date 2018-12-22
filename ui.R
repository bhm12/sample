#---------------------------------------------------------------------#
#               k-means Clustering App                               #
#---------------------------------------------------------------------#

library("shiny")
library(DT)
#windowsFonts(devanew=windowsFont("Devanagari new normal"))
shinyUI(
  fluidPage(
  
    titlePanel("UDPipe"),
  
    sidebarLayout( 
      
      sidebarPanel(  
        
              fileInput("file1", "Upload data (text file)"),
              fileInput("file_trained","Upload trained udpipe model for the language of your choice"),
              
              checkboxGroupInput("checkGroup", 
                                 h3("Select POS tags"), 
                                 choices = list("Adjective (JJ)" = "JJ", 
                                                "Noun (NN)" = "NN", 
                                                "Proper Noun (NNP)" = "NNP",
                                                "Adverb (RB)"="RB",
                                                "Verb(VB)"="VB"),
                                 selected = list("JJ","NN","NNP"))
                 ),   # end of sidebar panel
    
    
    mainPanel(
      
      tabsetPanel(type = "tabs",
                  
                      tabPanel("Overview",
                               h4(p("Data input")),
                               p("This app supports only comma separated values (.csv) data file. CSV data file should have headers and the first column of the file should have row names.",align="justify"),
                               p("Please refer to the link below for sample csv file."),
                               a(href="https://github.com/sudhir-voleti/sample-data-sets/blob/master/Segmentation%20Discriminant%20and%20targeting%20data/ConneCtorPDASegmentation.csv"
                                 ,"Sample data input file"),   
                               br(),
                               h4('How to use this App'),
                               p('To use this app, click on', 
                                 span(strong("Upload data (csv file with header)")),
                                 'and uppload the csv data file. You can also change the number of clusters to fit in k-means clustering')),
                  
                  tabPanel("Basic Table",
                          dataTableOutput('df')), 
                  
                  tabPanel("Co-occurrence Table",
                           dataTableOutput('cooc_table')),
                   tabPanel("Co-occurrence plot", 
                                   plotOutput('plot_cooc')),
                   
                      
                      tabPanel("Top POS",
                               h4("Top 10 Adjectives"),
                              tableOutput('out_adj'),
                              br(),
                              h4("Top 10 Nouns"),
                              tableOutput('out_noun'),
                              br(),
                              h4("Top 10 Proper Nouns"),
                              tableOutput('out_prop'),
                              br(),
                              h4("Top 10 Adverbs"),
                              tableOutput('out_advb'),
                              br(),
                              h4("Top 10 Verbs"),
                              tableOutput('out_verb')),
                    
                    tabPanel("Wordcloud",
                             h4("Wordcloud for Adjectives"),  
                           plotOutput('cloud_adj'),
                          br(),
                     h4("Wordcloud for Nouns"),
                    plotOutput('cloud_noun'),
                     br(),
                  h4("Wordcloud for Proper Nouns"),
                  plotOutput('cloud_prop'),
                  br(),
                  h4("Wordcloud for Adverbs"),
                  plotOutput('cloud_advb'),
                  br(),
                  h4("Wordcloud for Verbs"),
                  plotOutput('cloud_verb')
      )
        
      ) # end of tabsetPanel
          )# end of main panel
            ) # end of sidebarLayout
              )  # end if fluidPage
               )  # end of UI



