#Example for generating binary simulations with weak selection

DIRMSMS="/path/to/msms/lib/msms.jar" # path to msms.jar

NBATCH=10

SELRANGE=`seq 0 100 100` #Strength of selection in 4Ne units
SELTIME=`bc <<< 'scale=4; 1600/40000'`
NREF=10000 #Ancestral population size
NCHROMS=198 #doulbe the individuals (99)
NREPL=10000 #Number of simulations
THETA=60 #1.5e-8 mutation rate
RHO=40 #1e-8 recombination rate
LEN=100000 #100kbp
SELPOS=`bc <<< 'scale=2; 1/2'` #Position of selected allele
FREQ=`bc <<< 'scale=6; 1/100'` #Start freq: 1%
NTHREADS=4

DEMO='-eN 0.0875 1 -eN 0.075 0.2 -eN 0 2' #Demographic model used

for SEL in $SELRANGE
        do
          	for TIME in $SELTIME
                do
                  	java -jar $DIRMSMS -N $NREF -ms $NCHROMS $NREPL -t $THETA -r $RHO $LEN -Sp $SELPOS -SI $TIME 1 $FREQ -SAA $(($SEL*2)) -SAa $SEL -Saa 0 -Smark $DEMO -threads $NTHREADS | gzip > msms..$SEL..$TIME..txt.gz
                done
        done
