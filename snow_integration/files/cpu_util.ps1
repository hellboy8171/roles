 $Processor = (Get-WmiObject -ComputerName localhost -Class win32_processor -ErrorAction Stop | Measure-Object -Property LoadPercentage -Average | Select-Object Average).Average 

 if (78-ge 75 ){
   Write-Host "Server CPU usage is above threshold"
   $topfive = Get-Process | Sort-Object CPU -desc | Select-Object -first 5  
   $topfive
    }
 else{        
   Write-Host "Server CPU usage is in under threshold"  
    } 
