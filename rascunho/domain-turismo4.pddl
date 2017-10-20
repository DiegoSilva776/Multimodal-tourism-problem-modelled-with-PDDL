;
; Definição do domínio do problema do Turismo Multimodal 
;
(define (domain turismo-multimodal-a)
    (:requirements :strips)

    (:predicates
        (is-ciclista ?who)
        (is-bike ?what)
        (is-estacao ?from)
        (is-ponto-turistico ?to)
        (adjacente ?local-1 ?local-2)
        (at ?what ?local)
        (pegou-bike ?who ?bike)
        (visitou-estacao ?estacao ?ciclista)
        (visitou-ponto-turistico ?ponto-turistico ?ciclista)
        (esperou-5min ?who ?where)
    )

    (:action caminhar-ponto-turistico
        :parameters 
            (?who ?what ?from ?to)
        :precondition 
            (and 
            (is-ciclista ?who)
            (is-estacao ?from)
            (is-ponto-turistico ?to)
            (not (esperou-5min ?who ?from))
            (not (pegou-bike ?who ?what))
            (at ?who ?from)
            (adjacente ?from ?to)
        )
        :effect 
            (and 
            (not (at ?who ?from))
            (at ?who ?to)
        )
    )

    (:action visitar-ponto-turistico
        :parameters 
            (?who ?from)
        :precondition 
            (and 
            (is-ciclista ?who)
            (is-ponto-turistico ?from)
            (at ?who ?from)
            (not (visitou-ponto-turistico ?from ?who))
        )
        :effect 
            (and 
            (visitou-ponto-turistico ?from ?who)
        )
    )

    (:action caminhar-estacao
        :parameters 
            (?who ?from ?to)
        :precondition 
            (and 
            (is-ciclista ?who)
            (is-ponto-turistico ?from)
            (is-estacao ?to)
            (at ?who ?from)
            (adjacente ?from ?to)
        )
        :effect 
            (and 
            (not (at ?who ?from))
            (at ?who ?to)
        )
    )

    (:action esperar5min
        :parameters 
            (?who ?where)
        :precondition 
            (and 
            (is-ciclista ?who)
            (is-estacao ?where)
            (at ?who ?where)
            (not (esperou-5min ?who ?where))
        )
        :effect 
            (and  
            (esperou-5min ?who ?where)
        )
    )
    
    (:action pegar-bike
        :parameters 
            (?who ?bike ?where)
        :precondition 
            (and 
            (esperou-5min ?who ?where)
            (is-ciclista ?who)
            (is-estacao ?where)
            (is-bike ?bike)
            (not (is-ponto-turistico ?where))
            (at ?who ?where)
            (at ?bike ?where)
            (not (pegou-bike ?who ?bike))
        )
        :effect 
            (and
            (pegou-bike ?who ?bike)
            (not (at ?bike ?where))
        )
    )

    (:action pedalar
        :parameters 
            (?who ?bike ?from ?to)
        :precondition 
            (and 
            (esperou-5min ?who ?from)
            (pegou-bike ?who ?bike)
            (is-ciclista ?who)
            (is-bike ?bike)
            (is-estacao ?from)
            (is-estacao ?to)
            (at ?who ?from)
            (adjacente ?from ?to)
        )
        :effect 
            (and 
            (not (at ?who ?from))
            (at ?who ?to)
            (visitou-estacao ?to ?who)
        )
    )

    (:action devolver-bike
        :parameters 
            (?who ?bike ?where)
        :precondition 
            (and 
            (is-ciclista ?who)
            (is-estacao ?where)
            (is-bike ?bike)
            (not (is-ponto-turistico ?where))
            (at ?who ?where)
            (not (at ?bike ?where))
            (pegou-bike ?who ?bike)
        )
        :effect 
            (and  
            (not (pegou-bike ?who ?bike))
            (at ?bike ?where)
        )
    )

)
