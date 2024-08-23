import csv
import matplotlib.pyplot as plt
import numpy as np

data = []
with open('rng_dump.txt') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    data = list(csv_reader)
    
    line_count = 0

    # debug
    for entry in csv_reader:
        print(entry)

#plt.hist(data, density=True, bins=256)  # density=False would make counts
#plt.ylabel('Probability')
#plt.xlabel('Values')

plt.hist(data)

plt.show()