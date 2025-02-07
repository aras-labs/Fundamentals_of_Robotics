# Fundamentals of Robotics - Chapters 4 & 5 🤖

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![GitHub issues](https://img.shields.io/github/issues/aras-labs/Fundamentals_of_Robotics)](https://github.com/aras-labs/Fundamentals_of_Robotics/issues)
[![GitHub stars](https://img.shields.io/github/stars/aras-labs/Fundamentals_of_Robotics)](https://github.com/aras-labs/Fundamentals_of_Robotics/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/aras-labs/Fundamentals_of_Robotics)](https://github.com/aras-labs/Fundamentals_of_Robotics/network/members)
![Visits Badge](https://badges.pufler.dev/visits/aras-labs/Fundamentals_of_Robotics)

Welcome to the **Fundamentals of Robotics** repository! This repository contains essential code and documentation related to robotic kinematics, specifically from Chapters 4 and 5 of our study material.

## Files Overview 📂

### Chapter 4: Forward Kinematics

The following programs in this folder correspond to Chapter 4 of the book:

#### Main Programs:

**`FK_RRR.m`**
This code provides the various kinematic derivations of the RRR (3R Manipulator) using both DH and Screw methods.

**`FK_Elbow.m`**
This code provides the kinematic derivations for the Elbow Manipulator using both DH and Screw methods.

**`FK_ElbowSix.m`**
This code covers the kinematic derivations for the Elbow6 Manipulator using both DH and Screw methods.

**`FK_SCARA.m`**
This code focuses on the kinematic derivations for the SCARA Manipulator using the Screw method.

**`FK_Stanford.m`**
This code includes the kinematic derivations for the Stanford Manipulator using both DH and Screw methods.

#### Other Subroutines:

**`1-DH.m`**
This function defines the Denavit-Hartenberg (DH) parameters, essential for describing the relative transformations between robotic links.

**`2-SR.m`**
This function defines Screw parameters, which are used to describe the motion and position of robotic links.

**`3-Vector_Vpa.m`**
This code provides a better representation of symbolic vectors in MATLAB, aiding in the visualization and manipulation of vector quantities.

**`4-Matrix_Vpa.m`**
This code offers an improved representation of symbolic matrices in MATLAB, which is crucial for handling complex matrix operations.

**`5-Matrix_Vpa_Numeric.m`**
This code enhances the representation of symbolic matrices that are numerically evaluated in MATLAB, ensuring accuracy in numerical computations.

## Chapter 4 Highlights 📚

- **4.1 Introduction**
- **4.2 Loop-Closure Method**
- **4.3 The Denavit-Hartenberg Convention**
  - **4.3.1 Convention Description**
  - **4.3.2 Coordinate System and DH Parameters**
  - **4.3.3 DH Homogeneous Transformations**
- **4.4 Forward Kinematic Analysis Methods**
  - **4.4.1 Loop Closure Method**
  - **4.4.2 Denavit-Hartenberg Method**
- **4.5 Screw-Based Method**
  - **4.5.1 Screw-Based Homogeneous Transformation**
  - **4.5.2 Consecutive Screws**
  - **4.5.3 Forward Kinematic Formulation**
  - **4.5.4 Screw-Based Analysis**

### Chapter 5: Inverse Kinematics

The following programs in this folder correspond to Chapter 5 of the book:

#### Main Programs:

**`IK_Algebraic.m`**
This code addresses the algebraic method for solving inverse kinematics problems, involving polynomial equations to determine joint variables.

**`IK_Geometric.m`**
This code focuses on the geometric approach to inverse kinematics, using geometric relationships to find joint parameters.

**`IK_Numerical.m`**
This file includes numerical methods for inverse kinematics, involving iterative algorithms to find joint angles.

#### Other Subroutines:

**`1-DH_IK.m`**
This function defines the Denavit-Hartenberg (DH) parameters specifically for inverse kinematics, aiding in solving for joint angles.

**`2-SR_IK.m`**
This function defines Screw parameters for inverse kinematics, helping to describe the necessary joint movements.

**`3-Vector_Vpa_IK.m`**
This code provides a better representation of symbolic vectors in MATLAB for inverse kinematics, improving the handling of vector data.

**`4-Matrix_Vpa_IK.m`**
This code offers an improved representation of symbolic matrices in MATLAB for inverse kinematics applications.

**`5-Matrix_Vpa_Numeric_IK.m`**
This file enhances the representation of numerically evaluated symbolic matrices for inverse kinematics, ensuring precision in calculations.

## Chapter 5 Highlights 📚

- **5.1 Introduction**
- **5.2 Conceptual Example**
- **5.3 Solvability and the Robot Workspace**
- **5.4 Solution Methods**
  - **5.4.1 Algebraic Method**
  - **5.4.2 Geometric Approach**
  - **5.4.3 Reduction to Polynomial**
  - **5.4.4 Numerical Method**
  - **5.4.5 Simplification by Using Wrist Point**
- **5.5 Case Studies**
  - **5.5.1 SCARA Robot: Denavit Hartenberg Method**
  - **5.5.2 Fanuc S-900W Robot: Denavit-Hartenberg Method**
  - **5.5.3 Stanford Robot: Consecutive Screws**
  - **5.5.4 6DOF Elbow Manipulator: Consecutive Screws**
- **5.6 Accuracy and Repeatability**

Feel free to explore the repository and delve into the code. Your contributions, issues, and feature requests are always welcome!

Happy coding! 🎉

---

Visit the [repository](https://github.com/aras-labs/Fundamentals_of_Robotics) for more details and feel free to reach out if you have any questions or suggestions.
