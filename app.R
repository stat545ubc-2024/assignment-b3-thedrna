#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(DT)

# UI
ui <- fluidPage(
  titlePanel("Air Quality Dashboard"),
  sidebarLayout(
    sidebarPanel(
      selectInput("month_filter", "Select Month:", 
                  choices = c("All", unique(as.character(airquality$Month))), 
                  selected = "All"),
      downloadButton("download_data", "Download Filtered Data")
    ),
    mainPanel(
      # Feature 1: Tabbed Layout
      # Purpose: Organizes outputs into three separate tabs for better user experience.
      
      tabsetPanel(
        tabPanel("Table", DT::dataTableOutput("airquality_table")),
        tabPanel("Plot", plotOutput("airquality_plot")),
        tabPanel("Summary", textOutput("summary"))
      )
    )
  )
)

# Server
server <- function(input, output) {
  # Preprocess the dataset: Remove rows with NA values
  cleaned_data <- na.omit(airquality)
  # Feature 2: Filter data by month (Reactive expression)
  # Purpose: Allows users to focus on data from a specific month or all months.
  
  filtered_data <- reactive({
    if (input$month_filter == "All") {
      cleaned_data
    } else {
      cleaned_data[cleaned_data$Month == as.numeric(input$month_filter), ]
    }
  })
  
  # Feature 3: Render an interactive table
  # Purpose: Displays the filtered dataset in an interactive table for exploration.
  
  output$airquality_table <- DT::renderDataTable({
    DT::datatable(filtered_data())
  })
  
  # Feature 4: Render a dynamic plot
  # Purpose: Visualize the relationship between temperature and ozone levels for the filtered dataset.
  
  output$airquality_plot <- renderPlot({
    data <- filtered_data()
    plot(data$Temp, data$Ozone,
         xlab = "Temperature (F)", ylab = "Ozone (ppb)",
         main = "Temperature vs. Ozone",
         col = "blue", pch = 16)
  })
  
  # Feature 5: Render a summary of the filtered dataset
  # Purpose: Provides a quick summary of the number of observations in the selected month.
  
  output$summary <- renderText({
    data <- filtered_data()
    paste("This dataset contains", nrow(data), "observations for the selected month.")
  })
  
  # Feature 6: Allow users to download the filtered dataset
  # Purpose: Gives users the ability to save and analyze the filtered dataset offline.
  
  output$download_data <- downloadHandler(
    filename = function() {
      paste("airquality_filtered", Sys.Date(), ".csv", sep = "")
    },
    content = function(file) {
      write.csv(filtered_data(), file, row.names = FALSE)
    }
  )
}

# Run the app
shinyApp(ui = ui, server = server)
