$thresholdValue = 3
$computerMemory =  Get-CimInstance -class  WIN32_OperatingSystem 
$totalMemory = ($computerMemory.TotalVisibleMemorySize)/(1024*1024)
$freeMemory = ($computerMemory.FreePhysicalMemory)/(1024*1024)
$usedMemory = $totalMemory - $freeMemory
$output = ''
if ($usedMemory -le $thresholdValue)
{
    $output = 'everything is fine'
    $output | Out-File 'C:\rajat\result.txt'
}
else{ 
       
       $processMemoryUsage = Get-WmiObject WIN32_PROCESS | Sort-Object -Property ws -Descending | Select-Object -first 1 processname, @{Name="Mem Usage(MB)";Expression={[math]::round($_.ws / 1mb)}}
       $application = $processMemoryUsage.ProcessName
       $output = 'close the ' + $application
       $output|Out-File 'C:\rajat\result.txt'
    }
