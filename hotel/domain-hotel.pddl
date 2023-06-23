(define (domain hotel_domain)
    (:requirements :strips :typing :negative-preconditions :equality)

    (:types
        pessoa quarto - objects
    )

    (:predicates
        (casal ?p1 ?p2 - pessoa)
        (homem ?p - pessoa)
        (mulher ?p - pessoa)
        (quartoTriplo ?q - quarto)
        (quartoDuplo ?q - quarto)
        (quartoCasal ?q - quarto)
        (quartoQuadruplo ?q - quarto)
        (alojada ?p - pessoa)
        (ocupado ?q - quarto)
    )

    (:functions
        (custo ?q - quarto) - number
        (total-cost) - number
    )

    (:action alocarPessoa
        :parameters (?q - quarto ?p - pessoa)
        :precondition (and 
            (not (alojada ?p))
            (not (ocupado ?q))
        )
        :effect (and 
            (alojada ?p)
            (ocupado ?q)
            (increase (total-cost) (custo ?q))
        )
    )
    
    (:action alocarCasal
        :parameters (?q - quarto ?h - homem ?m - mulher)
        :precondition (and
            (casal ?h ?m)
            (not (alojada ?h))
            (not (alojada ?m))
            (not (ocupado ?q))
            (or
                (quartoCasal ?q)
                (quartoDuplo ?q)
                (quartoTriplo ?q)
                (quartoQuadruplo ?q)
            )
        )
        :effect (and
            (alojada ?h)
            (alojada ?m)
            (increase (total-cost) (custo ?q))
            (ocupado ?q)
        )
    )

    (:action alocarDupla
        :parameters (?q - duplo ?p1 ?p2 - pessoa)
        :precondition (and
            (not (= ?p1 ?p2))
            (not (alojada ?p1))
            (not (alojada ?p2))
            (not (ocupado ?q))
            (or
                (and
                    (homem ?p1)
                    (homem ?p2)
                )
                (and
                    (mulher ?p1)
                    (mulher ?p2)
                )
            )
            (or
                (quartoDuplo ?q)
                (quartoTriplo ?q)
                (quartoQuadruplo ?q)
            )
        )
        :effect (and
            (alojada ?p1)
            (alojada ?p2)
            (increase (total-cost) (custo ?q))
            (ocupado ?q)
        )
    )

    (:action alocarTrio
        :parameters (?p1 ?p2 ?p3 - pessoa ?q - quarto)
        :precondition (and
            (not (= ?p1 ?p2))
            (not (= ?p2 ?p3))
            (not (= ?p1 ?p3))
            (not (alojada ?p1))
            (not (alojada ?p2))
            (not (alojada ?p3))
            (not (ocupado ?q))
            (or
                (and
                    (homem ?p1)
                    (homem ?p2)
                    (homem ?p3)
                )
                (and
                    (mulher ?p1)
                    (mulher ?p2)
                    (mulher ?p3)
                )
            )
            (or
                (quartoTriplo ?q)
                (quartoQuadruplo ?q)
            )
        )
        :effect (and
            (alojada ?p1)
            (alojada ?p2)
            (alojada ?p3)
            (ocupado ?q)
            (increase (total-cost) (custo ?q))
        )
    )
    (:action alocarQuarteto
        :parameters (?p1 ?p2 ?p3 ?p4 - pessoa ?q - quarto)
        :precondition (and
            (quartoQuadruplo ?q)
            (not (= ?p1 ?p2))
            (not (= ?p1 ?p3))
            (not (= ?p1 ?p4))
            (not (= ?p2 ?p3))
            (not (= ?p2 ?p4))
            (not (= ?p3 ?p4))
            (not (alojada ?p1))
            (not (alojada ?p2))
            (not (alojada ?p3))
            (not (alojada ?p4))
            (not (ocupado ?q))
            (or
                (and
                    (homem ?p1)
                    (homem ?p2)
                    (homem ?p3)
                    (homem ?p4)
                )
                (and
                    (mulher ?p1)
                    (mulher ?p2)
                    (mulher ?p3)
                    (mulher ?p4)
                )
            )
        )
        :effect (and
            (alojada ?p1)
            (alojada ?p2)
            (alojada ?p3)
            (alojada ?p4)
            (ocupado ?q)
            (increase (total-cost) (custo ?q))
        )
    )
)