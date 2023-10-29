(define (problem university-scheduling-problem)
  (:domain university-scheduling)
  
  (:objects
    day1 day2 day3 day4 day5 - day
    slot1 slot2 slot3 slot4 slot5 slot6 - slot
    course1 course2 - course
    faculty1 faculty2 - faculty
    room1 room2 room3 - room
  )

  (:init
    (course-unassigned course1)
    (course-unassigned course2)
    (faculty-preference faculty1 day1 slot3)
    (faculty-preference faculty1 day2 slot1)
    (faculty-preference faculty2 day1 slot5)
    (faculty-preference faculty2 day2 slot5)
    (available room1 day1 slot3)
    (available room2 day2 slot1)
    (available room3 day1 slot5)
    (available room2 day2 slot5)

    (different-days day1 day2)
    (different-days day2 day1)

    (consecutive-slots slot1 slot2)
    (consecutive-slots slot3 slot4)
    (consecutive-slots slot5 slot6)

    (theory-course course1)
    (theory-course course2)
    (course-teacher course1 faculty1)
    (course-teacher course2 faculty2)
  )


  (:goal (and
    (forall(?course - course)
      (not(course-unassigned ?course))
    )
  ))
)
