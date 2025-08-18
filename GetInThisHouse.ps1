#!/usr/bin/env -S pwsh -File

<#
.SYNOPSIS
Generates a stylized meme using ASCII art to frame a custom message in a "house rules" format.

.DESCRIPTION
This script creates a playful meme with a top and bottom ASCII art frame that surrounds a user-defined message.
It checks the total character length to ensure the output remains within a specified limit (default is 300 characters).
If the meme exceeds this limit, an error is thrown to help the user adjust the input accordingly.

.PARAMETER Message
Specifies the message to display between the ASCII frames. The default message is "MESSAGE".

.PARAMETER Doormat
When specified, the text will be centered beneath the house—unless the text length exceeds the width of the house, in 
which case it will not be centered.

.PARAMETER maxLength
Sets the maximum character count for the final meme output, including frames and message.
If the total length exceeds this value, the script throws an error with the actual length.

.EXAMPLE
.\GetInThisHouse.ps1 -message "Respect Brittney Sykes' perimeter defense"
Creates a framed ASCII meme with the specified message, subject to default max length of 300 characters.

.EXAMPLE
.\GetInThisHouse.ps1 -message "Stef Dolson’s screens are law" -maxLength 500
Creates a meme with increased character limit, useful for longer affirmations.

.EXAMPLE
.\GetInThisHouse.ps1
Runs the script using the default message "MESSAGE" with a max length of 300 characters.

.LINK
https://github.com/dwhiteplume/In-This-House
#>

[CmdletBinding()]
param(
 [string]$Message = 'Your message',
 [Parameter(Mandatory = $false)]
 [string]$Doormat = $null,
 [int]$maxLength = 300
)

$top = @"
┏┓
┃┃╱╲in
┃╱╱╲╲this
╱╱╭╮╲╲house
▔▏┗┛▕▔ we
╱▔▔▔▔▔▔▔▔▔▔╲
"@

$bottom = @"
╱╱┏┳┓╭╮┏┳┓ ╲╲
▔▏┗┻┛┃┃┗┻┛▕▔
"@

if($doormat){
	Write-Verbose "We have a doormat: $doormat"
	$houseWidth = 13
	$doormatWidth = $doormat.Length
	$halfMat = [int]$($doormatWidth / 2)
	if($doormatWidth -ge $houseWidth){
		Write-Verbose "No spacing, as `$doormatWidth ($doormatWidth) -ge `$houseWidth ($houseWidth)"
	} else {
		$doormat = "$(' ' * ([int]$($houseWidth /2) - $halfMat))$doormat"
	}
}

$meme = @"
$top
$message
$bottom
"@

if($doormat){
	$meme = @"
$meme
$doormat
"@
}

if($meme.Length -le $maxLength){
	$meme
} else {
	Write-Error "$($meme.Length) -gt $maxLength"
}
