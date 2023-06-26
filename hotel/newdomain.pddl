(define (domain newdomain)
  (:requirements :typing :negative-preconditions :fluents :action-costs :disjunctive-preconditions)

  ;; Tipos
  (:types
    pessoa quarto sexo
  )

  ;; Predicados
  (:predicates
    (casal ?p1 ?p2 - pessoa)
    (alojada ?p - pessoa)
    (homem ?h - sexo)
    (quartoTriplo ?q - quarto)
    (quartoDuplo ?q - quarto) ;diff casal?
    (quartoCasal ?q - quarto)
    (quartoQuadruplo ?q - quarto)
    (ocupado ?q - quarto)
  )

  ;;funções
  (:functions
    ;(afinidade ?p1 ?p2 - pessoa)
    (custo ?q - quarto) - number
    (total-cost)
  )

  ;; Ações
  (:action alocarPessoa
    :parameters (?q - quarto ?p - pessoa)
    :precondition (and
      (not (alojada ?p))
      (not (ocupado ?q))
    )
    :effect (and (alojada ?p) (ocupado ?q)
      (increase (total-cost) (custo ?q))
    )
  )
  (:action alocarCasal
    :parameters (?q - sexo ?p1 ?p2 - pessoa)
    :precondition (and
      (casal ?p1 ?p2)
      (not (alojada ?p1))
      (not (alojada ?p2))
      (not (ocupado ?q)))

    :effect (and
      (alojada ?p1)
      (alojada ?p2)
      (ocupado ?q)
      (increase (total-cost) (custo ?q))
    )
  )

  (:action alocarDupla
    :parameters (?q - quarto ?p1 ?p2 - pessoa)
    :precondition (and
      (not (alojada ?p1))
      (not (alojada ?p2))
      (not (ocupado ?q))
      (or
        (and
          (homem ?p1)
          (homem ?p2)
        )
        (and
          (not (homem ?p1))
          (not (homem ?p2))
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

) ; fim dominio