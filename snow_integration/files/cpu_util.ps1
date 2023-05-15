 $thresholdValue = 3    
 $Processor = (Get-WmiObject -ComputerName localhost -Class win32_processor -ErrorAction Stop | Measure-Object -Property LoadPercentage -Average | Select-Object Average).Average  
 if ($Processor -le $thresholdValue){
    Write-Host "CPU is under threshold value"
    }
 else{        
    $topfive = Get-Process | Sort-Object CPU -desc | Select -first 5
    $topfive   
    } 
