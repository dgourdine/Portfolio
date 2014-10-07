# Creator: David Gourdine
# ID: 0505386
# Class: ITEC - 325.601
# Date: 04/17/14


# Purpose: This script decodes a metar report


########## Prompt and Input
#
#

echo 
ls -l 
echo
echo "What is the name of the file that you would like to read?" 
echo
read FILE
echo



 

##################################### METAR Report ######################################
#
#
#

echo " ---------------------- U.S METAR Observation Report ($FILE) ------------------------ "
echo



############# Report Information
#
# Prints out the report type (METAR or SPECI)
# Prints out the Station (four characters)
# Prints the day of the month
# Print the time the report was filed
#


# If the metar file contains the token AUTO, then print out "This is a fully automated report"
# If the metar file contains the token CORE, then print out "This is a corrected observation" 
# If the file does not contain the token AUTO or CORE, then print out "The file does not contain..." 
#
#

reportMod=$(egrep -io 'AUTO|COR' $FILE) 

 if [ "$reportMod" == "AUTO" ] ; 

 	then 
 		echo
		echo "Report Modifier: This is a fully automated report. " 
		
		
	else if [ "$reportMod" == "COR" ] ;
	
		then
			echo "Report Modifier: This is a corrected observation." 
				
	else
	
		echo "Report Modifier: N/A"
		
	
	fi
fi


######### Prints out the report type (METAR or SPECI)
#
#
#

reportType=$(egrep -o "METAR|SPECI" $FILE )

if [ "$reportType" == "METAR" ] ;

	then
		echo "Report Type: METAR"
		
		
	else
		if [ "$reportType" ==  "SPECI" ] ;
			then
				echo "Report Type: SPECI"
  				
  	else
  		echo "Report Type: N/A" 
    fi				
fi 


###### Prints out the Station Type
#



stationType=$(egrep -o 'K[A-Z]{3}' $FILE)


if  [ "$stationType" == "" ] && [ "$stationType" == "$stationType" ]  ;
	
  	then
  			echo "Station Identifier: N/A" 

	else if [ "$stationType" == "$stationType" ] ;
    	
    		then
			echo "Station Identifier: $stationType"
  		
    fi				
fi 


###### Prints out the day of the month the report was filed
#
#

day=$(egrep -o '[0-9]{2}[0-9]{4}Z' $FILE | cut -c-2)


if [ "$day" > "0" ] ;

	then
		echo "Day of the month: $day"	
		
  	else
  		echo "Day of the month: N/A" 				
fi 


####### Prints out the time the report was filed
#
#

fileTime=$(egrep -o '[0-9]{2}[0-9]{4}Z' $FILE | cut -c3-6 ) 
fileTimeVar1=$(egrep -o '[0-9]{2}[0-9]{4}Z' $FILE | cut -c3-4 ) 
fileTimeVar2=$(egrep -o '[0-9]{2}[0-9]{4}Z' $FILE | cut -c5-6 ) 

if [ "$fileTime" > "0" ] ;

	then
		echo "File Time: ${fileTimeVar1}:${fileTimeVar2} UTC"
		
  	else
  		echo "File Time: N/A" 				
fi 

echo



###################### Weather Information ###################



########### Prints Wind Conditions
#
# 1. Wind true direction 
# 2. Wind Speed ... should equal 16
# 3. Wind Gusting ... should equal 24 
# 4. Variable Wind Direction .... 240
#
# 5. If Wind Gusting value is not found, output N/A for wind gusting value
#

echo " 		   -------- Wind Statistics-------- 	 "
echo

######### Wind true direction
#
#

trueDirection=$(egrep -o '[0-9]{0,}?G?[0-9]{0,}?KT' $FILE  | egrep -o '[0-9]{3}' )

if [ "$trueDirection" > "0" ] ;

	then
		echo "Wind True Direction: $trueDirection degrees"
		echo 
	else
		echo "Wind True Direction: N/A"
		echo
fi 


##### Wind Speed
#
#
#

speed=$(egrep -o '[0-9]{0,}?G?[0-9]{0,}?KT' $FILE | egrep -o '[0-9]{2}?KT' | egrep -o '[0-9]{2}' | cut -c1 ; )

##### Trims zeros from wind output values
#
#


if  [ "$speed" == "0" ]  ;
	
  		then
  			speed=$(egrep -o '[0-9]{0,}?G?[0-9]{0,}?KT' $FILE | egrep -o '[0-9]{2}?KT' | egrep -o '[0-9]{2}' | cut -c2- ; )	
  	else
  		speed=$(egrep -o '[0-9]{0,}?G?[0-9]{0,}?KT' $FILE | egrep -o '[0-9]{2}?KT' | egrep -o '[0-9]{2}' | cut -c1- ; )
fi 

###### Prints out the wind speed
#
#



if [ "$speed" > "0" ] ;

	then
		echo "Wind Speed: $speed Knots"
		echo 
	else
		echo "Wind Speed: N/A"
		echo
fi 



###### Wind Gusting
#
#
#

windGustingTest=$(egrep -o '[0-9]{0,}?G?[0-9]{0,}?KT' $FILE | cut -c6 )
windGustingValue=$(egrep -o '[0-9]{0,}?G?[0-9]{0,}?KT' $FILE | cut -c4-5 )



if [ "$windGustingTest" == "G" ] && [ "$windGustingValue" > "0" ] ;

	then
		echo "Wind Gusting: $windGustingValue Knots"
		echo 
	else
		echo "Wind Gusting: N/A"
		echo
fi 


###### Wind Variable
#
#
#

windVar1=$(egrep -o '[0-9]{3}V[0-9]{3}' $FILE | cut -c1-3)
windVar2=$(egrep -o '[0-9]{3}V[0-9]{3}' $FILE | cut -c5-)

if [ "$windVar1" > "0" ] ;

	then
		echo "Wind direction is variable between $windVar1 and $windVar2"
		echo 
	else
		echo "Wind Variable: N/A"
		echo
fi 





################# Prints Cloud Conditions
#
# 1. Output the title "cloud conditions" 
# 2. Sky clear
# 3. Few clouds (altitude) 
# 4. Scattered Clouds (altitude) 
# 5. Broken Clouds (altitude)
# 6. Overcast Clouds (altitude) 
# 


######## Outputs the title "cloud conditions" 
#

echo " 		   -------- Cloud Conditions -------- 	 "
echo

####### Sky Clear 
#

# Trims zero from the sky clear output
#

skyClearVar1=$(egrep -o 'SK[0-9]{3}' $FILE | sed -n '2!p' | cut -c3  )


if  [ "$skyClearVar1" == "0" ]  ;
	
  	then
  			skyClearVar1=$(egrep -o 'SK[0-9]{3}' $FILE | sed -n '2!p' | cut -c4-  )		
  	else
  			skyClearVar1=$(egrep -o 'SK[0-9]{3}' $FILE | sed -n '2!p' | cut -c5-  )		
fi 


# 1. If 2 SK tokens are found, output broken clouds between var1 and var2 
# 2. If 1 SK token is found, output one line of text for the BKN Token
# 3. If no SK tokens are found, output broken clouds N/A
#

#



if [ "$skyClearVar1" > "0" ]  && [ "$skyClearVar2" > "0" ];

	then 
		echo "Sky Clear at ${skyClearVar1}00 feet above aerodome level" 
		echo "Sky Clear at ${skyClearVar2}00 feet above aerodome level" 
		echo
		
	else
		if [ "$skyClearVar1" > "0" ]  && [ "$skyClearVar2" == "" ];
		
			then
				echo "Sky Clear at ${skyClearVar1}00 feet above aerodome level"
				echo 
	else
		if [ "$skyClearVar1" == "" ]  && [ "$skyClearVar2" == "" ];
		
			then
				echo "Sky Clear: N/A" 
				echo
		fi
	fi
fi 

##### Few Clouds 
#
#

fewCloudsVar1=$(egrep -o 'FEW[0-9]{3}' $FILE | sed -n '2!p' | cut -c4  )
fewCloudsVar2=$(egrep -o 'FEW[0-9]{3}' $FILE | sed -n '1!p' | cut -c4-  )


# Removes the zero from the few cloud variable so that
# when the value is output to the screen is does not contain a zero


if  [ "$fewCloudsVar1" == "0" ]  ;
	
  	then
  		fewCloudsVar1=$(egrep -o 'FEW[0-9]{3}' $FILE | sed -n '2!p' | cut -c5-  )		
  	else
  		fewCloudsVar1=$(egrep -o 'FEW[0-9]{3}' $FILE | sed -n '2!p' | cut -c4-  )		
fi 


  

# Prints out few Clouds information to screen
#
# 1. If 2 FEW tokens are found, output broken clouds between var1 and var2 
# 2. If 1 FEW token is found, output one line of text for the BKN Token
# 3. If no FEW tokens are found, output broken clouds N/A
#



if [ "$fewCloudsVar1" > "0" ]  && [ "$fewCloudsVar2" > "0" ];

	then 
		echo "Few Clouds at: ${fewCloudsVar1}00 feet above aerodome level" 
		echo "               ${fewCloudsVar2}00 feet above aerodome level"
		echo
		
	else
		if [ "$fewCloudsVar1" > "0" ]  && [ "$fewCloudsVar2" == "" ];
		
			then
				echo "Few Clouds at ${fewCloudsVar1}00 feet above aerodome level"
				echo 
	else
		if [ "$fewCloudsVar1" == "" ]  && [ "$fewCloudsVar2" == "" ];
		
			then
				echo "Few Clouds: N/A" 
				echo
		fi
	fi
fi 




# Scattered Clouds 

scatteredCloudsVar1=$(egrep -o 'SCT[0-9]{3}' $FILE | sed -n '2!p' | cut -c4  )


# Corrects the scattered clouds output value
#
#


if  [ "$scatteredCloudsVar1" == "0" ]  ;
	
  	then
  		scatteredCloudsVar1=$(egrep -o 'SCT[0-9]{3}' $FILE | sed -n '2!p' | cut -c5-  )		
  	else
  		scatteredCloudsVar1=$(egrep -o 'SCT[0-9]{3}' $FILE | sed -n '2!p' | cut -c4-  )		
fi 

#
# 1. If 2 SCT tokens are found, output broken clouds between var1 and var2 
# 2. If 1 SCT token is found, output one line of text for the BKN Token
# 3. If no SCT tokens are found, output broken clouds N/A
#



if [ "$scatteredCloudsVar1" > "0" ] ;

	then
		echo "Scattered Clouds at ${scatteredCloudsVar1}00 feet above aerodome level"
		echo 
	else
		echo "Scattered Clouds: N/A" 
		echo
fi 



###### Broken Clouds


# Trims the zero from the broken clouds output value

brokenCloudsVar1=$(egrep -o 'BKN[0-9]{3}' $FILE  | sed -n '2!p' | cut -c4 )
brokenCloudsVar2=$(egrep -o 'BKN[0-9]{3}' $FILE  | sed -n '1!p' | cut -c4 )


if  [ "$brokenCloudsVar1" == "0" ]  ;
	
  	then
  		brokenCloudsVar1=$(egrep -o 'BKN[0-9]{3}' $FILE | sed -n '2!p' | cut -c5-  )		
  	else
  		brokenCloudsVar1=$(egrep -o 'BKN[0-9]{3}' $FILE | sed -n '2!p' | cut -c4-  )		
fi 


if  [ "$brokenCloudsVar2" == "0" ]  ;
	
  	then
  		brokenCloudsVar2=$(egrep -o 'BKN[0-9]{3}' $FILE | sed -n '1!p' | cut -c5-  )		
  	else
  		brokenCloudsVar2=$(egrep -o 'BKN[0-9]{3}' $FILE | sed -n '1!p' | cut -c4-  )		
fi 



# 1. If 2 BKN tokens are found, output broken clouds between var1 and var2 
# 2. If 1 BKN token is found, output one line of text for the BKN Token
# 3. If no BKN tokens are found, output broken clouds N/A




if [ "$brokenCloudsVar1" > "0" ]  && [ "$brokenCloudsVar2" > "0" ];

	then 
		echo "Broken Clouds at 1. ${brokenCloudsVar1}00 feet above aerodome level" 
		echo "                 2. ${brokenCloudsVar2}00 feet above aerodome level" 
		echo
		
	else
		if [ "$brokenCloudsVar1" > "0" ]  && [ "$brokenCloudsVar2" == "" ];
		
			then
				echo "Broken clouds at ${brokenCloudsVar1}00 feet above aerodome level"
				echo 
	else
		if [ "$brokenCloudsVar1" == "" ]  && [ "$brokenCloudsVar2" == "" ];
		
			then
				echo "Broken clouds: N/A" 
				echo
		fi
	fi
fi 

# Overcast Clouds
#



# Trims zero from the overcast values
#
#

overcastCloudsVar1=$(egrep -o 'OVC[0-9]{3}' $FILE  | sed -n '2!p' | cut -c4 )
overcastCloudsVar2=$(egrep -o 'OVC[0-9]{3}' $FILE  | sed -n '1!p' | cut -c4- )


if  [ "$overcastCloudsVar1" == "0" ]  ;
	
  	then
  		overcastCloudsVar1=$(egrep -o 'OVC[0-9]{3}' $FILE | sed -n '2!p' | cut -c5-  )		
  	else
  		overcastCloudsVar1=$(egrep -o 'OVC[0-9]{3}' $FILE | sed -n '2!p' | cut -c4-  )		
fi 


## Prints out Overcast Values 
#
#
# 1. If 2 OVC tokens are found, output broken clouds between var1 and var2 
# 2. If 1 OVC token is found, output one line of text for the BKN Token
# 3. If no OVC tokens are found, output broken clouds N/A




if [ "$overcastCloudsVar1" > "0" ]  && [ "$overcastCloudsVar2" > "0" ];

	then 
		echo "Broken clouds at: ${overcastCloudsVar1}00 feet above aerodome level" 
		echo "                  ${overcastCloudsVar2}00 feet above aerodome level" 
		echo
		
	else
		if [ "$overcastCloudsVar1" > "0" ]  && [ "$overcastCloudsVar2" == "" ];
		
			then
				echo "Overcast Clouds at ${overcastCloudsVar1}00 feet above aerodome level"
		
				echo 
	else
		if [ "$overcastCloudsVar1" == "" ]  && [ "$overcastCloudsVar2" == "" ];
		
			then
				echo "Overcast clouds : N/A" 
				echo
		fi
	fi
fi 


## Prints out no clouds detected
#
#
# 1. If 2 CLR tokens are found, output broken clouds between var1 and var2 
# 2. If 1 CLR token is found, output one line of text for the BKN Token
# 3. If no CLR tokens are found, output broken clouds N/A


clearClouds=$(egrep -o 'CLR[0-9]{3}' $FILE  | sed -n '2!p' | cut -c4 )



if [ "$clearClouds" > "0" ] ;

	then 
		    echo "No clouds detected below 12000 " 
        echo                    
	    	echo
		

fi 







################ Prints Weather Conditions
#
# Light, Medium, or Heavy Rain
#
# If the token '-RA' is present, print the output " There is light rain 
# If the token 'RA' is present, print the output " There is medium rain 
# If the token '+RA' is present, print the output " There is heavy rain 
#
#

echo " 		   -------- Weather Conditions --------- 	 "
echo

rain=$(egrep -o '[+]?[-]?RA' $FILE)

if [ "$rain" == "-RA" ] ; 

	then
		    echo "Rain Condition: Light"

	else 
	    	if [ "$rain" == "RA" ] ;
		
			    then
			    
			   	echo "Rain Condition: Medium" 
				
	else
		if [ "$rain" == "+RA" ] ;
		
			then
				    echo "Rain Condition: Heavy" 
				
	else
	      	echo "Rain Condition: None " 
		
	     fi	
   fi		
fi

echo

# If the token 'TH' is present, output should read "Thunderstorms reported in the area"
#
#

stormWarning=$(egrep -o 'TH' $FILE) 

	if [ "$stormWarning" == "TH" ] ;
	
		then
			echo "Thunderstorms: Have been reported in the area." 
				
		else
			echo "Thunderstorms: None"
	fi 
echo	



## Visibility 
# 
# decodes the visibility value

visibility=$(egrep -o '[0-9]{0,}?SM' $FILE | egrep -o '[0-9]*' | cut -c1 )


# Trims zero from visibility output value

if  [ "$visibility" == "0" ]  ;
	
  		then
  			visibility=$(egrep -o '[0-9]{0,}?SM' $FILE | egrep -o '[0-9]*' | cut -c2- )	
  	else
  		visibility=$(egrep -o '[0-9]{0,}?SM' $FILE | egrep -o '[0-9]*' | cut -c1- )	
fi 


# Prints the visibility value to the screen
#
#
#


if [ "$visibility" > "0" ] ;

	then
		echo "Visibility: ${visibility} Statute Miles"
	
		
	else
		echo "Visibility: N/A"
		
fi 
echo	


#### Temperature
#
# Decodes the temperature Value from the metar report
	

temperature=$(egrep -o '[-]?[0-9]{0,}[/][0-9]{2}[M]?' $FILE | cut -f1 -d/ ) 



# Trims zero from temperature output value

if  [ "$temperature" == "0" ]  ;
	
  		then
  			temperature=$(egrep -o '[0-9]{0,}[/][0-9]{2}[M]?' $FILE | cut -f1 -d/ ) 
  	else
  		temperature=$(egrep -o '[0-9]{0,}[/][0-9]{2}[M]?' $FILE | cut -f1 -d/ ) 
fi 



# Prints the temperature Value to the Screen

if [ "$temperature" > "-100000000000" ] && [ "$temperature" != "" ] ;

	then
		echo "Temperature: ${temperature} degrees Celsius"
	
		
	else
		echo "Temperature: N/A"
		
fi 

echo	


#### Dew Point
#
#
#

# Decodes the dew point value from the output screen

dewPoint=$(egrep -o '[0-9]{2}[/][0-9]{2}[M]?' $FILE | cut -c4 )



# Trims zero from dew point output value

if  [ "$dewPoint" == "0" ]  ;
	
  	then
  		dewPoint=$(egrep -o '[0-9]{2}[/][0-9]{2}[M]?' $FILE | cut -c5 ) 
  	else
  		dewPoint=$(egrep -o '[0-9]{2}[/][0-9]{2}[M]?' $FILE | cut -c4-5 )
fi 




# Prints the dew point value to the screen


if [ "$dewPoint" > "-100000000000" ] && [ "$dewPoint" != "" ] ;

	then
		echo "Dew Point: ${dewPoint} degrees Celsius"
		
		
	else
		echo "Dew Point: N/A"
		
fi 
echo	

#### Barometric Pressure
#
#

barometricPressureVar1=$(egrep -o '[A][0-9]{4}' $FILE | cut -c2-3 ) 
barometricPressureVar2=$(egrep -o '[A][0-9]{4}' $FILE | cut -c4-5 ) 



if [ "$barometricPressureVar1" > "-100000000000" ] && 
   [ "$barometricPressureVar2" > "-100000000000" ] &&
   [ "$barometricPressureVar1" != "" ] &&
   [ "$barometricPressureVar2" != "" ] ;

	then
		echo "Barometric Pressure: ${barometricPressureVar1}.${barometricPressureVar2} inHg"
		
	else
		echo "Barometric Pressure: N/A"
		
fi 
echo

echo

echo " ---------------------------- End of Report ---------------------------- "	
echo


