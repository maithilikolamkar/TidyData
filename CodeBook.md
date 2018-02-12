Feature Selection 
=================

The features selected for this database come from the  Acceleration elerometer and   Angular Velocity scope 3-axial raw signals Time of  Acceleration -XYZ and Time of   Angular Velocity -XYZ. These time domain signals (prefix 'Time of ' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the  Acceleration eleration signal was then separated into body and gravity  Acceleration eleration signals (Time of Body Acceleration -XYZ and Time of Gravity Acceleration -XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear  Acceleration eleration and angular velocity were derived in time to obtain Jerk signals (Time of Body Acceleration Jerk-XYZ and Time of Body  Angular Velocity Jerk-XYZ). Also the Magnitudenitude of these three-dimensional signals were calculated using the Euclidean norm (tBody Acceleration Magnitude, tGravity Acceleration Magnitude, tBody Acceleration JerkMagnitude, tBody  Angular Velocity Magnitude, tBody  Angular Velocity JerkMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing Frequency of Body Acceleration -XYZ, Frequency of Body Acceleration Jerk-XYZ, Frequency of Body  Angular Velocity -XYZ, Frequency of Body Acceleration JerkMagnitude, Frequency of Body  Angular Velocity Magnitude, Frequency of Body  Angular Velocity JerkMagnitude. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Time of Body Acceleration -XYZ
Time of GraviTime of y Acceleration -XYZ
Time of Body Acceleration Jerk-XYZ
Time of Body  Angular Velocity -XYZ
Time of Body  Angular Velocity Jerk-XYZ
Time of Body Acceleration Magnitude
Time of Gravity Acceleration Magnitude
Time of Body Acceleration JerkMagnitude
Time of Body  Angular Velocity Magnitude
Time of Body  Angular Velocity JerkMagnitude
Frequency of Body Acceleration -XYZ
Frequency of Body Acceleration Jerk-XYZ
Frequency of Body  Angular Velocity -XYZ
Frequency of Body Acceleration Magnitude
Frequency of Body Acceleration JerkMagnitude
Frequency of Body  Angular Velocity Magnitude
Frequency of Body  Angular Velocity JerkMagnitude

The set  of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal Magnitudenitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest Magnitudenitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
Time of Body Acceleration Mean
Time of Body Acceleration JerkMean
Time of Body  Angular Velocity Mean
Time of Body  Angular Velocity JerkMean
