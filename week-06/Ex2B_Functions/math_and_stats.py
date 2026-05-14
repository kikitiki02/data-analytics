import random
import math
import statistics

vals_1_100 = range(1,100)
vals_sample = random.sample(vals_1_100, 75)
vals_choices = random.choices(vals_1_100, k = 200)
radius = random.randint(3,10)
pi = math.pi

# Sum of 75 sample values from 1 to 100: 3,680
sam_sum = sum(vals_sample)
print(sam_sum)
# Average of 75 sample values: 49.09
avg_sam = statistics.mean(vals_sample)
print(avg_sam)
# Median of 75 sample values: 49
med_sam = statistics.median(vals_sample)
print(med_sam)

# Average of 200 values: 50.93
choice_avg = statistics.mean(vals_choices)
print(choice_avg) 
# Median of 200 values: 49.5
choice_mean = statistics.median(vals_choices)
print(choice_mean)
# Mode of 200 values: 64
choice_mode = statistics.mode(vals_choices)
print(choice_mode)
# Standard deviation of 200 values: 28.18
choice_stdev = statistics.stdev(vals_choices)
print(choice_stdev)
# Variance of 200 values: 793.36
choice_v = statistics.variance(vals_choices)
print(choice_v)

# Modeling a random circle:
area = pi * radius ** 2
area_c = math.ceil(area)
area_f = math.floor(area)
#Radius = 9, area = 255 (rounded up)
print(f"Radius = {radius}, area = {area_c}")
#Radius = 9, area = 254 (rounded down)
print(f"Radius = {radius}, area = {area_f}")