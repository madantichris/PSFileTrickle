# This script originates and is maintained at: https://github.com/madantichris/PSFileTrickle

# MIT License

# Copyright (c) 2019 Chris Emery

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.



# Variables
$source_dir="C:\Sandbox\FileTrickle\source"
$dest_dir="C:\Sandbox\FileTrickle\dest"
$backlog_count=20
$delay_seconds=5

#uncomment below line to have text output to console
#$DebugPreference="Continue"

############ Main Loop - do not alter below this line ##########

Write-Host "Running parameters"
Write-Host "Source Directory: $source_dir"
Write-Host "Destination Directory: $dest_dir"
Write-Host "Sleep Delay: $delay_seconds"

$source_files = Get-ChildItem $source_dir -File
$total_copied=0
$time_slept=0


Get-ChildItem $source_dir -File | 
Foreach-Object {
	$dest_directoryInfo = Get-ChildItem $dest_dir | Measure-Object
	
	if ($dest_directoryInfo.count -lt $backlog_count) {
		$am_sleeping=$false
	}
	else {
		$am_sleeping=$true
	}

	while ($am_sleeping -eq $true) {
		Write-Debug "Destination directory is full - sleeping for $delay_seconds seconds"
		Start-Sleep -Seconds $delay_seconds
		$time_slept = $time_slept + $delay_seconds
		$dest_directoryInfo = Get-ChildItem $dest_dir | Measure-Object
		if ($dest_directoryInfo.count -lt $backlog_count) {
			$am_sleeping=$false
		}		
		
	}
	
	Write-Debug "    $_"
	Copy-Item $source_dir\"$_" -Destination $dest_dir
	$total_copied++
	
}

Write-Host "Finished. $total_copied files copied. $time_slept total seconds spent sleeping. Exiting"
#FileTrickle.ps1 version 20190504.1