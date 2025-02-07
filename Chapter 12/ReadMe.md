# Fundamentals of Robotics 🤖

**CRC Press, Taylor & Francis Group, LLC**  
© 2025 Hamid D. Taghirad

Welcome to the *Fundamentals of Robotics* repository! This folder contains simulation programs corresponding to **Chapter 6** of the book. In this chapter, various controller strategies are simulated on a 3R robot using closed-loop simulation techniques. Explore different control schemes such as Feed Forward + PID, Inverse Dynamics + PID, Partial IDC + PID, and Robust IDC + PID, along with a comparison of their performances.

---

## 📑 Table of Contents

- [Folder Overview](#folder-overview)
- [Programs and Their Descriptions](#programs-and-their-descriptions)
- [How to Run a Simulation](#how-to-run-a-simulation)
- [Additional Information](#additional-information)
- [Acknowledgements](#acknowledgements)

---

## 📂 Folder Overview

The following folders correspond to different controllers simulated on a 3R robot:

- **FF Control**  
  *Closed-loop simulation of Feed Forward + PID control on a 3R robot.*

- **IDC Control**  
  *Closed-loop simulation of Inverse Dynamics + PID on a 3R robot.*

- **PIDC Control**  
  *Closed-loop simulation of Partial IDC + PID on a 3R robot.*

- **RIDC Control**  
  *Closed-loop simulation of Robust IDC + PID on a 3R robot.*

- **Compare**  
  *Comparison of different closed-loop simulations.*

---

## 🛠️ Programs and Their Descriptions

Each folder contains the following MATLAB scripts and functions:

1. **`CL_Dynamic_Solver`**  
   🧩 **Main Simulation Code**  
   This is the primary script that drives the closed-loop simulation for the 3R robot.

2. **`CL_Dynamics`**  
   🔧 **Core Dynamic Function**  
   Called by the simulation code, this function computes the robot's dynamic behavior.

3. **`Dynamic_Matrices`**  
   📐 **Dynamic Matrices Generator**  
   Generates the dynamic vectors and matrices for the 3R robot, which are essential for simulation.

4. **`XXXX_Control`**  
   🎛️ **Controller Function**  
   This modular function implements the specific controller used in the closed-loop simulation. Replace `XXXX` with the appropriate controller name (e.g., `FF_Control`, `IDC_Control`, `PIDC_Control`, or `RIDC_Control`).

5. **`PlotData`**  
   📊 **Results Plotter**  
   Generates plots and visualizations of the simulation outcomes for easy analysis.

6. **`TP_quintic`**  
   🚀 **Trajectory Planner**  
   Plans smooth trajectories using quintic polynomial interpolation.

7. **`Structural_Parameters`**  
   ⚙️ **Simulation Parameter Configuration**  
   Contains all simulation parameters in a structured format. Modify these parameters to set up new simulation scenarios.

---

## 🚀 How to Run a Simulation

To run a new simulation, follow these steps:

1. **Adjust Simulation Parameters:**  
   Open the `Structural_Parameters` function and modify the simulation parameters as needed.

2. **Select the Appropriate Folder:**  
   Choose the folder corresponding to the controller you wish to simulate:
   - **FF Control** for Feed Forward + PID control.
   - **IDC Control** for Inverse Dynamics + PID.
   - **PIDC Control** for Partial IDC + PID.
   - **RIDC Control** for Robust IDC + PID.
   - **Compare** to review a comparison of different closed-loop simulations.

3. **Run the Main Simulation Script:**  
   Execute the `CL_Dynamic_Solver` script in the selected folder to launch the closed-loop simulation with your configured parameters.

4. **Analyze the Results:**  
   The `PlotData` function will automatically generate plots of the simulation results, allowing you to assess and compare controller performance.

---

## ℹ️ Additional Information

- **Controller Functions:**  
  Each controller is implemented in its dedicated function (e.g., `FF_Control`, `IDC_Control`, etc.), enabling easy switching between control strategies.

- **Dynamic Simulation:**  
  The simulation integrates the 3R robot's dynamic equations, providing insights into both theoretical and practical controller performance.

- **Trajectory Planning:**  
  The `TP_quintic` function ensures smooth and efficient motion planning through quintic polynomial interpolation.

This structured setup allows you to experiment with and analyze various control strategies on a 3R robot, thereby deepening your understanding of advanced robotics control.

---

## 🙏 Acknowledgements

- **Author:** Hamid D. Taghirad  
- **Publisher:** CRC Press, Taylor & Francis Group, LLC  
- **Publication Year:** 2025

Thank you for exploring Chapter 6 of *Fundamentals of Robotics*. We hope these simulation programs provide valuable insights into advanced control strategies on a 3R robot. Happy simulating! 🤖✨

*For questions, feedback, or contributions, please open an issue in this repository or contact the repository maintainer.*
