<?php

	/* 	Example of using the NexusUI library with php relaying OSC messages
	*		Jesse Allison 2012 - allisonic.com - 
	*/

include 'OSC.phps';

/* get AJAX parameter */

/*$q=$_GET["data"];  /* Receive data parameter in get request ?data=blah*/
$q=$_POST["asciivalue"];	/* Receive data parameter as a post */
$q=(int)$q;

$osc_name=$_POST["oscName"];	/* Get osc name to use as the osc message */

$osc_ip=$_POST["oscIp"];	/* If an osc_ip is posted as well, use that ip, otherwise, default to localhost */
if (is_null($osc_ip))
	$osc_ip='127.0.0.1';

							/* Relay the OSC message */
$c = new OSCClient();
$c->set_destination($osc_ip, 7475);
$queue = array($q);
array_unshift($queue, $_SERVER["REMOTE_ADDR"]);

$c->send(new OSCMessage($osc_name, $queue));
//$c->send(new OSCMessage($osc_name, $q));

//echo "at end";	/* If Got ityou want to send something back to the browser that sent the AJAX request. */
//print_r($queue);
print_r($queue);

?>
