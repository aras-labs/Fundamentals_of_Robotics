# Fundamentals of Robotics 🤖

**CRC Press, Taylor & Francis Group, LLC**  
© 2025 Hamid D. Taghirad

Welcome to the *Fundamentals of Robotics* repository! This folder contains MATLAB programs corresponding to **Chapter 10** of the book. In this chapter, you will explore various trajectory generation techniques, dynamic simulations, and calibration methods for robotic systems.

---

## 📑 Table of Contents

- [Main Programs](#main-programs)
- [Simulation and Calibration Folders](#simulation-and-calibration-folders)
- [How to Use This Repository](#how-to-use-this-repository)
- [Additional Information](#additional-information)
- [Acknowledgements](#acknowledgements)

---

## 🤖 Main Programs

The following MATLAB scripts are provided in this chapter for generating trajectories for a 2R robot:

1. **Cubic_2R.m**  
   📌 *Purpose:* Generates cubic trajectories for a 2R robot.

2. **Cubic_2R_via.m**  
   📌 *Purpose:* Generates cubic trajectories for a 2R robot with via points.

3. **Quintic_2R.m**  
   📌 *Purpose:* Generates quintic trajectories for a 2R robot.

4. **blend_2R.m**  
   📌 *Purpose:* Generates linear trajectories with parabolic blends for a 2R robot.

5. **opt_blend_2R.m**  
   📌 *Purpose:* Generates linear trajectories with parabolic blends featuring optimal time maneuvers for a 2R robot.

6. **CubicE_2R.m**  
   📌 *Purpose:* Generates cubic trajectories in task space for a 2R robot.

---

## 📂 Simulation and Calibration Folders

7. **Folder: 3R Dynamic Sim**  
   📁 *Description:* Contains scripts for inverse dynamics and closed-loop simulation of a 3R robot.

8. **Folder: 2R Calibration**  
   📁 *Description:* Contains calibration routines for a 2R robot.

---

## 🚀 How to Use This Repository

1. **Clone or Download the Repository:**  
   Use Git to clone the repository or download the ZIP file and extract it to your desired location.

2. **Setup in MATLAB:**  
   Open MATLAB, navigate to the repository directory, and add all necessary files and folders to your MATLAB path.

3. **Run the Scripts:**  
   - Execute the trajectory generation scripts (e.g., `Cubic_2R.m`, `Cubic_2R_via.m`, `Quintic_2R.m`, etc.) to create trajectories for the 2R robot.
   - Explore the **3R Dynamic Sim** folder to run simulations involving inverse dynamics and closed-loop control of the 3R robot.
   - Use the **2R Calibration** folder to perform calibration of the 2R robot.

4. **Experiment and Customize:**  
   The scripts are well-commented to guide you through the code. Feel free to modify parameters, add new features, or combine functionalities to deepen your understanding of trajectory planning, dynamic simulation, and calibration in robotics.

---

## ℹ️ Additional Information

- **Trajectory Generation:**  
  Trajectory planning is essential for ensuring smooth and efficient robot motion. This chapter covers a variety of methods, from simple cubic and quintic trajectories to advanced linear trajectories with parabolic blends and optimal timing.

- **Dynamic Simulation:**  
  The simulation folder offers tools for analyzing the inverse dynamics of a 3R robot, which is critical for understanding and designing control systems.

- **Calibration:**  
  Accurate calibration is key to the reliable operation of robotic systems. The calibration routines provided help in fine-tuning the performance of a 2R robot.

---

## 🙏 Acknowledgements

- **Author:** Hamid D. Taghirad  
- **Publisher:** CRC Press, Taylor & Francis Group, LLC  
- **Publication Year:** 2025

Thank you for exploring Chapter 10 of *Fundamentals of Robotics*. We hope these programs and tools inspire your journey into advanced robotics and motion planning! 🤖✨

*For questions, feedback, or contributions, please open an issue in this repository or contact the repository maintainer.*
