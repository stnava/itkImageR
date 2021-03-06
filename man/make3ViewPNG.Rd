\name{make3ViewPNG}
\alias{make3ViewPNG}

\title{
Rotate an existing 3d window into different views.
}

\description{
The make3ViewPNG function rotates the existing viewport according to 3 different rotation matrices passed in by the user.  The output of these 3 views is munged together along the left/right edge and written to a png file. 
}

\usage{
make3ViewPNG( rotationView1 , rotationView2 , rotationView3, fnprefix )
}

\arguments{
\item{rotationView1}{
  Leftmost view
}
\item{rotationView2}{
  Center view
}
\item{rotationView3}{
  Rightmost view
}
\item{fnprefix}{
  Output file name prefix. 
}
}

\value{
NA
}

\author{
Avants BB
}

\examples{
\dontrun{
brain<-renderSurfaceFunction( surfimg =list( bm ) , alphasurf=0.1 ,smoothsval = 1.5 , smoothfval = 1.0, funcimg=list(cnt$clustimg) , alphafunc=0.2 )
plotBasicNetwork( centroids =  cnt$centroids , brain )
make3ViewPNG(  rid, id, rid2,  paste('figure/network',i,sep='') )
}
}
