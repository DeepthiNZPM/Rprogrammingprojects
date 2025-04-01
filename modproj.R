earthquake_data <- read.csv("C:/Users/030873607/Downloads/earthquake1995.csv", header = TRUE)
# Assuming you have a data frame called 'earthquake_data'
library(ggplot2)
install.packages("gridExtra")
library(gridExtra)
# Create the first histogram
histogram1 <- ggplot(earthquake_data, aes(x = mmi)) +
  geom_histogram(binwidth = 0.2, fill = "pink", color = "black") +
  labs(x = "Estimated intensity", y = "Frequency", title = "Distribution of Estimated intensity") +
  theme_minimal()+
  theme(axis.text.x = element_text(color = "blue"),  # Change x-axis label color to blue
        axis.text.y = element_text(color = "green"))

# Create the second histogram
histogram2 <- ggplot(earthquake_data, aes(x = cdi)) +
  geom_histogram(binwidth = 0.2, fill = "lightgreen", color = "black") +
  labs(x = "Reported intensity", y = "Frequency", title = "Distribution of reportedintensity") +
  theme_minimal()+
  theme(axis.text.x = element_text(color = "blue"),  # Change x-axis label color to blue
        axis.text.y = element_text(color = "green"))
combined_histogram <- grid.arrange(histogram1, histogram2, nrow = 1)


# Display the combined histogram
print(combined_histogram)

#Boxplot
earthquake_data_filtered <- earthquake_data[earthquake_data$continent != "", ]

boxplot <- ggplot(earthquake_data_filtered, aes(x=continent,y= magnitude)) +
  geom_boxplot(fill = "skyblue", color = "black", outlier.color = "red", outlier.shape = 16, width = 0.5) +  # Customize boxplot appearance
  labs(title = "Box Plot of Earthquake Magnitude", x = "continent", y = "Magnitude") +  # Customize title and axis labels
  theme_minimal() +  # Apply a minimal theme
  theme(axis.text.x = element_text(color = "blue"),  # Color of x-axis labels
        axis.text.y = element_text(color = "green"))  # Color of y-axis labels

# Display the box plot
print(boxplot)


#density plot
ggplot(earthquake_data, aes(x = magnitude)) +
  geom_density(fill = "pink", alpha = 0.7) +
  labs(x = "Magnitude", y = "Density", title = "Density Plot of Earthquake Magnitudes")




earthquake_data$continent[earthquake_data$continent==""]<- "Unknown"

ggplot(earthquake_data, aes(x = continent)) +
  geom_bar(fill = "orange") +
  labs(x = "Continent", y = "Count", title = "Earthquake Counts by Continent")




#---------------------------

