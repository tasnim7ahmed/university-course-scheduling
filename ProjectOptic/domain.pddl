(define (domain schedule)
  (:requirements :strips :typing :durative-actions)
  (:types course teacher year room)

  (:predicates 
    (scheduled ?c - course)
    (scheduled_90 ?c - course)
    (scheduled_180 ?c - course)

    (unscheduled_90 ?c - course)
    (unscheduled_180 ?c - course)
  
    (scheduled_at_90 ?c - course ?r - room)
    (scheduled_at_180 ?c - course ?r - room)

    (teaches ?t - teacher ?c - course)
    (room_free ?r - room)

    (students_available ?y - year)
    (student_at ?r - room ?y - year)

    (teacher_available ?t - teacher)
    (teacher_at ?r - room ?t - teacher)

    (course_assigned ?c - course ?y - year)
  )

  (:durative-action schedule_course_90
    :parameters (?c - course ?t - teacher ?y - year ?r - room)
    :duration (= ?duration 90)
    :condition (and 
      (at start (teaches ?t ?c))
      (at start (room_free ?r))
      (at start (course_assigned ?c ?y))
      (at start (unscheduled_90 ?c))
      (at start (unscheduled_180 ?c))

      (at start (students_available ?y))
      (at start (teacher_available ?t))

      (at start (teacher_at ?r ?t))
      (at start (student_at ?r ?y))
      )
    :effect (and 
      (at start (not (room_free ?r)))
      (at start (not (teacher_available ?t)))
      (at start (not (students_available ?y)))

      (at end (room_free ?r))
      (at end (teacher_available ?t))
      (at end (students_available ?y))

      (at end (scheduled_90 ?c))
      (at end (scheduled_at_90 ?c ?r))
      (at end (not (unscheduled_90 ?c)))
    )
  )

    (:durative-action schedule_course_180
    :parameters (?c - course ?t - teacher ?y - year ?r - room)
    :duration (= ?duration 90)
    :condition (and 
      (at start (teaches ?t ?c))
      (at start (room_free ?r))
      (at start (course_assigned ?c ?y))

      (at start (scheduled_90 ?c))
      (at start (unscheduled_180 ?c))

      (at start (students_available ?y))
      (at start (teacher_available ?t))

      (at start (teacher_at ?r ?t))
      (at start (student_at ?r ?y))
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
    )
  )
  
  (:action schedule_course_done
      :parameters (?c - course)
      :precondition (and 
        (scheduled_90 ?c)
        (scheduled_180 ?c)
      )
      :effect (and 
        (scheduled ?c)
      )
  )
  

  (:durative-action move_student
    :parameters (?y - year ?from - room ?to - room)
    :duration (= ?duration 20)
    :condition (and 
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
    :duration (= ?duration 10)
    :condition (and 
      (at start (teacher_at ?from ?t))
      )
    :effect (and
      (at start (not (teacher_at ?from ?t)))
      (at start (not (teacher_at ?to ?t)))

      (at end (not (teacher_at ?from ?t)))
      (at end (teacher_at ?to ?t)))
  )
)
