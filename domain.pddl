(define (domain schedule)
  (:requirements :strips :typing :durative-actions :equality :fluents :timed-initial-literals)
  (:types course teacher year room)

  (:predicates 
    (daytime)
    (nighttime)

    (scheduled ?c - course)

    (scheduled_180 ?c - course)
    (unscheduled_180 ?c - course)
    (scheduled_at_180 ?c - course ?r - room)

    (scheduled_90_1 ?c - course)
    (scheduled_90_2 ?c - course)

    (unscheduled_90_1 ?c - course)
    (unscheduled_90_2 ?c - course)
  
    (scheduled_at_90_1 ?c - course ?r - room)
    (scheduled_at_90_2 ?c - course ?r - room)

    (scheduled_60_1 ?c - course)
    (scheduled_60_2 ?c - course)
    (scheduled_60_3 ?c - course)

    (unscheduled_60_1 ?c - course)
    (unscheduled_60_2 ?c - course)
    (unscheduled_60_3 ?c - course)
  
    (scheduled_at_60_1 ?c - course ?r - room)
    (scheduled_at_60_2 ?c - course ?r - room)
    (scheduled_at_60_3 ?c - course ?r - room)

    (teaches ?t - teacher ?c - course)
    (room_free ?r - room)

    (students_available ?y - year)
    (student_at ?r - room ?y - year)

    (teacher_available ?t - teacher)
    (teacher_at ?r - room ?t - teacher)

    (course_assigned ?c - course ?y - year)
  )

  (:functions
    (distance ?from - room ?to - room)
  )

  (:durative-action schedule_course_180
    :parameters (?c - course ?t - teacher ?y - year ?r - room)
    :duration (= ?duration 180)
    :condition (and 
      (over all (daytime))
      (at start (teaches ?t ?c))
      (at start (room_free ?r))
      (at start (course_assigned ?c ?y))

      (at start (unscheduled_180 ?c))

      (at start (unscheduled_60_1 ?c))
      (at start (unscheduled_60_2 ?c))
      (at start (unscheduled_60_3 ?c))

      (at start (unscheduled_90_1 ?c))
      (at start (unscheduled_90_2 ?c))

      (at start (students_available ?y))
      (at start (teacher_available ?t))

      (over all (teacher_at ?r ?t))
      (over all (student_at ?r ?y))
      )
    :effect (and 
      (at start (not (room_free ?r)))
      (at start (not (teacher_available ?t)))
      (at start (not (students_available ?y)))

      (at end (room_free ?r))
      (at end (teacher_available ?t))
      (at end (students_available ?y))

      (at end (scheduled_180 ?c))
      (at end (scheduled_at_180 ?c ?r))
      (at end (not (unscheduled_180 ?c)))

      (at end (scheduled ?c))
    )
  )

  ; 90 minutes class (2 classes)

  (:durative-action schedule_course_90_1
    :parameters (?c - course ?t - teacher ?y - year ?r - room)
    :duration (= ?duration 90)
    :condition (and 
      (over all (daytime))
      (at start (teaches ?t ?c))
      (at start (room_free ?r))
      (at start (course_assigned ?c ?y))

      (at start (unscheduled_180 ?c))

      (at start (unscheduled_60_1 ?c))
      (at start (unscheduled_60_2 ?c))
      (at start (unscheduled_60_3 ?c))

      (at start (unscheduled_90_1 ?c))
      (at start (unscheduled_90_2 ?c))

      (at start (students_available ?y))
      (at start (teacher_available ?t))

      (over all (teacher_at ?r ?t))
      (over all (student_at ?r ?y))
      )
    :effect (and 
      (at start (not (room_free ?r)))
      (at start (not (teacher_available ?t)))
      (at start (not (students_available ?y)))

      (at end (room_free ?r))
      (at end (teacher_available ?t))
      (at end (students_available ?y))

      (at end (scheduled_90_1 ?c))
      (at end (scheduled_at_90_1 ?c ?r))
      (at end (not (unscheduled_90_1 ?c)))
    )
  )

    (:durative-action schedule_course_90_2
    :parameters (?c - course ?t - teacher ?y - year ?r - room)
    :duration (= ?duration 90)
    :condition (and 
      (over all (daytime))
      (at start (teaches ?t ?c))
      (at start (room_free ?r))
      (at start (course_assigned ?c ?y))

      (at start (scheduled_90_1 ?c))

      (at start (unscheduled_180 ?c))
      (at start (unscheduled_60_1 ?c))
      (at start (unscheduled_60_2 ?c))
      (at start (unscheduled_60_3 ?c))
      (at start (unscheduled_90_2 ?c))

      (at start (students_available ?y))
      (at start (teacher_available ?t))

      (over all (teacher_at ?r ?t))
      (over all (student_at ?r ?y))
      )
    :effect (and 
      (at start (not (room_free ?r)))
      (at start (not (teacher_available ?t)))
      (at start (not (students_available ?y)))

      (at end (room_free ?r))
      (at end (teacher_available ?t))
      (at end (students_available ?y))

      (at end (scheduled_90_2 ?c))
      (at end (scheduled_at_90_2 ?c ?r))
      (at end (not (unscheduled_90_2 ?c)))

      (at end (scheduled ?c))
    )
  )
    
  ; 60 minutes class (3 classes)
    
  (:durative-action schedule_course_60_1
    :parameters (?c - course ?t - teacher ?y - year ?r - room)
    :duration (= ?duration 60)
    :condition (and 
      (over all (daytime))
      (at start (teaches ?t ?c))
      (at start (room_free ?r))
      (at start (course_assigned ?c ?y))

      (at start (unscheduled_180 ?c))

      (at start (unscheduled_90_1 ?c))
      (at start (unscheduled_90_2 ?c))

      (at start (unscheduled_60_1 ?c))
      (at start (unscheduled_60_2 ?c))
      (at start (unscheduled_60_3 ?c))

      (at start (students_available ?y))
      (at start (teacher_available ?t))

      (over all (teacher_at ?r ?t))
      (over all (student_at ?r ?y))
      )
    :effect (and 
      (at start (not (room_free ?r)))
      (at start (not (teacher_available ?t)))
      (at start (not (students_available ?y)))

      (at end (room_free ?r))
      (at end (teacher_available ?t))
      (at end (students_available ?y))

      (at end (scheduled_60_1 ?c))
      (at end (scheduled_at_60_1 ?c ?r))
      (at end (not (unscheduled_60_1 ?c)))
    )
  )

    (:durative-action schedule_course_60_2
    :parameters (?c - course ?t - teacher ?y - year ?r - room)
    :duration (= ?duration 60)
    :condition (and 
      (over all (daytime))
      (at start (teaches ?t ?c))
      (at start (room_free ?r))
      (at start (course_assigned ?c ?y))

      (at start (unscheduled_180 ?c))
      (at start (unscheduled_90_1 ?c))
      (at start (unscheduled_90_2 ?c))

      (at start (scheduled_60_1 ?c))
      (at start (unscheduled_60_2 ?c))
      (at start (unscheduled_60_3 ?c))

      (at start (students_available ?y))
      (at start (teacher_available ?t))

      (over all (teacher_at ?r ?t))
      (over all (student_at ?r ?y))
      )
    :effect (and 
      (at start (not (room_free ?r)))
      (at start (not (teacher_available ?t)))
      (at start (not (students_available ?y)))

      (at end (room_free ?r))
      (at end (teacher_available ?t))
      (at end (students_available ?y))

      (at end (scheduled_60_2 ?c))
      (at end (scheduled_at_60_2 ?c ?r))
      (at end (not (unscheduled_60_2 ?c)))
    )
  )
    
  (:durative-action schedule_course_60_3
    :parameters (?c - course ?t - teacher ?y - year ?r - room)
    :duration (= ?duration 60)
    :condition (and 
      (over all (daytime))
      (at start (teaches ?t ?c))
      (at start (room_free ?r))
      (at start (course_assigned ?c ?y))

      (at start (unscheduled_180 ?c))
      (at start (unscheduled_90_1 ?c))
      (at start (unscheduled_90_2 ?c))

      (at start (scheduled_60_1 ?c))
      (at start (scheduled_60_2 ?c))
      (at start (unscheduled_60_3 ?c))

      (at start (students_available ?y))
      (at start (teacher_available ?t))

      (over all (teacher_at ?r ?t))
      (over all (student_at ?r ?y))
      )
    :effect (and 
      (at start (not (room_free ?r)))
      (at start (not (teacher_available ?t)))
      (at start (not (students_available ?y)))

      (at end (room_free ?r))
      (at end (teacher_available ?t))
      (at end (students_available ?y))

      (at end (scheduled_60_3 ?c))
      (at end (scheduled_at_60_3 ?c ?r))
      (at end (not (unscheduled_60_3 ?c)))

      (at end (scheduled ?c))
    )
  )
  
  (:durative-action move_student
    :parameters (?y - year ?from - room ?to - room)
    :duration (= ?duration (*2 (distance ?from ?to)))
    :condition (and 
      (over all (daytime))
      (at start (student_at ?from ?y))
      )
    :effect (and
      (at start (not (student_at ?from ?y)))
      (at start (not (student_at ?to ?y)))

      (at end (not (student_at ?from ?y)))
      (at end (student_at ?to ?y))
      )
  )

  (:durative-action move_teacher
    :parameters (?t - teacher ?from - room ?to - room)
    :duration (= ?duration (distance ?from ?to))
    :condition (and 
      (over all (daytime))
      (at start (teacher_at ?from ?t))
      )
    :effect (and
      (at start (not (teacher_at ?from ?t)))
      (at start (not (teacher_at ?to ?t)))

      (at end (not (teacher_at ?from ?t)))
      (at end (teacher_at ?to ?t)))
  )

  (:action start_day
      :parameters ()
      :precondition (and )
      :effect (and (not (nighttime)) (daytime))
  )
  
  (:action end_day
      :parameters ()
      :precondition (and )
      :effect (and (not (daytime)) (nighttime))
  )
  
)
