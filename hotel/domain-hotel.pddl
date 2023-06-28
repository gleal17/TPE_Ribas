(define (domain hotel_domain)
    (:requirements :strips :typing :negative-preconditions :equality)

    (:types
        pessoa quarto - objects
    )

    (:predicates
        (casal ?p1 ?p2 - pessoa)
        (quartoTriplo ?q - quarto)
        (quartoDuplo ?q - quarto)
        (quartoCasal ?q - quarto)
        (quartoQuadruplo ?q - quarto)
        (alojada ?p - pessoa)
        (ocupado ?q - quarto)
        (podeJunto ?p1 ?p2 - pessoa)
        (casalAlojado ?p1 ?p2 - pessoa)
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
        :parameters (?q - quarto ?h ?m - pessoa)
        :precondition (and
            (casal ?h ?m)
            (not (alojada ?h))
            (not (alojada ?m))
            (not (ocupado ?q))
            (podeJunto ?h ?m)
            (or
                (quartoCasal ?q)
                (quartoDuplo ?q)
                (quartoTriplo ?q)
                (quartoQuadruplo ?q)
            )
            (not (casalAlojado ?h ?m))
            (not (casalAlojado ?m ?h))
        )
        :effect (and
            (alojada ?h)
            (alojada ?m)
            (casalAlojado ?h ?m)
            (ocupado ?q)
            (increase (total-cost) (custo ?q))
        )
    )

    (:action alocarDupla
        :parameters (?q - quarto ?p1 ?p2 - pessoa)
        :precondition (and
            (not (= ?p1 ?p2))
            (not (alojada ?p1))
            (not (alojada ?p2))
            (not (ocupado ?q))
            (podeJunto ?p1 ?p2)
            (podeJunto ?p2 ?p1)
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
            (podeJunto ?p1 ?p2)
            (podeJunto ?p1 ?p3)

            (podeJunto ?p2 ?p1)
            (podeJunto ?p2 ?p3)

            (podeJunto ?p3 ?p1)
            (podeJunto ?p3 ?p2)

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
            (podeJunto ?p1 ?p2)
            (podeJunto ?p1 ?p3)
            (podeJunto ?p1 ?p4)
            (podeJunto ?p2 ?p1)
            (podeJunto ?p2 ?p3)
            (podeJunto ?p2 ?p4)
            (podeJunto ?p3 ?p1)
            (podeJunto ?p3 ?p2)
            (podeJunto ?p3 ?p4)
            (podeJunto ?p4 ?p1)
            (podeJunto ?p4 ?p2)
            (podeJunto ?p4 ?p3)
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