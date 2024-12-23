#define simulator

set ns [new Simulator]

#open trace file

set traceFile1 [open lab2.tr w]
$ns trace-all $traceFile1 


#open network animator trace file

set namFile1 [open lab2.nam w]
$ns namtrace-all $namFile1 


#create nodes

set nn 6

for {set i 0} {$i < $nn} {incr i} { set node_($i) [$ns node]} 

#create links

$ns duplex-link $node_(0) $node_(2) 3Mb 10ms DropTail 
$ns duplex-link $node_(1) $node_(2) 3Mb 10ms DropTail 
$ns simplex-link $node_(2) $node_(3) 0.5Mb 90ms DropTail 
$ns simplex-link $node_(3) $node_(2) 0.5Mb 90ms DropTail 
$ns duplex-link $node_(3) $node_(4) 1Mb 30ms DropTail 
$ns duplex-link $node_(3) $node_(5) 1Mb 30ms DropTail 


#give link position

$ns duplex-link-op $node_(0) $node_(2) orient right-down
$ns duplex-link-op $node_(1) $node_(2) orient right-up 
$ns simplex-link-op $node_(2) $node_(3) orient right 
$ns simplex-link-op $node_(3) $node_(2) orient left 
$ns duplex-link-op $node_(3) $node_(4) orient right-up 
$ns duplex-link-op $node_(3) $node_(5) orient right-down


#assigning color to different links


$ns duplex-link-op $node_(1) $node_(2) color "Green"

$ns duplex-link-op $node_(0) $node_(2) color "Red" 
$ns simplex-link-op $node_(2) $node_(3) color "Blue"

$ns simplex-link-op $node_(3) $node_(2) color "Yellow"

$ns duplex-link-op $node_(3) $node_(4) color "Black"

$ns duplex-link-op $node_(3) $node_(5) color "White"


# Add Transport agents

set tcp_ [new Agent/TCP]
set sink_ [new Agent/TCPSink]

$ns attach-agent $node_(0) $tcp_
$ns attach-agent $node_(5) $sink_
$ns connect $tcp_ $sink_


# Add application
set ftp_ [new Application/FTP]
$ftp_ attach-agent $tcp_

#define a finish procedure

proc finish { } {
	global ns traceFile1 namFile1
	$ns flush-trace 
	close $traceFile1
	close $namFile1
	exec nam lab2.nam &
	exit 0
}

# Create a schedule

$ns at 0.0 "$ftp_ start" 
$ns at 20.0 "$ftp_ stop" 
$ns at 20.5 "puts \"NS EXITING...at [$ns now]\""
$ns at 20.6 "finish"

#Run the simulation
puts "Starting Simulation at [$ns now]"
$ns run


