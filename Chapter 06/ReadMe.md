# Fundamentals of Robotics 🤖

**CRC Press, Taylor & Francis Group, LLC**  
© 2025 Hamid D. Taghirad

Welcome to the *Fundamentals of Robotics* repository! This folder contains MATLAB programs corresponding to **Chapter 6** of the book. In this chapter, you will explore various methods to compute the Jacobian matrix for different robotic manipulators using both general and screw-based formulations.

---

## 📑 Table of Contents
- [Main Programs](#main-programs)
- [Other Subroutines](#other-subroutines)
- [How to Use This Repository](#how-to-use-this-repository)
- [Additional Information](#additional-information)
- [Acknowledgements](#acknowledgements)

---

## 🤖 Main Programs

### `Jacobian_XXXXX.m` 🧮
This MATLAB program calculates the Jacobian matrix for various robotic manipulators. It supports several methods, offering both general approaches and specialized, screw-based computations.

**Supported Manipulators and Methods:**

| **Manipulator**    | **Type**             | **Method**                                         |
|--------------------|----------------------|----------------------------------------------------|
| **RRR**            | 3R Manipulator       | General and Screw-based                            |
| **RRR_inspection** | 3R Manipulator       | By Inspection                                      |
| **ElbowSix**       | 6DOF Elbow Robot     | Screw-based in three different frames              |
| **Scara**          | SCARA Manipulator    | General                                            |
| **Stanford**       | Stanford Manipulator | Screw-based in two different frames                |

Each approach provides unique insights into the computation and analysis of the Jacobian matrix, enhancing both theoretical understanding and practical application.

---

## 🔧 Other Subroutines

These MATLAB functions and scripts support the main program by defining key parameters and improving the visualization of symbolic computations.

- **`1-DH.m`**  
  📌 **Purpose:** Defines the Denavit-Hartenberg (DH) parameters.  
  📖 **Description:** Provides a systematic approach for modeling the geometry of robotic manipulators.

- **`2-SR.m`**  
  📌 **Purpose:** Defines the Screw parameters.  
  📖 **Description:** Offers an alternative formulation for describing the kinematics of robotic systems.

- **`3-Vector_Vpa.m`**  
  📌 **Purpose:** Enhances the representation of symbolic vectors in MATLAB.  
  📖 **Description:** Ensures that symbolic vector outputs are clear and easy to interpret.

- **`4-Matrix_Vpa.m`**  
  📌 **Purpose:** Improves the visualization of symbolic matrices in MATLAB.  
  📖 **Description:** Delivers more readable and well-formatted symbolic matrix displays.

- **`5-Matrix_Vpa_Numeric.m`**  
  📌 **Purpose:** Enhances the representation of numerically evaluated symbolic matrices.  
  📖 **Description:** Makes numerical outputs more legible and informative.

---

## 🖥️ How to Use This Repository

1. **Clone or Download the Repository:**  
   Use Git to clone the repository or download the ZIP file to your local machine.

2. **Setup in MATLAB:**  
   Open MATLAB, navigate to the repository directory, and add all files to your MATLAB path.

3. **Run the Main Program:**  
   Execute `Jacobian_XXXXX.m` to compute the Jacobian matrices for the specified robotic manipulators. The code is well-commented to guide you through the computations.

4. **Examine the Subroutines:**  
   Review the supporting scripts (e.g., `1-DH.m`, `2-SR.m`, etc.) to understand how parameters and symbolic representations are defined and managed.

5. **Experiment and Learn:**  
   Modify parameters and test different configurations to deepen your understanding of robotic kinematics and the Jacobian matrix.

---

## ℹ️ Additional Information

- **Jacobian Matrix:**  
  The Jacobian matrix is crucial in robotics as it maps joint velocities to end-effector velocities. It is essential for motion control, singularity analysis, and overall system stability.

- **Kinematic Approaches:**  
  This chapter covers both general methods and specialized screw-based approaches to calculating the Jacobian, providing a well-rounded perspective on robotic kinematics.

This repository is designed to complement the theoretical insights from *Fundamentals of Robotics*, bridging the gap between theory and practical MATLAB implementations.

---

## 🙏 Acknowledgements

- **Author:** Hamid D. Taghirad  
- **Publisher:** CRC Press, Taylor & Francis Group, LLC  
- **Publication Year:** 2025

Thank you for exploring Chapter 6 of *Fundamentals of Robotics*. Enjoy your journey into robotics and happy coding! 🤖✨

---

*For questions, feedback, or contributions, please open an issue in this repository or contact the maintainer directly.*
