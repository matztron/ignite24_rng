import serial

f = open("rng_dump.txt", "w")

s = serial.Serial('COM7')
sample_size = 1000000
i = 0

while i < sample_size:
    res = s.read()
    print(res)

    # write to file
    f.write(str(int.from_bytes(res)) + ",")

    i = i+1


