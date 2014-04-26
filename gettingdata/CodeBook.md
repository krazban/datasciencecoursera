Aggregated samsung tidy dataset CodeBook
========================================================

dataset name: samsungtidyds.txt

The features selected for this database come from the mean and stdandard diviaton of accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. For this project it was decided to select only the mean, standard diviation, and the subsequent derivation of these signal measurements.  The Frequency of the mean measurements also captured for further analysis. The resulting dataset should report the average of _mean_ and _standard deviation_  of each selected column for a given activity(described below). The final data set has a total of 82 columns.

Each row of dataset includes subjectid, activity, activitycode , and 79 columns that
are the average of selected columns for each subject and its corresponding activity.

## Column names modifications

 In order to comply with tidy dat rules, column names had to be modified. These modifications are listed below:
 
* All the activity lables are changed from their original format to lower-case.

* All column names are transformed to lower case.

* Parenthesis and underscores are removed.

* Each part of the feature names is separated by a dot.


##  Description of parts of feature names.

Each variable is a combination of different words concatenated by a dot in an abbriviated form.

followings are the description of these abbriviated feature parts 
```
 part      description
 
 mean    : mean value
 std     : standard diviation
 acc     : acceleration from accelerometer signal
 gyr     : gyroscope signal
 mag     : magnitude
 freq    : frequency
 t       : prefix for time
 f       : prefix for fast Fourier transformation
 
```
### column names and their order as they appear in the data set.

* **subject.id**, indicating the participant id for a total 30 participant.

* **activity**, indicating the action of the subject for the measurment.

* **activity.code**,  integer value for each level of activity


The six level of activities with their corresponding codes:

```
activity.code   activity

1.              walking              
2.              walking.upstairs     
3.              walking.downstairs   
4.              sitting              
5.              standing             
6.              laying               
```

Number of Columns: 82

```
1. subject.id
2. activity
3. activity.code
4. t.body.acc.mean.x
5. t.body.acc.mean.y
6. t.body.acc.mean.z
7. t.body.acc.std.x
8. t.body.acc.std.y
9. t.body.acc.std.z
10. t.gravity.acc.mean.x
11. t.gravity.acc.mean.y
12. t.gravity.acc.mean.z
13. t.gravity.acc.std.x
14. t.gravity.acc.std.y
15. t.gravity.acc.std.z
16. t.body.acc.jerk.mean.x
17. t.body.acc.jerk.mean.y
18. t.body.acc.jerk.mean.z
19. t.body.acc.jerk.std.x
20. t.body.acc.jerk.std.y
21. t.body.acc.jerk.std.z
22. t.body.gyro.mean.x
23. t.body.gyro.mean.y
24. t.body.gyro.mean.z
25. t.body.gyro.std.x
26. t.body.gyro.std.y
27. t.body.gyro.std.z
28. t.body.gyro.jerk.mean.x
29. t.body.gyro.jerk.mean.y
30. t.body.gyro.jerk.mean.z
31. t.body.gyro.jerk.std.x
32. t.body.gyro.jerk.std.y
33. t.body.gyro.jerk.std.z
34. t.body.acc.mag.mean
35. t.body.acc.mag.std
36. t.gravity.acc.mag.mean
37. t.gravity.acc.mag.std
38. t.body.acc.jerk.mag.mean
39. t.body.acc.jerk.mag.std
40. t.body.gyro.mag.mean
41. t.body.gyro.mag.std
42. t.body.gyro.jerk.mag.mean
43. t.body.gyro.jerk.mag.std
44. f.body.acc.mean.x
45. f.body.acc.mean.y
46. f.body.acc.mean.z
47. f.body.acc.std.x
48. f.body.acc.std.y
49. f.body.acc.std.z
50. f.body.acc.mean.freq.x
51. f.body.acc.mean.freq.y
52. f.body.acc.mean.freq.z
53. f.body.acc.jerk.mean.x
54. f.body.acc.jerk.mean.y
55. f.body.acc.jerk.mean.z
56. f.body.acc.jerk.std.x
57. f.body.acc.jerk.std.y
58. f.body.acc.jerk.std.z
59. f.body.acc.jerk.mean.freq.x
60. f.body.acc.jerk.mean.freq.y
61. f.body.acc.jerk.mean.freq.z
62. f.body.gyro.mean.x
63. f.body.gyro.mean.y
64. f.body.gyro.mean.z
65. f.body.gyro.std.x
66. f.body.gyro.std.y
67. f.body.gyro.std.z
68. f.body.gyro.mean.freq.x
69. f.body.gyro.mean.freq.y
70. f.body.gyro.mean.freq.z
71. f.body.acc.mag.mean
72. f.body.acc.mag.std
73. f.body.acc.mag.mean.freq
74. f.body.body.acc.jerk.mag.mean
75. f.body.body.acc.jerk.mag.std
76. f.body.body.acc.jerk.mag.mean.freq
77. f.body.body.gyro.mag.mean
78. f.body.body.gyro.mag.std
79. f.body.body.gyro.mag.mean.freq
80. f.body.body.gyro.jerk.mag.mean
81. f.body.body.gyro.jerk.mag.std
82. f.body.body.gyro.jerk.mag.mean.freq
```