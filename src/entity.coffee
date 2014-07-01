# CoffeeScript file containing code for handling entities.

# Some entity that can be updated and rendererd.
class window.Entity
    constructor: ->
        @dead = false
    
    update: (tdelta) ->
    
    render: (ctx) ->
    
    # Marks this entity as dead and removes it on the next tick.
    kill: ->
        @dead = true


# Contains an entity list and provides functions for ticking and rendering them.
class window.World
    constructor: ->
        # All of the entities that exist.
        @entities = []

    # Removes all of the entities that are dead.
    remove_dead_entities: ->
        @entities = for ent in @entities when not ent.dead
            ent

    # Ticks all of the entities for the given time delta.
    update_entities: (tdelta) ->
        for entity in @entities
            entity.update tdelta

    # Renders all of the entities to the given context.
    render_entities: (ctx) ->
        for entity in @entities
            entity.render ctx
    
    # Adds an entity to the world.
    add_entity: (ent) ->
        @entities.push ent

