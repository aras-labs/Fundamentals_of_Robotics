# Fundamentals of Robotics 🤖

**CRC Press, Taylor & Francis Group, LLC**  
© 2025 Hamid D. Taghirad

Welcome to the *Fundamentals of Robotics* repository! This folder contains simulation programs corresponding to **Chapter 11** of the book. In this chapter, different controllers are simulated on a 3R robot, allowing you to explore and compare the performance of PD and PID control strategies in a closed-loop environment.

---

## 📑 Table of Contents

- [Folder Overview](#folder-overview)
- [Programs and Their Descriptions](#programs-and-their-descriptions)
- [How to Run a Simulation](#how-to-run-a-simulation)
- [Additional Information](#additional-information)
- [Acknowledgements](#acknowledgements)

---

## 📂 Folder Overview

This chapter is organized into two main folders, each corresponding to a different control strategy for the 3R robot:

- **PD Control**  
  *Closed-loop simulation of PD control on a 3R robot.*

- **PID Control**  
  *Closed-loop simulation of PID control on a 3R robot.*

Each folder contains the following programs that work together to simulate the robot's dynamics and control behavior.

---

## 🛠️ Programs and Their Descriptions

Within each folder, you will find the following MATLAB scripts and functions:

1. **`CL_Dynamic_Solver`**  
   🧩 *Main simulation code.*  
   This is the primary script that runs the closed-loop simulation for the 3R robot.

2. **`CL_Dynamics`**  
   🔧 *Main function called by the simulation code.*  
   It encapsulates the core dynamic equations used in the simulation.

3. **`Dynamic_Matrices`**  
   📐 *Dynamic vectors and matrices generator for the 3R robot.*  
   This function computes the necessary dynamic properties required for the simulation.

4. **`XXXX_Control`**  
   🎛️ *Controller function used in the closed-loop simulation.*  
   Replace `XXXX` with the specific controller (e.g., `PD_Control` or `PID_Control`) to apply the desired control strategy.

5. **`PlotData`**  
   📊 *Results plotting function.*  
   This function generates plots and visualizations of the simulation outcomes.

6. **`TP_quintic`**  
   🚀 *Trajectory Planner based on quintic polynomials.*  
   It designs smooth trajectories for the robot's motion.

7. **`Structural_Parameters`**  
   ⚙️ *Simulation parameter configuration.*  
   All simulation parameters are defined in this function in a structured format, making it easy to adjust settings for different simulation scenarios.

---

## 🚀 How to Run a Simulation

To run a new simulation, follow these simple steps:

1. **Adjust Parameters:**  
   Open the `Structural_Parameters` function and modify the simulation parameters as needed.

2. **Select the Appropriate Folder:**  
   Choose the folder corresponding to the control strategy you wish to simulate:
   - For PD control, navigate to the **PD Control** folder.
   - For PID control, navigate to the **PID Control** folder.

3. **Execute the Main Simulation:**  
   Run the `CL_Dynamic_Solver` script in the selected folder. This will initiate the closed-loop simulation using the defined parameters and control strategy.

4. **Review Results:**  
   After running the simulation, the `PlotData` function will automatically generate plots to help you analyze the performance of the controller.

---

## ℹ️ Additional Information

- **Controller Implementation:**  
  The `XXXX_Control` function is designed to be modular. Simply replace `XXXX` with the appropriate controller name (e.g., `PD_Control` or `PID_Control`) to switch between different control strategies.

- **Simulation Flexibility:**  
  By centralizing the simulation parameters in the `Structural_Parameters` function, this setup allows for quick and efficient experimentation with various scenarios and control strategies.

- **Visualization:**  
  The `PlotData` function provides clear graphical representations of the simulation outcomes, making it easier to understand the dynamic behavior and performance of the 3R robot under different control schemes.

---

## 🙏 Acknowledgements

- **Author:** Hamid D. Taghirad  
- **Publisher:** CRC Press, Taylor & Francis Group, LLC  
- **Publication Year:** 2025

Thank you for exploring Chapter 11 of *Fundamentals of Robotics*. We hope these simulation programs provide valuable insights into controller performance on robotic systems. Happy simulating! 🤖✨

*For questions, feedback, or contributions, please open an issue in this repository or contact the repository maintainer.*
