# TAV
Technical Assignment completed by Vikram
HYPOTHESIS:
Business Requirements
I want to be able to specify dates in format (mmm-yyyy e.g. Jan-2017) to get the data for that period.
I want to be able to compare the financial companies rates against bank rates by months, and see on which months financial companies have a higher rate.
I want to be able to compare the overall average of financial companies rates against bank rates.
I want to know if interest rates slope are on an upward or downward trend during this period.
There is no requirement to plot graphs or charts

SOLUTION:

1. Visual Studio 2010 is taken as IDE due to its suppport for development, deployment and due to its support for various tests like Unit
 and Load balance and more
2. ASP.NET is chosen as the technology to implement as provided by visual studio and VB.NET language was used as I am more comfatable with  VB than C# due the vast working experience with it.
3.The technology involved REST with the data in JSON  provided by API from MAS.The API is very well versed for the implementation
Written code for implementing the same successfully with no flaws in extraction.
Data validations and form validations are successfully implemented.
Default.aspx and Default.aspx.vb (code behind file) are the main implementing files and MASDATA.vb file is the properties file for the extracted data. All folders and files (like style sheets etc) are supporting files for the implementation
Unit Testing project (UTTAV) was created to perform the unit tests on this TAV project but couldnt be implemented as the public methods are not available although could have been implemented.

CONCLUSION

The program runs successfully matching to all the requirements. However there is only flaw which is, the result table shows data for the selected criteria, but by default shows all the criteria columns although not selected for result. This couldnt be fixed due to time constrain.

