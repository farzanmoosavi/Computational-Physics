import numpy as np
import matplotlib.pyplot as plt
import math as mt

points = np.array([[0, 1],[0, 0]])
plt.plot(points[0],points[1],'b')
plt.show()
angle = np.pi/4
Rotation_Matrix = np.array([[np.cos(angle),-np.sin(angle)],[np.sin(angle),np.cos(angle)]])
angle = 3 * np.pi / 4
Rotation_Matrix_2 = np.array([[np.cos(angle), -np.sin(angle)], [np.sin(angle), np.cos(angle)]])
for i in range(14):
    points = points * mt.sqrt(2) / 2

    part_2 = Rotation_Matrix @ points
    part_3 = Rotation_Matrix_2 @ points
    part_3[0] = part_3[0][::-1]
    part_3[1] = part_3[1][::-1]
    part_3[0] += 1
    points = np.concatenate((part_2, part_3), axis =1)
    plt.plot(points[0], points[1], 'b')
    plt.axis('equal')
    plt.show()

