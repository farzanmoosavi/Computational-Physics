import numpy as np
import math as mt
import matplotlib.pyplot as plt


points = np.array([[0,1],[0,0]])
angle = np.pi/3
Rotation_Matrix = np.array([[np.cos(angle),-np.sin(angle)],[np.sin(angle),np.cos(angle)]])
angle = 2*np.pi/3
Rotation_Matrix_2 = np.array([[np.cos(angle),-np.sin(angle)],[np.sin(angle),np.cos(angle)]])

part_1 = Rotation_Matrix @ points
final = np.concatenate((points, part_1), axis=1)
part_2 = Rotation_Matrix_2 @ points
part_2[0] += 1
final = np.concatenate((final, part_2), axis=1)

plt.plot(final[0], final[1], 'black')
plt.show()

while final[0][1] - final[0][0] >= 0.01:
    final = final / 2
    s_1 = final
    s_2 = np.copy(final)
    s_2[0] += 0.5
    s_3 = np.copy(final)
    s_3[0] += 0.25
    s_3[1] += mt.sqrt(3) / 4
    final = np.concatenate((s_1, s_2, s_3), axis=1)
    fig, ax = plt.subplots()
    ax.fill(final[0], final[1])
    plt.plot(final[0], final[1], 'black')
    plt.show()











