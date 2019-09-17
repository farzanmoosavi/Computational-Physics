import numpy as np
import matplotlib.pyplot as plt

points = np.array([[0,1],[0,0]])
angle = np.pi/3
Rotation_Matrix = np.array([[np.cos(angle),-np.sin(angle)],[np.sin(angle),np.cos(angle)]])
angle = 5*np.pi/3
Rotation_Matrix_2 = np.array([[np.cos(angle),-np.sin(angle)],[np.sin(angle),np.cos(angle)]])



while points[0][1] - points[0][0] >= 0.001 :

    points = points / 3
    L = points[0][-1]
    part_2 = Rotation_Matrix @ points

    part_2[0] += L

    part_3 = Rotation_Matrix_2 @ points
    part_3[0] += part_2[0][-1]
    part_3[1] += part_2[1][-1]
    #part_3 [0] += 2*L
    part_4 = np.copy(points)
    part_4[0] += 2*L
    points = np.concatenate((points, part_2), axis = 1)
    #plt.plot(part_2[0], part_2[1], 'b-')
    points = np.concatenate((points, part_3), axis = 1)
    points = np.concatenate((points, part_4), axis = 1)
    plt.plot(points[0],points[1],'b-' )
    plt.axis('equal')
    plt.show()


