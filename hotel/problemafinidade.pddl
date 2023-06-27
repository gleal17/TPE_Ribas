(define (problem afinidade) 
    (:domain hotel_domain)
    (:objects
        p1 p2 p3 p4 - pessoa
        q1 q2 q3 - quarto
    )

    (:init
        (homem p1)
        (homem p3)
        (homem p4)
        (casal p1 p2)
        (not (ocupado q1))
        (not (ocupado q2))
        (not (ocupado q3))

        (= (afinidade p1 p2) 2)
        (= (afinidade p1 p3) 4)
        (= (afinidade p1 p4) 6)

        (= (afinidade p2 p1) 1)
        (= (afinidade p2 p3) 3)
        (= (afinidade p2 p4) 5)

        (= (afinidade p3 p1) 8)
        (= (afinidade p3 p2) 10)
        (= (afinidade p3 p4) 12)

        (= (afinidade p4 p1) 11)
        (= (afinidade p4 p2) 9)
        (= (afinidade p4 p3) 5)

        (quartoDuplo q1)
        (quartoCasal q2)
        (quartoDuplo q3)

        (= (custo q1) 200)
        (= (custo q2) 200)
        (= (custo q3) 300)

        (= (total-cost) 0)
    )

    (:goal
        (and
            (forall (?p - pessoa) (alojada ?p))
        )
    )
    (:metric minimize (total-cost))

)