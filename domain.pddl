(define (domain university-scheduling)
  (:requirements :strips :typing)
  
  ; Define the types
  (:types
    day slot course faculty room)

  ; Define the predicates
  (:predicates
    (available ?room - room ?day - day ?slot - slot)
    (assigned ?course - course ?room - room ?day - day ?slot - slot)
    (theory-course ?course - course)
    (lab-course ?course - course)
    (faculty-preference ?faculty - faculty ?day - day ?slot - slot)
    (different-days ?day1 - day ?day2 - day)
    (consecutive-slots ?slot1 - slot ?slot2 - slot)
    (course-unassigned ?course - course)
    (course-teacher ?course - course ?faculty - faculty)
  )
  
  ; Define the actions
  (:action assign-course-theory
    :parameters (?course - course ?faculty - faculty ?room1 - room ?room2 - room ?day1 - day ?day2 - day ?slot1 - slot ?slot2 - slot)
    :precondition (and
      (theory-course ?course)
      (course-teacher ?course ?faculty)
      (faculty-preference ?faculty ?day1 ?slot1)
      (faculty-preference ?faculty ?day2 ?slot2)
      (different-days ?day1 ?day2)
      (available ?room1 ?day1 ?slot1)
      (available ?room2 ?day2 ?slot2)
      (course-unassigned ?course)
    )
    :effect (and
      (assigned ?course ?room1 ?day1 ?slot1)
      (assigned ?course ?room2 ?day2 ?slot2)
      (not (available ?room1 ?day1 ?slot1))
      (not (available ?room2 ?day2 ?slot2))
      (not (faculty-preference ?faculty ?day1 ?slot1))
      (not (faculty-preference ?faculty ?day2 ?slot2))
      (not (course-unassigned ?course))
    )
  )
  
  (:action assign-course-lab
    :parameters (?course - course ?faculty - faculty ?room - room ?day - day ?slot1 - slot ?slot2 - slot)
    :precondition (and
      (lab-course ?course)
      (course-teacher ?course ?faculty)
      (faculty-preference ?faculty ?day ?slot1)
      (faculty-preference ?faculty ?day ?slot2)
      (available ?room ?day ?slot1)
      (available ?room ?day ?slot2)
      (consecutive-slots ?slot1 ?slot2)
      (course-unassigned ?course)
    )
    :effect (and
      (assigned ?course ?room ?day ?slot1)
      (assigned ?course ?room ?day ?slot2)
      (not (available ?room ?day ?slot1))
      (not (available ?room ?day ?slot2))
      (not (faculty-preference ?faculty ?day ?slot1))
      (not (faculty-preference ?faculty ?day ?slot2))
      (not (course-unassigned ?course))
    )
  )
)