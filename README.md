# Air Quality Dashboard

## Overview
The **Air Quality Dashboard** is an interactive Shiny app built in R. It provides a user-friendly way to explore the `airquality` dataset, which contains daily air quality measurements in New York for 1973. The app includes features to filter data, visualize relationships, and download processed datasets for offline use.


## Dataset Information
The app uses the built-in R dataset **`airquality`**, which contains:
- **Ozone**: Ozone concentration in parts per billion.
- **Solar.R**: Solar radiation in langleys.
- **Wind**: Wind speed in miles per hour.
- **Temp**: Temperature in Fahrenheit.
- **Month**: Month (as a number: May = 5, June = 6, etc.).
- **Day**: Day of the month.


## Features
The app offers the following functionalities:

1. **Tabbed Layout**:
   - The app is organized into three tabs:
     - **Table**: Displays the filtered dataset as an interactive table.
     - **Plot**: Visualizes the relationship between temperature and ozone levels.
     - **Summary**: Provides a summary of the dataset for the selected month.

2. **Interactive Table**:
   - Users can explore the data interactively, with options to sort and search.

3. **Dynamic Plot**:
   - A scatter plot dynamically updates based on the selected month, showing temperature vs. ozone levels.

4. **Month Filter**:
   - Users can filter the dataset by month or view the entire dataset.

5. **Download Filtered Data**:
   - Provides an option to download the filtered dataset as a CSV file for offline analysis.



## Instructions
### Running the App Locally
1. Install R and RStudio on your machine.
2. Ensure the required R packages are installed:
   ```R
   install.packages(c("shiny", "DT"))
   ```
3. Clone this repository or download the app files.
4. Open the app in RStudio and run it:
   ```R
   library(shiny)
   runApp("path_to_your_app_folder")
   ```

### Accessing the Deployed App
Visit the deployed app at:
[https://thedrna.shinyapps.io/AssignmentB3/](https://thedrna.shinyapps.io/AssignmentB3/)


## How to Use
1. **Filter by Month**:
   - Use the dropdown in the sidebar to filter the dataset by a specific month or view all data.
2. **Explore the Tabs**:
   - **Table Tab**: Interactively explore the filtered dataset.
   - **Plot Tab**: View a scatter plot showing temperature vs. ozone levels.
   - **Summary Tab**: Read a quick summary of the dataset for the selected month.
3. **Download Data**:
   - Click the "Download Filtered Data" button to save the filtered dataset as a CSV file.

