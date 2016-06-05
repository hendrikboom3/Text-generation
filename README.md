# Text-generation

Algorithms, data, and code for generating text.

I'm doing nanogenmo in June this year, becauase I'm otherwise employed during November.  But whether I'll actually accomplish something, or just explore the intellectual space remains to be seen.  This page is a collection of thoughts, ranging from the trivial to the substantial.  It's a work-in-progress, and will probably remain one until it is abandoned.

This file is where I keep track of what I've done, plan to do, or even vaguely wonder about doing.


## What works so far.

I've ignored the various grandiose plans I've been hatching, and just went ahead and wrote count.ml.  Upi will need an ocaml implementation to run it.  Ocaml is free softwre, and is available for Mac, Windows, and Linux.  For gnu make, the command is
     make unittest
There will possibly be variations on this trivial story before the month is up.

I found it surprisingly difficult to get the details of English number syntax right.

2016 06 04: I'm writing another one: this time I have the counting go transfinite through some constructible ordinals.  The first version of this is in ord.ml.  Unfortunately, the code has become a mess.  I have to rewrite.

I did that, by building a new data structure to express the ordinals.  These can easily be constructed in uniform loops.  I no longer need to mess with the control flow to avoid printing expressions involving zeros and ones, because I use a generic simplification routine to reduce things like omega squared times zero plus seven to just seven, making it look idiomatic.  That part is now working, but it is not well-intergrated with the narrative.  I will next have to provide hooks to get the appropriate story narrative in the proper places.  The trick is to introduce the patterns in the numbers when they first become relevant, and the to say the equivalent of "more of same".

I'll probably just clean up this code, and then stop development of the ordinal counter for now, because it has become clear that all the math in the page is overloading the browser, which has to use mathjax.js to present it, and it's not fast.

## Discussion on various ways to approach the problem

### Activities

This is probably more work than fits in a month already:

* Find out what has been done already.
* make the components described below, or
* Do something else entirely.

## What has been done already.

Here I prowl the Resources sections of the nanogenmo git repositories and collect links.  Someday I may even organise them coherently.

* [The original tweet.](https://twitter.com/tinysubversions/status/396305662000775168)
* [wiki](https://github.com/dariusk/NaNoGenMo/wiki) seems empty
* github repositories
  * [2013](https://github.com/dariusk/NaNoGenMo)
    * [issues](https://github.com/dariusk/NaNoGenMo/issues)
    * [resources](https://github.com/dariusk/NaNoGenMo/issues/11)
* [The Swallows of Summer](https://github.com/dariusk/NaNoGenMo/issues/39)
  * [2014](https://github.com/dariusk/NaNoGenMo-2014)
    * [2014 resources](https://github.com/dariusk/nanogenmo-2014/issues/1)
    * [Michael Cook's list of procedural generation tutorials](http://procjam.tumblr.com/post/99689402659/procedural-generation-tutorials-getting-started)
  * [2015](https://github.com/dariusk/NaNoGenMo-2015)
    * [2015 resources](https://github.com/dariusk/NaNoGenMo-2015/issues/1)
      * [the *living* handbook of narratology](http://www.lhn.uni-hamburg.de/contents)
      * [ProcJam](http://www.procjam.com/resources/) PCG Resources:  TODO.
      * [Tracery](https://github.com/galaxykate/tracery)  A generative sontext-free-seeming grammar processor.
      * [Yarn](https://github.com/InfiniteAmmoInc/Yarn) Generate text from a graph of texts.  It seems to be good for generating games.
      * [Slack](https://generativeart.slack.com/) Generative art.  I'm not sure what it's about, because you have to sign in,
        * [botally/slack registration](http://slack.botally.net/)
        * [GenerativeArt invite page](http://tinyurl.com/genartslackrequest)
      * [Neural network generates Magic cards](http://www.mtgsalvation.com/forums/creativity/custom-card-creation/612057-generating-magic-cards-using-deep-recurrent-neural)
      * [Abulafia](http://random-generator.com/index.php?title=Main_Page) A random generator for names, plots, and so forth.
      * [A Procedurally Generated Wilderness (In Text)](http://www.sibylmoon.com/a-procedurally-generated-wilderness/) There are lots of ways to generate  wildernesses, but this one generates descriptive text instead of maps.  Well, maybe it can generate maps, too, but the emphasis on on text for interactive fiction.
      * [vijithassar/multiverse-json](https://github.com/vijithassar/multiverse-json)  This descibes a json-based file format for coding multiple, similar versions of a document.  It defines named passages of text, and how these passages are to be combined in different ways to produce various versions of the text.  It is accompanied with a python program that allegedly processes the stuff, but I haven't tried it out or read it yet.  I haven't figured out if it allows parametric substitution.
      * The CMU pronouncing dictionary, accessible with a [python](https://github.com/aparrish/pronouncingpy) and a [javascript](https://github.com/aparrish/pronouncingjs) interfece.
      * mgiraldo reports on stuff from the New York Pubic Library:
        * some [NYPL-related](http://digitalcollections.nypl.org/about) resources
        * if you want to add some savory meals to your novel, you could try the [NYPL menus dataset](http://menus.nypl.org/data)
        * a [sanitized version of the menus dataset](http://menus.nypl.org/data) by @trevormunoz and Katie Rawson
      *  enkiv2 commented on Oct 26, 2015 
        * [GGC](https://github.com/enkiv2/ggc): Compile nonrecursive generative grammars to python
        * Some text transformers, some novelty generators. Do things like modifying the profanity level of a text, generate verbal abuse, and the like. 
      * The [Reddit Corpus](https://www.reddit.com/r/datasets/comments/3mg812/full_reddit_submission_corpus_now_available_2006/) This one may take a while to download.
      *  coleww commented on Oct 27, 2015 (qv) A lot of text transformation tools.  Also:
        * [weirdly-specific-corpora](https://github.com/coleww/weirdly-specific-corpora) TODO: This should probably be mentioned near toe other corpora.
      * [Spam geeration](http://alexking.org/blog/2013/12/22/spam-comment-generator-script) (dariusk commented on Oct 27, 2015)
      *  ikarth commented on Oct 30, 2015 relating several historical approaches to formal text production long before computers were on the scene.
      *  ikarth commented on Oct 31, 2015 about some historical computer text generators.  Some of them are modern reimplementations.
      *  enkiv2 commented on Oct 31, 2015
        * [One-K story generators](https://grandtextauto.soe.ucsc.edu/2008/11/30/three-1k-story-generators/)
        * On Sat, Oct 31, 2015 at 11:20 AM Isaac Karth wrote: Source codes for historical AI storytelling systems -- micro-Talespin and Talespin, Eloza-doctor, Skald
      * MichaelPaulukonis's [NMGM repo](https://github.com/MichaelPaulukonis/NaNoGenMo2015)
    * Resources posted November 1 and later.
      *
      
    * [off-season writing](https://github.com/dariusk/NaNoGenMo-2015/issues/197)
    * The [2015 wiki](https://github.com/dariusk/NaNoGenMo-2015/wiki) appears to ne empty.
* Procedural generation
  * [Polygonal Map Generation for Games](http://www-cs-students.stanford.edu/~amitp/game-programming/polygon-map-generation/)
  * [robot frog:3d](https://www.stuffwithstuff.com/robot-frog/3d/hills/index.html)
  * [Overworld Overview - Part 1](http://bytten-studio.com/devlog/2014/09/08/overworld-overview-part-1/)
  * [Procedural Generation 1](http://web.archive.org/web/20110825054218/http://properundead.com/2009/03/cave-generator.html)
* other
  * [Quiescent Theatre](http://play.typesafety.net/)
  * [Linear Logic](http://www.cs.cmu.edu/~cmartens/int7.pdf)  A description of the use of linear logic to describe the transitions between states of the world.  It looks to me that what's really going on is that the state is described by tairly simple terms, and that instead of consderint transitions to be formal deduction steps, it's better to consider them as following conditional rewriting rules, thus separating the rule into conditions that have to be satisfied that do not chenge, statements to be removed, and statements to be inserted.  Of course, that's just an attitude toward the formalism.  I'd ilke to see some kind of goal-seeking mechanism, but it seems to be absent.  Even a novelty-seeking mechanism might be fun.  That would be extrinsic to the subject of th epaper, though.
  * [artistic challenge months](http://www.wikiwrimo.org/wiki/List_of_timed_artistic_challenges#Defunct_and_retired_challenges)
  * [Generating Narrative Variation in Interactive Fiction](http://nickm.com/if/Generating_Narrative_Variation_in_Interactive_Fiction.pdf)  I glanced at this one. The pdf isn't really conducive to reading on a computer, but I found the rather interesting glossary on pdf page 164.
  * Overworld [part 1](http://bytten-studio.com/devlog/2014/09/08/overworld-overview-part-1/) and [part 2](http://bytten-studio.com/devlog/2014/09/15/overworld-overview-part-2/).  Fairly simple world generation, but with support for game structure.  These posts are part of the [development archive](http://bytten-studio.com/devlog//archive.html) for a game called [Lenna's Inception](http://lennasinception.com/about/).
  * [Text-Adventure games as a text-generation engine](https://github.com/MichaelPaulukonis/NaNoGenMo.yawp/tree/master/npc)  The Swallows stuff, but a lot of interesting links; q.v. sometime.
  * [Teen House Party](https://gist.github.com/dariusk/c76c8f373ebcb6d6af8e)  A little more interesting, but it;s ot clear whether emotions are merely a decorative add-on, with no real effect on story
  * [Procjam 2014](http://procjam.tumblr.com/post/99689402659/procedural-generation-tutorials-getting-started)
  * [Procedural Generation 1](http://web.archive.org/web/20110825054218/http://properundead.com/2009/03/cave-generator.html)




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

I'll need a revision management system, such as monotone, which I'm familiar with, and also a way to publish onto github, where others are working on similar projects.  git could of course be my revision management system.

One way of having both systems is of course to have the metadata for both sitting around in my working directory, and committing,  syncing, and/or pushing eash when appropriate.

If I do github, I'll probably also make reports [here](https://github.com/dariusk/NaNoGenMo-2015/issues/197)
.
#### Deduction

Some kind of logic engine on the database, to draw obvious conclusions.  This wil probably grow on demand, as I need it, as it becomes more convenient to use general tools on data stored in the database than to code special cases.  Havinf code in the data base woud be nice, too, but that would only work if the system is written in something like a List, rather than something like OCaml.

### Context

I have no idea whether this could possibly fit with my as yet nonexistent project to randomly generate cities.  That requires a geometry database.

### Ordinal program.

Neext project, to count ordinals.  Not the trouble with ordinals is that given any mechanism for gennerating them, there's another bigger one that hasn't been covered yet.  Not to mention that to get to $$\omega$$ there's in infinite number of them to enumerate first, so it's necessary to skip a lot of them.  I think I'm going to have to just start and see what happens.

