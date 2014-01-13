<?php
for ($index = 0; $index < 10000; $index++) {
  $to = "tilAdresse@mail.com";
  $subject = "SPAM MAIL";
  $message = "Hello! This is SPAM!.";
  $from = "Mordi@lol.com"+$index;
  $headers = "From:" . $from;
 
  mail($to, $subject, $message, $headers);
 
  echo "Mail Sent." + $index;
}

?> 
