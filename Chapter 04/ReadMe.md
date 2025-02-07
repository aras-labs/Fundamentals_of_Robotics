# Fundamentals of Robotics

**CRC Press, Taylor & Francis Group, LLC**  
© 2025 Hamid D. Taghirad

This repository contains the MATLAB programs corresponding to **Chapter 4** of *Fundamentals of Robotics*. The provided codes facilitate various kinematic derivations and support functions that are essential for robotic manipulator analysis.

---

## Table of Contents

- [Main Programs](#main-programs)
- [Other Subroutines](#other-subroutines)
- [Additional Explanations](#additional-explanations)

---

## Main Programs

### `FK_XXXXX.m`

This primary program provides various kinematic derivations for different robotic manipulators. It implements both Denavit-Hartenberg (DH) and Screw parameter formulations where applicable.

**Included Manipulators:**

| **Manipulator** | **Type**             | **Kinematic Methods** |
|-----------------|----------------------|-----------------------|
| **RRR**       | 3R Manipulator       | DH and Screw          |
| **Elbow**     | Elbow Manipulator    | DH and Screw          |
| **ElbowSix**  | Elbow6 Manipulator   | DH and Screw          |
| **SCARA**     | SCARA Manipulator    | Screw                 |
| **Stanford**  | Stanford Manipulator | DH and Screw          |

---

## Other Subroutines

The following subroutines complement the main program by defining necessary parameters and improving the representation of symbolic matrices in MATLAB.

| **File**                     | **Description**                                                                              |
|------------------------------|----------------------------------------------------------------------------------------------|
| **`1-DH.m`**                | Defines the Denavit-Hartenberg (DH) parameters.                                              |
| **`2-SR.m`**                | Defines the Screw parameters.                                                                |
| **`3-Matrix_Vpa.m`**        | Provides an enhanced representation of symbolic matrices in MATLAB.                          |
| **`4-Matrix_Vpa_Numeric.m`**| Provides an improved representation for numerically evaluated symbolic matrices.             |

---

## Additional Explanations

- **Denavit-Hartenberg (DH) Parameters:**  
  A systematic method to model the geometry of robotic manipulators, streamlining the derivation of kinematic equations.

- **Screw Parameters:**  
  An alternative representation for the kinematics of robotic systems, leveraging the mathematical concept of screws to describe spatial motion.

For comprehensive details and further reading, please refer to Chapter 4 of *Fundamentals of Robotics* by Hamid D. Taghirad.

---

*This README is intended to provide a clear and organized overview of the MATLAB programs included in this chapter. For further assistance or clarifications, please consult the documentation within each MATLAB file.*
