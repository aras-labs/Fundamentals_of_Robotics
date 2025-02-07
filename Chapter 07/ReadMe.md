# Fundamentals of Robotics 🤖

**CRC Press, Taylor & Francis Group, LLC**  
© 2025 Hamid D. Taghirad

Welcome to the *Fundamentals of Robotics* repository! This folder contains MATLAB programs corresponding to **Chapter 7** of the book. In this chapter, you will explore advanced topics in singularity analysis and redundancy resolution for robotic manipulators.

---

## 📑 Table of Contents
- [Main Programs](#main-programs)
- [Program Details](#program-details)
- [How to Use](#how-to-use)
- [Additional Information](#additional-information)
- [Acknowledgements](#acknowledgements)

---

## 🤖 Main Programs

### 1. `twoRisotropy.m` 🧮
This code performs singularity analysis of a 2R robot.  
**Reference:** *Example 7.4 in the book*

---

### 2. `Obstacle_3R.m` 🚧
This code solves the optimal redundancy resolution for a 3R robot with an obstacle avoidance objective.  
**Reference:** *Case Study 7.1 in the book*

---

### 3. `Singularity_3R.m` 📐
This code tackles the optimal redundancy resolution for a 3R robot to achieve singularity circumnavigation.  
**Reference:** *Case Study 7.2 in the book*

---

## 📝 Program Details

| **Program**           | **Purpose**                                                                                   | **Reference**            |
|-----------------------|-----------------------------------------------------------------------------------------------|--------------------------|
| `twoRisotropy.m`      | Performs singularity analysis for a 2R robot, identifying critical singular configurations.  | Example 7.4              |
| `Obstacle_3R.m`       | Implements optimal redundancy resolution for a 3R robot aimed at obstacle avoidance.           | Case Study 7.1           |
| `Singularity_3R.m`    | Addresses optimal redundancy resolution for a 3R robot, focusing on singularity circumvention. | Case Study 7.2           |

---

## 🚀 How to Use

1. **Clone or Download the Repository:**  
   Use Git to clone the repository or download the ZIP file and extract it to your preferred directory.

2. **Setup in MATLAB:**  
   Open MATLAB and navigate to the directory containing these files. Ensure the folder is added to your MATLAB path.

3. **Run the Programs:**  
   - For singularity analysis of a 2R robot, run `twoRisotropy.m`.  
   - For obstacle avoidance in a 3R robot, execute `Obstacle_3R.m`.  
   - For singularity circumnavigation in a 3R robot, run `Singularity_3R.m`.

4. **Experiment & Learn:**  
   The scripts are well-commented to help you understand the underlying concepts. Feel free to modify parameters and explore different scenarios to deepen your understanding of robotic kinematics and control.

---

## ℹ️ Additional Information

- **Singularity Analysis:**  
  Identifying singularities is critical in robotics to ensure smooth operation and avoid configurations where control may be compromised.

- **Redundancy Resolution:**  
  Optimal redundancy resolution is key for robots that possess more degrees of freedom than necessary for a given task. This chapter demonstrates strategies for both obstacle avoidance and singularity circumnavigation, ensuring safe and efficient robotic motion.

- **Practical Case Studies:**  
  The examples and case studies provided (7.1, 7.2, and 7.4) offer practical insights into the implementation of these advanced concepts in real-world scenarios.

---

## 🙏 Acknowledgements

- **Author:** Hamid D. Taghirad  
- **Publisher:** CRC Press, Taylor & Francis Group, LLC  
- **Publication Year:** 2025

Thank you for exploring Chapter 7 of *Fundamentals of Robotics*. We hope these programs inspire and enhance your journey into advanced robotic analysis and design! 🤖✨

---

*For questions, feedback, or contributions, please open an issue in this repository or contact the repository maintainer.*
