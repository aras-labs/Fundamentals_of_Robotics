# Fundamentals of Robotics 🤖

**CRC Press, Taylor & Francis Group, LLC**  
© 2025 Hamid D. Taghirad

Welcome to the *Fundamentals of Robotics* repository! This resource is dedicated to exploring the kinematic derivations and modeling of various robotic manipulators, as presented in Chapter 4 of the book. Whether you're a student, researcher, or robotics enthusiast, this repository provides a practical insight into both **Denavit-Hartenberg (DH)** and **Screw** parameter methodologies.

---

## 📑 Table of Contents
- [Main Programs](#main-programs)
- [Other Subroutines](#other-subroutines)
- [Additional Explanations](#additional-explanations)
- [How to Use This Repository](#how-to-use-this-repository)
- [Acknowledgements](#acknowledgements)

---

## 🤖 Main Programs

### `FK_XXXXX.m`
This is the central MATLAB program that demonstrates various kinematic derivations for different robotic manipulators. It supports both DH and Screw parameter formulations, ensuring a comprehensive understanding of robotic kinematics.

**Supported Manipulators:**

| **Manipulator** | **Type**             | **Kinematic Methods** |
|-----------------|----------------------|-----------------------|
| **RRR**       | 3R Manipulator       | DH and Screw          |
| **Elbow**     | Elbow Manipulator    | DH and Screw          |
| **ElbowSix**  | Elbow6 Manipulator   | DH and Screw          |
| **SCARA**     | SCARA Manipulator    | Screw                 |
| **Stanford**  | Stanford Manipulator | DH and Screw          |

Each entry in the table represents a different approach to solving kinematic problems, offering a diverse learning experience.

---

## 🔧 Other Subroutines

These supplementary MATLAB scripts and functions support the main program by defining essential parameters and improving the display of symbolic matrices.

- **`1-DH.m`**  
  📌 *Purpose:* Defines the **Denavit-Hartenberg (DH) parameters**.  
  📖 *Description:* Establishes a systematic approach to describe the geometry of robotic manipulators.

- **`2-SR.m`**  
  📌 *Purpose:* Defines the **Screw parameters**.  
  📖 *Description:* Provides an alternative method to model robot kinematics through the concept of screws.

- **`3-Matrix_Vpa.m`**  
  📌 *Purpose:* Enhances the representation of symbolic matrices in MATLAB.  
  📖 *Description:* Offers clearer and more readable outputs for symbolic matrix calculations.

- **`4-Matrix_Vpa_Numeric.m`**  
  📌 *Purpose:* Improves the display of numerically evaluated symbolic matrices.  
  📖 *Description:* Ensures that numerical evaluations are as legible and informative as their symbolic counterparts.

---

## 📖 Additional Explanations

- **Denavit-Hartenberg (DH) Parameters:**  
  A standardized method that simplifies the representation of robot geometry. By using a set of four parameters per joint, DH parameters streamline the process of deriving kinematic equations.

- **Screw Parameters:**  
  This approach leverages the mathematical concept of screws to describe spatial motion. It offers a unique perspective on kinematics, often simplifying certain computations and providing deeper insights into the mechanics of robotic systems.

The repository is designed to complement the theoretical discussions found in Chapter 4 of *Fundamentals of Robotics*, bridging the gap between theory and practical implementation.

---

## 🔍 How to Use This Repository

1. **Clone or Download the Repository:**  
   Use Git or download the ZIP file to get started on your local machine.

2. **Setup in MATLAB:**  
   Open MATLAB and navigate to the repository directory. Ensure all files are in the MATLAB path.

3. **Run the Main Program:**  
   Execute `FK_XXXXX.m` to view the kinematic derivations in action. The code is well-commented to assist you with any modifications or explorations.

4. **Explore the Subroutines:**  
   Review the supporting scripts (`1-DH.m`, `2-SR.m`, etc.) to gain a deeper understanding of how parameters and symbolic matrix representations are handled.

5. **Experiment & Learn:**  
   Modify the parameters and functions to see real-time changes and deepen your grasp of robotic kinematics. Enjoy the process of discovery!

---

## 🙏 Acknowledgements

- **Author:** Hamid D. Taghirad  
- **Publisher:** CRC Press, Taylor & Francis Group, LLC  
- **Publication Year:** 2025

Thank you for exploring *Fundamentals of Robotics*. Your journey into the fascinating world of robotics starts here. Happy coding and innovating! 🤖✨

---

*For questions, feedback, or contributions, please open an issue in this repository or contact the maintainer directly.*
