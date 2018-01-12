#!/usr/bin/perl
################################################################################
# Copyright (C) 1998 Moe Maravilla - All Rights Reserved
# You may use, distribute and modify this code under the terms of the MITs
# license.  You should have received a copy of the MIT license with this file.
################################################################################

##### This program calculates Easter for the given year.

##### Usage: easter_calc [<year>]

if ( $#ARGV == 0 )
{
  $year = shift;
}
elsif ( $#ARGV == -1 )
{
  @time = localtime();
  $year = $time[5];

  $year += ( $year < 60 )? 2000: 1900;

  print "Enter year [$year]>";

  $temp = <>;

  if ( $temp != '' )
  {
    $year = $temp;
  }
}
else
{
  print "Usage: $0 [<year>]";
  exit 1;
}

if ( $year < 100 )
{
  $year += ( $year < 60 )? 2000: 1900;
}

$a = $year % 19;
$b = int($year / 100);
$c = $year % 100;
$d = int($b / 4);
$e = $b % 4;
$f = int(($b + 8) / 25);
$g = int(($b - $f + 1) / 3);
$h = (19 * $a + $b - $d - $g + 15) % 30;
$i = int($c / 4);
$k = $c % 4;
$l = (32 + 2 * ($e + $i) - $h -$k) % 7;
$m = int(($a + 11 * $h + 22 * $l) / 451);
$month = int(($h + $l - 7 * $m + 114) / 31);
$day =   ($h + $l - 7 * $m + 114) % 31 + 1;

printf "\n%02d/%02d/%04d\n\n", $month, $day, $year; 
