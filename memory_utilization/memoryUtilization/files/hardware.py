from multiprocessing import parent_process
import psutil
import os



thresholdValue = 5
totalMemory = round(psutil.virtual_memory().total/1000000000,2)
print(totalMemory, 'Gb')

useRam = round(psutil.virtual_memory().used/1000000000,2)
print(useRam, 'Gb')

if (useRam <= thresholdValue):
    print("Everthing is fine")

else:
    print("under process")
