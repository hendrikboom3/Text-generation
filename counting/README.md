
## What's working in 2016.

I've ignored the various grandiose plans I've been hatching, and just went ahead and wrote count.ml.  Upi will need an ocaml implementation to run it.  Ocaml is free softwre, and is available for Mac, Windows, and Linux.  For gnu make, the command is
     make unittest
There will possibly be variations on this trivial story before the month is up.

I found it surprisingly difficult to get the details of English number syntax right.

2016 06 04: I'm writing another one: this time I have the counting go transfinite through some constructible ordinals.  The first version of this is in ord.ml.  Unfortunately, the code has become a mess.  I have to rewrite.

I did that, by building a new data structure to express the ordinals.  These can easily be constructed in uniform loops.  I no longer need to mess with the control flow to avoid printing expressions involving zeros and ones, because I use a generic simplification routine to reduce things like omega squared times zero plus seven to just seven, making it look idiomatic.  That part is now working, but it is not well-intergrated with the narrative.  I will next have to provide hooks to get the appropriate story narrative in the proper places.  The trick is to introduce the patterns in the numbers when they first become relevant, and the to say the equivalent of "more of same".

It now counts up to  $omega^{\omega 2+3} 3+\omega^{3} 3+\omega^{3}$.
The Unix wc utility tells me it has 69988 words, some of which are surely HTML tags.

I now have a new appreciation for the size of these constructive ordinals.  And this isn't even close to the league of big constructive ordinals.

The math on the page overloads my browser.  iceweasel/firefoxx gave up long ago.  Midori gave out when the wordcount approached 50000.  Chrome will still display the entire page, but it takes it ages to do the whole page, and mathjax produces an error message after displaying everything correctly.  Under the circumstances, if the novel isn't perfect, too bad.

Perhaps I should try again with straight LATEX output.  Who knows?  It might be practical.

2016 06 19

Indeed, straight LATEX output works a lot better.  Once pdflatex is through with it, which is fast, the browser is completely happy with the pdf file.
