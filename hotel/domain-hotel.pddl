(define (domain hotel_domain)

(:requirements :strips :typing :negative-preconditions :fluents )

(:types 
    homem mulher - pessoa
    duplo triplo quadruplo casal - quarto
    orcamento - objeto
)

(:predicates
    (casal ?h - homem ?m - mulher)
    (no-quarto ?p - pessoa)
)

(:functions 
;    (afinidade ?p1 ?p2 - pessoa)
    (custo ?q - quarto)
    (vagas ?q - quarto)
    (max-vagas ?q - quarto)
    (total ?o - orcamento)
)

;define actions here
(:action alocar-casal
    :parameters (?q - quarto ?h - homem ?m - mulher ?o - orcamento)
    :precondition (and
        (casal ?h ?m)
        (not (no-quarto ?h))
        (not (no-quarto ?m))
        (>= (vagas ?q) 2)
        (>= (max-vagas ?q) (vagas ?q))
        (<= (max-vagas ?q) (vagas ?q))
    )
    :effect (and 
        (no-quarto ?h)
        (no-quarto ?m)
        (increase (total ?o) (custo ?q))
        (decrease (vagas ?q) (max-vagas ?q))
    )
)

;(:action action_name
;    :parameters ()
;    :precondition (and )
;    :effect (and )
;)

)