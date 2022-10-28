 yourNumber = input ( 'Enter a number : ' ) ;
   if yourNumber < 0
         disp( ' Negative ' );
   elseif yourNumber > 0
     disp( 'Positive ' );
   else
   disp( ' Zero ');
   end
   
 [ dayNum , dayString ] = weekday ( date , ' long ' );
 