# Fundamentals of Robotics 🤖

**CRC Press, Taylor & Francis Group, LLC**  
© 2025 Hamid D. Taghirad

Welcome to the simulation repository for Chapter 13 of *Fundamentals of Robotics*. This folder is dedicated to **Impedance Control** on a 3R robot. Here, you'll explore the implementation of impedance control, a strategy designed to manage dynamic interactions between the robot and its environment.

---

## 📑 Table of Contents

- [Folder Overview](#folder-overview)
- [Program Descriptions](#program-descriptions)
- [How to Run a Simulation](#how-to-run-a-simulation)
- [Additional Information](#additional-information)
- [Acknowledgements](#acknowledgements)

---

## 📂 Folder Overview

**Impedance Control**  
*Closed-loop simulation of impedance control on a 3R robot.*

This folder contains all the necessary MATLAB programs and functions to simulate impedance control. The simulation framework integrates dynamic modeling, kinematics, collision detection, trajectory planning, and control, offering a comprehensive environment for advanced robotic analysis.

---

## 🛠️ Program Descriptions

Within this folder, you will find the following MATLAB scripts and functions:

1. **`CL_Dynamic_Solver`**  
   *Main simulation code.*  
   Orchestrates the entire simulation by invoking dynamic and control functions.

2. **`CL_Dynamics`**  
   *Core dynamic function.*  
   Implements the dynamic equations for the 3R robot, called by the main simulation code.

3. **`Dynamic_Matrices`**  
   *Dynamic vectors and matrices function.*  
   Computes the essential dynamic vectors and matrices required for simulation.

4. **`Impedance_Control`**  
   *Controller function for impedance control.*  
   Implements the impedance control strategy used in the closed-loop simulation.

5. **`PlotData`**  
   *Results plotting function.*  
   Generates visualizations and plots of the simulation outcomes for performance analysis.

6. **`Collision`**  
   *Collision detection and interaction wrench estimation function.*  
   Detects collisions and estimates the interaction wrench between the robot and its environment.

7. **`IK`**  
   *Inverse kinematics function.*  
   Calculates inverse kinematics along with velocities and accelerations for the 3R robot.

8. **`Kinematics`**  
   *Forward kinematics and Jacobian matrices function.*  
   Computes forward kinematics and derives the associated Jacobian matrices.

9. **`TP_quintic`**  
   *Trajectory planner based on quintic polynomials.*  
   Designs smooth and continuous trajectories using quintic polynomial interpolation.

10. **`Structural_Parameters`**  
    *Simulation parameter configuration function.*  
    Contains all simulation parameters in a structured format, allowing for easy customization of the simulation setup.

---

## 🚀 How to Run a Simulation

To run a new simulation, follow these steps:

1. **Modify Simulation Parameters:**  
   Open the `Structural_Parameters` function and adjust the parameters according to your simulation requirements.

2. **Run the Main Simulation Script:**  
   Execute the `CL_Dynamic_Solver` script in the **Impedance Control** folder. This will launch the closed-loop simulation using the impedance control strategy.

3. **Analyze the Results:**  
   The `PlotData` function will automatically generate plots to visualize the simulation outcomes. Use these plots to assess the performance of the impedance control.

---

## ℹ️ Additional Information

- **Impedance Control Strategy:**  
  Impedance control regulates the interaction forces between the robot and its environment by modulating the robot's dynamic response. This strategy is essential for tasks that involve contact or require compliant behavior.

- **Comprehensive Simulation Framework:**  
  This simulation environment integrates various aspects of robot control—from dynamics and kinematics to collision detection and trajectory planning—providing a holistic framework for advanced robotics research.

---

## 🙏 Acknowledgements

- **Author:** Hamid D. Taghirad  
- **Publisher:** CRC Press, Taylor & Francis Group, LLC  
- **Publication Year:** 2025

Thank you for exploring the impedance control simulation in Chapter 13 of *Fundamentals of Robotics*. We hope this environment enhances your understanding of advanced robotic control strategies. Happy simulating! 🤖✨

*For questions, feedback, or contributions, please open an issue in this repository or contact the repository maintainer.*
