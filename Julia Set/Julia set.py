import numpy as np
import matplotlib.pyplot as plt

width = 500
height = 500
c = complex(-0.7 ,0.62)
z_max = 10
Max = 100 #maximum of numbers that function import on z
x_min = -1
x_max = 1
x_width = x_max - x_min
y_min = -1
y_max = 1
y_height = y_max - y_min

julia = np.zeros((width, height))
for x in range(width):
    for y in range(height):
        counter = 0
        z = complex(x / width * x_width + x_min, y / height * y_height + y_min)

        while abs(z) <= z_max and counter < Max:
            z = z**2 + c
            counter += 1
        arg = counter / Max
        julia[x,y] = arg

fig, ax = plt.subplots()
ax.imshow(julia)
xtick_labels = np.linspace(x_min, x_max, x_width / 0.5)
ax.set_xticks([(x-x_min) / x_width * width for x in xtick_labels])
ax.set_xticklabels(['{:.1f}'.format(xtick) for xtick in xtick_labels])
ytick_labels = np.linspace(y_min, y_max, y_height / 0.5)
ax.set_yticks([(y-y_min) / y_height * height for y in ytick_labels])
ax.set_yticklabels(['{:.1f}'.format(ytick) for ytick in ytick_labels])
plt.show()