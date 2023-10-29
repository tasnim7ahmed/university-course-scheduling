# University Course Scheduling

## Course Information

This is the term project for the "CISC 813 - Automated Planning" course at Queen's University.

- Semester: Fall 2023
- Instructor: Christian MUISE, Assistant Professor, School of Computing, Queen's University

Student Information:

- Name: Tasnim Ahmed
- Email: tasnim.ahmed@queensu.ca
- Group: 7

## Project Description

This project aims to solve the complex problem of scheduling university courses. The university operates five days a week (Monday - Friday), with each day divided into six slots of 1 hour and 15 minutes, labeled as slots 1-6.

A theory course requires two slots each week, but these slots cannot be on the same day. Lab courses occur weekly and consume two consecutive slots on a given day. Each course, whether theory or lab, has an assigned faculty member who has specific slot preferences.

Classroom availability is a constraint as a course cannot be assigned to a classroom in a slot that is already occupied. Additionally, students need to move around campus to attend their classes, and the time required for this movement must be accounted for in the schedule. Therefore, the proximity of lecture halls (close vs. far) becomes an important factor.

The task of the planner is to generate a solution that specifies which course will be held in which room on which day and in what slot of the day, ensuring that students have sufficient time to walk between their classes.

## Project Status

Please note that this project is currently under development and not yet complete. The current solution does not consider the student aspect of the constraints like which student is taking which course and the distance between halls. These constraints will be added in an iterative process shortly.

## Solution

The problem is solved using Planning Domain Definition Language (PDDL). The project consists of two files - `problem.pddl` and `domain.pddl`.

### Domain File (`domain.pddl`)

The domain file defines the types, predicates, and actions used in our problem.

#### Types

- `day`
- `slot`
- `course`
- `faculty`
- `room`

#### Predicates

- `available`
- `assigned`
- `theory-course`
- `lab-course`
- `faculty-preference`
- `different-days`
- `consecutive-slots`
- `course-unassigned`
- `course-teacher`

#### Actions

- `assign-course-theory`
- `assign-course-lab`

### Problem File (`problem.pddl`)

The problem file defines the objects, initial state, and goal state of our problem.

#### Objects

Days: `day1`, `day2`, `day3`, `day4`, `day5`  
Slots: `slot1`, `slot2`, `slot3`, `slot4`, `slot5`, `slot6`  
Courses: `course1`, `course2`  
Faculty: `faculty1`, `faculty2`  
Rooms: `room1`, `room2`, `room3`

#### Initial State

The initial state includes faculty preferences for certain days and slots, room availability for certain days and slots, different days, consecutive slots, course types (theory or lab), and course teachers.

#### Goal State

The goal state is that all courses are assigned (i.e., no course is unassigned).

## How to Run

To run this project, you can use `editor.planning.domains`, an online planner website.
