# Automated University Course Scheduling

## Project Description
This project aims to automate the scheduling of university courses using PDDL (Planning Domain Definition Language) and temporal planners such as OPTIC [1] and POP-F [2]. It's designed for undergraduate students across different academic years. The scheduling process considers various constraints, including instructor assignments, room availability, and course durations.

## Branches
- **Main Branch**: This branch focuses on a system where courses are non-overlapping for each student year, section, or batch. The numerical results in the ReadME document or the report are based on this branch.
- **Open-Credit Branch**: In this branch, any student can choose any course, subject to a set limit on enrollment.

## Features
- **Course Assignment**: Each year's students are required to take specific courses.
- **Instructor Assignment**: Instructors are assigned to courses.
- **Room Scheduling**: Courses are scheduled in available rooms.
- **Time Management**: Adheres to the daily operational time limit and weekly course durations.

## Domain Description (`domain.pddl`)
- **Types**: Includes `course`, `teacher`, `year`, `room`.
- **Predicates**: Key predicates like `daytime`, `nighttime`, `scheduled`, `room_free`, etc.
- **Functions**: Includes a `distance` function to calculate distances between rooms.
- **Actions**: 
  - `schedule_course_*`: Schedules courses of different durations.
  - `move_student` and `move_teacher`: Models the movement between rooms.
  - `start_day` and `end_day`: Manages the transition between daytime and nighttime.

## Problem Description (`problem.pddl`)
- **Objects**: Lists courses, teachers, years, and rooms.
- **Initial State**: Sets the initial conditions including room and teacher assignments, course-year assignments, and initial room distances.
- **Goals**: The primary goal is to schedule all required courses.
- **Constraints**: Uses `sometime` to ensure courses are appropriately scheduled to the preferred rooms.

## Planning with OPTIC and POP-F
1. **Set up Domain and Problem Files**: Adjust `domain.pddl` and `problem.pddl` as necessary.
2. **Execute the Planner**: Use the command `optic -T domain.pddl problem.pddl` or `popf -T domain.pddl problem.pddl`.

## Usage Instructions
1. **Edit PDDL Files**: Modify the domain and problem files according to your scheduling requirements.
2. **Run the Planner**: Use OPTIC or POP-F with the provided domain and problem files.
3. **Evaluate the Output**: Check the generated plan to ensure all courses are scheduled according to the constraints.

## Result Analysis

This section presents a comprehensive analysis of the outcomes from experimental runs using the OPTIC and POP-F planning algorithms in the context of university course scheduling. The following table showcases the results under various parameters:

### Comparative Analysis of OPTIC and POP-F

| Planner | # Course | # Year | # Instructor | # Room | Day-Night Shift | Plan Duration | Plan Length | Time to Find | States Evaluated | Preference Satisfied |
|---------|----------|--------|--------------|--------|-----------------|---------------|-------------|--------------|------------------|----------------------|
| OPTIC   | 2        | 2      | 1            | 1      |                 | 380.004       | 5           | 0.13         | 103              | ✅                    |
| OPTIC   | 2        | 2      | 1            | 2      |                 | 580.002       | 9           | 203.36       | 175865           | ✅                    |
| OPTIC   | 2        | 2      | 2            | 2      | 200             | 460.005       | 8           | 23.81        | 21631            | ✅                    |
| OPTIC   | 2        | 2      | 2*           | 2      |                 | 490.007       | 9           | 72.4         | 67809            | ✅                    |
| OPTIC   | 3        | 2      | 2            | 2      |                 | N/A           | N/A         | N/A          | N/A              | N/A                   |
| POP-F   | 2        | 2      | 1            | 1      |                 | 380.002       | 3           | 0.08         | 20               | ❌                    |
| POP-F   | 2        | 2      | 1            | 2      |                 | 380.002       | 4           | 0.08         | 33               | ❌                    |
| POP-F   | 2        | 2      | 2            | 2      | 200             | 460.003       | 5           | 0.08         | 37               | ❌                    |
| POP-F   | 2        | 2      | 2*           | 2      |                 | 280.003       | 5           | 0.07         | 68               | ❌                    |
| POP-F   | 3        | 2      | 2            | 2      |                 | 640.004       | 6           | 0.09         | 102              | ❌                    |

*An asterisk indicates instances where, despite the presence of two instructors, a single instructor was responsible for conducting both courses.*

#### Insights and Observations:
- **Planner Performance**: OPTIC generally required more time and evaluated more states but consistently satisfied preference criteria. POP-F was faster but failed in satisfying preferences.
- **Complexity Impact**: Increased complexity in terms of courses, instructors, and rooms resulted in longer planning durations and more evaluated states, especially noticeable with OPTIC.
- **Day-Night Shifts**: The day-night cycle contributed to planning complexity.
- **Limitations**: In highly complex scenarios (e.g., 3 courses, 2 years, 2 rooms), OPTIC did not yield a solution within a reasonable time, highlighting limitations in handling very complex scheduling tasks.


The experimental results underscore the effectiveness of OPTIC in managing complex scheduling scenarios with preference constraints, albeit with higher computational requirements. POP-F's speed advantage makes it suitable for simpler scenarios where preference satisfaction is less critical.

## Sample Scenario
In this university course scheduling scenario, the initial setup begins at nighttime, with two rooms (`N 101` and `S 101`) placed `10` units apart. Teachers `T1` and `T2` are assigned to courses `CSE 101` and `CSE 201`, respectively, with both teachers and all first and second-year students marked as available. The students and teacher `T2` are located in room `S 101`, while teacher `T1` is in `N 101`. All courses, `CSE 101` and `CSE 201`, across various session lengths, are initially unscheduled. The goal is to successfully schedule these courses within specific spatial and temporal constraints and preferences. Preferences within this setup dictate that `CSE 101` should have a `60`-minute session in `N 101`, and `CSE 201`, a `180`-minute session, also in `N 101`.

### Plan Obtained Using OPTIC Planner
```
0.000: (start_day) [0.001]
79.999: (move_student first_year s101 n101) [20.000]
100.001: (start_day) [0.001]
100.002: (schedule_course_60_1 cse101 t1 first_year n101) [60.000]
160.003: (schedule_course_60_2 cse101 t1 first_year n101) [60.000]
220.004: (schedule_course_60_3 cse101 t1 first_year n101) [60.000]
280.005: (move_student second_year s101 n101) [20.000]
300.006: (move_teacher t2 s101 n101) [10.000]
310.007: (schedule_course_180 cse201 t2 second_year n101) [180.000]
```
### Plan Obtained Using POP-F Planner
```
0.000: (start_day)  [0.001]
79.999: (move_student first_year s101 n101)  [20.000]
100.001: (start_day)  [0.001]
100.002: (schedule_course_180 cse201 t2 second_year s101)  [180.000]
100.003: (schedule_course_180 cse101 t1 first_year n101)  [180.000]
```

## Conclusion
This project showcases the use of automated planning in educational settings. It demonstrates the effectiveness of PDDL and temporal planners in solving complex, real-world scheduling problems.

## References

1. Benton, J.R., Coles, A.J., & Coles, A. (2012). Temporal Planning with Preferences and Time-Dependent Continuous Costs. Proceedings of the International Conference on Automated Planning and Scheduling.
2. Coles, A.J., Coles, A., Fox, M., & Long, D. (2010). Forward-Chaining Partial-Order Planning. International Conference on Automated Planning and Scheduling.

