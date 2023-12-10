(define (problem schedule_classes) (:domain schedule)
  (:objects 
    cse101 cse102 cse201 - course
    t1 t2 - teacher
    first_year second_year - year
    n101 s101 - room
  )
  (:init 
    (nighttime)
    
    (at 100.0 (nighttime))
    (at 100.0 (not(daytime)))

    (= (distance n101 s101) 10)
    (= (distance s101 n101) 10)

    (teaches t1 cse101) (teaches t2 cse102) (teaches t2 cse201)
    (room_free n101) (room_free s101)
    (teacher_available t1) (teacher_available t2)
    (students_available first_year) (students_available second_year)
    (course_assigned cse101 first_year) (course_assigned cse102 first_year) (course_assigned cse201 second_year)
    (teacher_at n101 t1) (teacher_at s101 t2)
    
    (student_at s101 first_year) (student_at s101 second_year)
    
    (unscheduled_180 cse101)
    
    (unscheduled_90_1 cse101)
    (unscheduled_90_2 cse101)

    (unscheduled_60_1 cse101)
    (unscheduled_60_2 cse101)
    (unscheduled_60_3 cse101)

    (unscheduled_180 cse102)
    
    (unscheduled_90_1 cse102)
    (unscheduled_90_2 cse102)

    (unscheduled_60_1 cse102)
    (unscheduled_60_2 cse102)
    (unscheduled_60_3 cse102)

    (unscheduled_180 cse201)

    (unscheduled_90_1 cse201)
    (unscheduled_90_2 cse201)

    (unscheduled_60_1 cse201)
    (unscheduled_60_2 cse201)
    (unscheduled_60_3 cse201)
  )

  (:constraints
    (and
    (sometime (scheduled_at_60_1 cse101 n101))
    (sometime (scheduled_at_180 cse201 n101))
    )
  )

  (:goal (and 
    (scheduled cse101)
    (scheduled cse102)
    (scheduled cse201)
  ))
)
