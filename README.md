# Text-generation

Algorithms, data, and code for generating text.

I'm doing nanogenmo in June this year, becauase I'm otherwise employed during November.  But whether I'll actually accomplish something, or just explore the intellectual space remains to be seen.  This page is a collection of thoughts, ranging from the trivial to the substantial.  It's a work-in-progress, and will probably remain one until it is abandoned.

This file is where I keep track of what I've done, plan to do, or even vaguely wonder about doing.  The project is hosted at https://github.com/hendrikboom3/Text-generation .

I've gathered links to resources I found on the various nanogenmo repositories and placed them in [resources.md](resources.html).

## What I got working in 2016

I've ignored the various grandiose plans I've been hatching, and just went ahead and wrote the programs in 'countign'.

## Discussion on various ways to approach the problem

Set my ordinals and counting aside.  They were fun, they produced words, but they lead nowhere.  Though I still would like to get the flavour text into the ordinal program sometime.  But probably not for ths month. 

### what seems to be needed.

* A model for the reality of the story.  Information about the world.
  * As a dungeonmaster, I've always based everything on a map.  Is this feasible here?
  * First-order logic as a notation?
  * Triples store and is-a relations as a simplified first-order logic?
    * From ontoogy, three relationships -- subset, partof, seealso.
      * Seealso is unlikely to be used mechanically.
    * Perhaps also an isa, for set membership?
      * Time to reread the opencyc tutorial.  It uses a triple store.
        * Google search for [ocaml opencyc](https://www.google.ca/search?q=ocaml+opencyc&ie=utf-8&oe=utf-8&gws_rd=cr&ei=VfxrV4i9EYHk-wHj7YQY) seems profitable. 
  * A transition calculus.  (Linear logic has been used tor this)
  * There's a system OpenCyc that claims to be a database of common sense and general knowledge.  Is this relevant?
    * Its web site starts [here](http://www.opencyc.org/).
    * Its [developer documentatation](http://dev.cyc.com/)
    * I haven't found anything indicating that, say, emotions might trigger actions.  Such cause and effect would seem to be a necessary part of any kind of plot driver.  Surely that kind of thing would count as common sence knowledge.
* Characters, with motives, abilities, knowledge and limitations.
  * Knowledge -- represented like the model, but tagged with who knows it.  Or, equivalently, an entire world model for each character
  * actions can be formulated in a linear-logic style.  But not naively, if we also have other kinds of deduction around.
* Some kind of engine taking the above information and translating it into events and state changes.  This could well be the difficult part.  Just doing things whenever they happen to be possible gives us a random walk through a potentially large state space.  A goal-directed deduction system, perhaps prolog-like, might be appropriate.  Always remember -- we're not trying to formalize mathematics; we're not trying to accomplish all possible conclusions.
  * Can do deduction from a character's state of knowledge and his motivations
  * Can do deduction from the actual world and the author's intentions.
  * Or, more simply, from the characters' inteintions and the actual state of the world (thereby eliminating misinformation).
* Having irrevesible actions will force some direction into the random walk. Irreversible actions can include 
  * Character learning something
  * Change of motivation
  * Environmental change.
  * Death or damage to a character (change of state may not be permanent, but be long-lasting)

Setting up such transitions might be able to drive something resembing a plot.
Also need a planning engine to get the characters' actions fo relate to their motivations.

This seems a lot to set up in what remains of a month.  Unless tools for this are already available and easy to learn the use of.

#### Goal-direction.

Continue brainstorming.
  
* Implementations of purpose: The/Each character has motivations.  These can differ among characters.
  * This could be reflected in a set of kind of actions he prefers doing.
  * It could be reflected in an evaluaton function of states likely to be achieved by actions.
  * Could do a partial action tree search to determine what's best.
    * The key word here is "partial".
  * There's room for some logic, perhaps special-purpose code, here.
  * The evaluation function could be somewhat random instead of being the usual weighted sum.

* There are two basic ways to decide what to write next.
  * start with the present situation and see what actions are possible.  Pick one.  Possibly form a tree of future possible actions and see what they accomplish, using one or more evaluation functions.
  * Start with a goal and work backwards to find ways of achieving it.  Again, can work (backwards this time) to form a tree of possiblities and see if any of them leads from the present state.
  * Both of these are tree searches with possibly large fanout, and some of the fanout may be irrelevant to the goal, and time-wasting.  It may be worthwhile to use approximate or partial models of the state with approximate actions to make a plan and then to work out the details using the situations in the approximations as goals for detailed work.
  * TO do any of these will require me to learn.  Have to start with the simplest thing that  could possibly work, and repeatedlt replace and rewrite, not being afraid to replace everything.

* Am I in the process of implementing a general-purpose planning system?

* my mental models of the story
  * find one's way out of or into a maze.
    * add to character's mental map, change position in real-world map
  * find clues to a mystery
    * add to character's information base, possibly enabling deductions.
      * Initially, these deductions will probablly be hand-coded specific to the scenario.
  * find enjoyable or satisfying things to do en route.
    * find and kill monsters (traditional video game scenario)
    * socialize (itself an AI problem)
    * View artwork
      * In a story, the artwork has to be presented with emotional significance tthat resonates with the reader.  This may be difficult.
      * In a game, you can show the artwork.  But gennerating it mechaniclly is still an unsolved problem, much like mechanically writing a novel.
        * The game could involve roaming visually presented procedurally generated scenery, visually presented.  Some of it will be pretty.
  * It seems there should be other possible generic plots.

* It is possible to have a series of subplots that do not invole the POV chaaracter except that he sees them.  They even be scripted as long as each individual one is not repreated much.  You can show a subplot spread out, a scene now, another much later, and so forth.  It becomes the reader's jb to ft the pieces together.  To make this work, you'd have to have a lot of subplots, or you'd rapidly rn out of novelty.

* random scenarios
  * a cat or two that wanders about the place.
    * A catty one and a purry one.  They can look almost the same.  POV character could usually see just one at a time, but occasionally both at once.
  * a dog that chases cats up trees.
  * maybe discover within the story what is to be investigated (like the corpse in the bathtub in Swallows) rather the have it built in initially.
  * recognise when you arrive somewhere you've been before.
  * have causes to guess information you don't know.  use it for planning, but erse it when shown false, or confirm it when shown true.
  * remember when Peanut wanted to play with a cat, and the cat just didn't understand?

* Worldbuilding -- make a world for characters to explore.
  * a map.
    * Use any extant map generator.
      * Could, for example, start with my river algorith or Wander's map, embellished.
    * emplace places with situatons.
      * dangers and death threats
      * combat
      * negotiation, barter.
      * barriers, levels of impassibility, bridges
      * a set of laws
    * What happens with randomly generated laws?
  * Could make a whole set of attributes and relationships between people that guide interaction.  Like the teenage house party scenario didn't seem to have enough coherence for.  These can drive plots and personal development.
    * personal friendships and animosities.
      * Emotional interactions.
        * love and jealousy.
    * personal character
      * Avarice and generosity.
    * God hardened Pharoah's heart.
  * I need to write examples of this stuff in an informal formalism to see how it could be represented and manipulated.  Write transition rules.
    * Already have two map generators.
    * I think it's going to end up as a mostly uniform data structure with interpreted rules.  Special code if I have to reference external stuff, like the map.
      * Need pattern matchers, substitution, replacement, procedural escapes to compiled code.

### Implementation

It looks as if I'm going to want an object system to implement most of this stuff.  The OCaml one, with row polymorphism (which they say others call duck typing, but the case-hardened duck typers say isn't duck typing at all because it's staticallt checkeed) and subtyping, seems attractive.  I  don't know if I'll be using OCaml classes at all.
 It would be nice ifOCaml's pattern match with subtypes may be the mechanism I need for checking preconditions to rules, but I suspect it won't work.  I guess I'll have to fine out whether partial object types can be used to discover type information at run time that isn't statically available at compile time.  IF that doesn't work, I'll have to interpret the patterns in their rules with my own hand-coded type tests and data structures.

### Activities

This is probably more work than fits in a month already:

* make the components described below, or
* Do something else entirely.

### Components

#### text generator

I'll want a text generator that somewhat respects the rules of English grammar.

#### database

I'll want something like a triple store, that stores facts about the world.
It should, ideally be possible to have triples in the store be objects that can be mentioned in other triples.
There needs to be a way to write a triple store, read it in, with type checking, modify it if things happen in the story, and write it out again.

A data base?  Maybe.  It will probably have to be a heterogenous one, and to make it fast, it will probably work entirely in RAM, reading and writing to some human readable form that might be editable by humans.

What could be in the database?

Maybe subject-verb-object triples.
Triples need to have IDs themselves, so they can be referened.  It's probably important to be able to record which characters know which facts.  THen the deductino engine should be able to reason based on what a specific character knows.  Maybe this is a feature for later; it may be too much for an initial system.  But something like this is necessary to give proper scope to a character's motivations.  There will have to be some way of identifying which facts *everybody* knows; otherwise the number of stored A-knows-B facts will explode.

I call them triples, they are perhaps more properly called predications.  Or even just facts.  The verb would be the predicate, and they could be n-ary.  I could go all combinatory-logic on this, but let's not.

Some typical facts:
* A is a member of B.
* A is a subset of B.
* Every A satisfies B.

There will probably have to be individuals, such as "Bob", and generic entities, such as "a man".

I've got to work this our carefully.  Maybe that book on taxonomy will help.
There has to be very limited deduction, and the facts will have to be organised to make this fast.  I'm not looking for a full first-order theorem prover, even.

#### Revison management

The revision management system will be git and github.  That's the one used for nanogenmo.
.
#### Deduction

Some kind of logic engine on the database, to draw obvious conclusions.  This wil probably grow on demand, as I need it, as it becomes more convenient to use general tools on data stored in the database than to code special cases.  Havinf code in the data base woud be nice, too, but that would only work if the system is written in something like a List, rather than something like OCaml.

#### Some kind of planning system.

This could be a variant on the deduction system.

### Context

I have no idea whether this could possibly fit with my as yet nonexistent project to randomly generate cities.  That requires a geometry database.

### Ordinal program.

Next project, to count ordinals.  Not the trouble with ordinals is that given any mechanism for gennerating them, there's another bigger one that hasn't been covered yet.  Not to mention that to get to $$\omega$$ there's in infinite number of them to enumerate first, so it's necessary to skip a lot of them.  I think I'm going to have to just start and see what happens.




