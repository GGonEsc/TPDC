# Functionality of the time resolved partial directed coherence (TPDC) code

System requirements: 

- Windows 7 and newer.
- Tested on Matlab2011 or later 
- Matlab should have the Signal processing and Communication, Math, Statistics and Optimization toolboxes (with Licenses).
- The arfit tollbox is also required (https://de.mathworks.com/matlabcentral/fileexchange/174-arfit or https://github.com/tapios/arfit)

Instruction for use:
	
1.	Download the zipped folder 'tpdc' and unzip it.
2.	Update the path of the folder including all subfolders in the lines 6 and 7 of tpdc_EEG.m.
3.	Enter the path where you wan to store the results in line 109 of tpdc_EEG.m.  
4.	The output "Trial1.mat" and figure "trial1.jpeg" (effective connectivity between the five time series) will be saved in the desired folder. 

Note: The example dataset dataout.mat was tested in a desktop computer with 8 GB RAM, 3.2 GhZ processor and took 180 seconds to complete. 



