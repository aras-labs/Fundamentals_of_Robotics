# Fundamentals of Robotics 🤖

**CRC Press, Taylor & Francis Group, LLC**  
© 2025 Hamid D. Taghirad

Welcome to the simulation repository for Chapter 13 of *Fundamentals of Robotics*. This chapter focuses on advanced control strategies for a 3R robot. Here, you will find implementations of both **Compliance Control** and **Force Control** strategies in a closed-loop simulation environment.

---

## 📑 Table of Contents

- [Folder Overview](#folder-overview)
- [Program Descriptions](#program-descriptions)
- [How to Run a Simulation](#how-to-run-a-simulation)
- [Additional Information](#additional-information)
- [Acknowledgements](#acknowledgements)

---

## 📂 Folder Overview

This chapter contains two main folders, each dedicated to a specific control strategy:

- **Compliance Control**  
  *Closed-loop simulation of compliance control on a 3R robot.*

- **Force Control**  
  *Closed-loop simulation of direct force control on a 3R robot.*

---

## 🛠️ Program Descriptions

Each folder includes the following MATLAB programs and functions:

1. **`CL_Dynamic_Solver`**  
   - *Main simulation code.*  
   This is the primary script that drives the closed-loop simulation.

2. **`CL_Dynamics`**  
   - *Core dynamic function.*  
   Implements the dynamic equations governing the 3R robot and is called by the main simulation code.

3. **`Dynamic_Matrices`**  
   - *Dynamic vector and matrices function.*  
   Computes the essential dynamic vectors and matrices for the 3R robot.

4. **`XXXX_Control`**  
   - *Controller function used in the closed-loop simulation.*  
   Replace `XXXX` with the specific controller name (e.g., `Compliance_Control` or `Force_Control`) for the simulation you are running.

5. **`PlotData`**  
   - *Results plotting function.*  
   Generates plots and visualizations to help analyze the simulation outcomes.

6. **`Collision`**  
   - *Collision detection and interaction wrench estimation function.*  
   Detects collisions and estimates the interaction wrench during the simulation.

7. **`IK`**  
   - *Inverse kinematics function.*  
   Calculates the inverse kinematics along with velocities and accelerations.

8. **`Kinematics`**  
   - *Forward kinematics and Jacobian matrices function.*  
   Computes the forward kinematics and the corresponding Jacobian matrices.

9. **`TP_quintic`**  
   - *Trajectory planner based on quintic polynomials.*  
   Designs smooth trajectories using quintic polynomial interpolation.

10. **`Structural_Parameters`**  
    - *Simulation parameter configuration function.*  
    Contains all simulation parameters in a structured format for easy configuration.

---

## 🚀 How to Run a Simulation

To run a new simulation:

1. **Modify Simulation Parameters:**  
   Open the `Structural_Parameters` function and adjust the parameters as needed for your simulation.

2. **Select the Appropriate Folder:**  
   Navigate to the folder corresponding to the control strategy you want to simulate:
   - For **Compliance Control**, go to the *Compliance Control* folder.
   - For **Force Control**, go to the *Force Control* folder.

3. **Execute the Main Simulation Script:**  
   Run the `CL_Dynamic_Solver` script in the selected folder to start the closed-loop simulation.

---

## ℹ️ Additional Information

- **Modular Controller Design:**  
  The controller functions are modular (e.g., `Compliance_Control` or `Force_Control`), allowing you to easily switch and test different strategies.

- **Comprehensive Simulation Framework:**  
  This framework integrates dynamic modeling, kinematics, collision detection, and trajectory planning, offering a complete environment for analyzing advanced control methods on a 3R robot.

---

## 🙏 Acknowledgements

- **Author:** Hamid D. Taghirad  
- **Publisher:** CRC Press, Taylor & Francis Group, LLC  
- **Publication Year:** 2025

Thank you for exploring Chapter 13 of *Fundamentals of Robotics*. We hope these simulation programs offer valuable insights into advanced robotic control strategies. Happy simulating! 🤖✨

*For questions, feedback, or contributions, please open an issue in this repository or contact the repository maintainer.*
