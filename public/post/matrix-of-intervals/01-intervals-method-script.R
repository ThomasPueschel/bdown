# The intervals method
# Script for obtaining the intervals matrix
# Script powered by Jordi Marce-Nogue and Thomas Puschel
#
# Cite: Marce-Nogue, J., De Esteban-Trivigno, S., Puschel, T.A., Fortuny, J., 2017. The intervals method: a new approach to analyse finite element outputs using multivariate statistics. PeerJ 5, e3793. 
# https://doi.org/10.7717/peerj.3793
# -------------------------------------------------------------------------


# 1) Set the input parameters for the method (these values are defined by the user):
# Fixed Upper Threshold FTupper

FTupper = 0.1;

# Number of intervals: NIntervals

NIntervals = 25;

# 2) Read the data.
# The data must be stored as .csv files in the same folder of the script
# Each .csv file must contain three rows with: 1) the number of the element, 
# 2) area/volume of the element and 3) von mises stress, respectively.

file.name = list.files(pattern="*.csv")
NFiles = length(file.name)

# 3) Create the matrix of intervals
# Each row with the area percentage for each interval and each file of the matrix 
# with the different models included

data.intervals = matrix(,ncol = NIntervals, nrow = NFiles)

for (f in 1:NFiles) {

  data.values = data.matrix(read.csv(file.name[f], header = TRUE, sep = ","));

  # Get the number of mesh elements of the model

  NElements = nrow(data.values);

  # Create the internal matrix to store the intervals and other data

  Counter.matrix = matrix(0,ncol = NIntervals, nrow = 5);

  # Compute the range values for each interval (Tlower and Tupper)

  Range.values = seq(0, FTupper, by=FTupper/(NIntervals-1));

  # Start the Loop

  for (i in 1:NElements) {
    for (j in 1:NIntervals) {
      if (j == 1){
        if (data.values[i,3] <= Range.values[j+1]) 
          {
          Counter.matrix[2,j]=Counter.matrix[2,j]+1;
          Counter.matrix[4,j]=Counter.matrix[4,j]+data.values[i,2];
          }
      }
      else if (j > 1 & j < NIntervals){
        if (data.values[i,3] > Range.values[j] & data.values[i,3] <= Range.values[j+1]) 
        {
        Counter.matrix[2,j]=Counter.matrix[2,j]+1;
        Counter.matrix[4,j]=Counter.matrix[4,j]+data.values[i,2];
        }   
      }
      else if (j == NIntervals){
        if (data.values[i,3] > Range.values[j]) 
        {
        Counter.matrix[2,j]=Counter.matrix[2,j]+1;
        Counter.matrix[4,j]=Counter.matrix[4,j]+data.values[i,2];
        }
      }
    }
  }
  
  # End of the loop

  # Compute the percentage in each interval with respect  to the total area

  for (i in 1:NIntervals) {
    Counter.matrix[1,i]=Range.values[i];
    Counter.matrix[3,i]=100*Counter.matrix[2,i]/NElements;
    Counter.matrix[5,i]=100*Counter.matrix[4,i]/sum(data.values[,2]);
  }

  # Store the vector of intervals for the model f in the matrix of intervals

  data.intervals[f,]=Counter.matrix[5,];

}

data.intervals=as.data.frame(data.intervals);
row.names(data.intervals)=file.name;

# 4) End of the script: save data and remove variables

write.csv(data.intervals,'matrix-of-intervals.csv');
rm(NIntervals, FTupper, NElements, i, j, f, file.name, NFiles, Range.values, Counter.matrix, data.values);
cat("\f");
print(paste0("Matrix of intervals created and stored in a .csv file in the working dir: ", getwd()));





