(define (problem schedule_classes) (:domain schedule)
  (:objects 
    ; cse101 cse102 cse201 cse202 - course
    ; t1 t2 t3 t4 - teacher
    ; first_year second_year - year
    ; n101 s101 - room

    cse101 - course
    t1 - teacher
    first_year - year
    n101 s101 - room
  )
  (:init 
    ; (teaches t1 cse101) (teaches t2 cse102) (teaches t3 cse201) (teaches t4 cse202)
    ; (room_free n101) (room_free s101)
    ; (teacher_available t1) (teacher_available t2) (teacher_available t3) (teacher_available t4)
    ; (students_available first_year) (students_available second_year)
    ; (course_assigned cse101 first_year) (course_assigned cse102 first_year)
    ; (course_assigned cse201 second_year) (course_assigned cse202 second_year)
    ; (teacher_at n101 t1) (teacher_at n101 t2) (teacher_at n101 t3) (teacher_at n101 t4)
    ; (student_at s101 first_year) (student_at s101 second_year)

    (teaches t1 cse101)
    (room_free n101) (room_free s101)
    (teacher_available t1)
    (students_available first_year)
    (course_assigned cse101 first_year)
    (teacher_at n101 t1)
    
    (student_at s101 first_year)
    
    (unscheduled_90_1 cse101)
    (unscheduled_90_2 cse101)

    (unscheduled_60_1 cse101)
    (unscheduled_60_2 cse101)
    (unscheduled_60_3 cse101)
  )

  (:constraints
    (sometime (scheduled_at_60_1 cse101 n101))
  )

  (:goal (and 
    ; (scheduled cse101)
    ; (scheduled cse102)
    ; (scheduled cse201) 
    ; (scheduled cse202)

    (scheduled cse101)
  ))
)
