<#
.SYNOPSIS
    This is a filter used to place colorized timestamps on any output messages.
.DESCRIPTION
    The function `TimeStamp` is a colorized version of this command `DateStamp`, but `TimeStamp` output cannot be written to a file. You will want to use `DateStamp` if you are going to output your messages into a log or txt file.
.EXAMPLE
    "ERROR: Something bad happened on this line of the script" | TimeStamp

    [08/04/2020 11:55:39] : ERROR: Something bad happened on this line of the script

    Description
    -----------
    This line will place a time stamp at the beginning of the line that can only be written to the console and not to a file.
.EXAMPLE
    "ERROR: Something bad happened on this line of the script" | TimeStamp Red

    [08/04/2020 11:56:40] : ERROR: Something bad happened on this line of the script

    Description
    -----------
    This will colorize the timestamp, and turn the provided string red. You can provide any color usable by Write-Host -ForegroundColor.
.EXAMPLE
    "ERROR: " | TimeStamp Red NoNewLine;"Something bad happened on this line fo the script"

    [08/04/2020 11:58:54] : ERROR: Something bad happened on this line fo the script

    Description
    -----------
    This will colorize the TimeStamp, and make "ERROR: " Red, and with `NoNewLine` provided, you can add additional non-colorized text to the same line.
.NOTES
    Author: Matthew J. DeGarmo
    Site: https://matthewjdegarmo.github.io
#>
filter TimeStamp($color, $NoNewLine) {
    if ($color -eq 'NoNewLine') {
        $color = 'White'
        $NoNewLine = 'NoNewLine'
    }
    Write-Host "[" -ForegroundColor Yellow -NoNewLine
    Write-Host $(Get-Date -Format "MM/dd/yyyy HH:mm:ss") -ForegroundColor Green -NoNewLine
    Write-Host "] " -ForegroundColor Yellow -NoNewLine
    Write-Host ": " -ForegroundColor Red -NoNewLine
    if ($NoNewLine) {
        Write-Host "$_" -ForegroundColor $color -NoNewline
    }
    elseif (!$Color) {
        Write-Host "$_"
    }
    else {
        Write-Host "$_" -ForegroundColor $color
    }
}






