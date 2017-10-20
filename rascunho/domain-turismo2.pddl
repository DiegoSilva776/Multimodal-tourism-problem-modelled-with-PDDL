(define (domain turismo-multimodal-a)
    (:requirements :strips)
    (:predicates
        (at ?what ?estacao)
        (pegou-bike ?who ?bike)
        (adjacente ?estacao-1 ?estacao-2)
        (is-ciclista ?who)
        (is-bike ?what)
        (foi-visitada ?estacao ?ciclista)
        (esperou-5min ?who)
    )
    (:action pegar-bike
        :parameters 
            (?who ?bike ?where)
        :precondition 
            (and 
            (is-ciclista ?who)
            (is-bike ?bike)
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

    (:action devolver-bike
        :parameters 
            (?who ?bike ?where)
        :precondition 
            (and 
            (is-ciclista ?who)
            (is-bike ?bike)
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

    (:action pedalar
        :parameters 
            (?who ?bike ?from ?to)
        :precondition 
            (and 
            (is-ciclista ?who)
            (is-bike ?bike)
            (at ?who ?from)
            (adjacente ?from ?to)
            (pegou-bike ?who ?bike)
        )
        :effect 
            (and 
            (not (at ?who ?from))
            (at ?who ?to)
            (foi-visitada ?to ?who)
        )
    )
)