module SalesmanData
    ( birmingham
    , lancaster
    , leeds
    , leicerster
    , lincoln
    , allTowns
    , liverpool
    , manchester
    , nottingham
    , sheffield
    , stoke
    ) where

import SalesmanTypes



birmingham :: Town
birmingham =  Town { name   = Birmingham
                   , routes = [ Route (lancaster,  129.0)
                              , Route (leeds,      119.0)
                              , Route (leicerster,  43.6)
                              , Route (lincoln,     98.6)
                              , Route (liverpool,   98.6)
                              , Route (manchester,  86.3)
                              , Route (nottingham,  52.2)
                              , Route (sheffield,   85.3)
                              , Route (stoke,       44.5)
                              ]}
lancaster ::  Town
lancaster =   Town { name   = Lancaster
                   , routes = [ Route (birmingham, 129.0)
                              , Route (leeds,       88.3)
                              , Route (leicerster, 149.0)
                              , Route (lincoln,    152.0)
                              , Route (liverpool,   57.4)
                              , Route (manchester,  55.4)
                              , Route (nottingham, 141.0)
                              , Route (sheffield,   93.3)
                              , Route (stoke,       86.3)
                              ]}

leeds :: Town
leeds =  Town      { name   = Leeds
                   , routes = [ Route (birmingham, 119.0)
                              , Route (lancaster,   88.3)
                              , Route (leicerster,  97.4)
                              , Route (lincoln,     71.6)
                              , Route (liverpool,   72.6)
                              , Route (manchester,  42.5)
                              , Route (nottingham,  71.6)
                              , Route (sheffield,   35.5)
                              , Route (stoke,       92.1)
                              ]}

leicerster :: Town
leicerster =  Town { name = Leicerster
                   , routes = [ Route (birmingham,  43.6)
                              , Route (lancaster,  149.0)
                              , Route (leeds,       97.4)
                              , Route (lincoln,     54.0)
                              , Route (liverpool,  119.0)
                              , Route (manchester, 107.0)
                              , Route (nottingham,  28.0)
                              , Route (sheffield,   64.2)
                              , Route (stoke,       60.7)
                              ]}

lincoln :: Town
lincoln =  Town    { name   = Lincoln
                   , routes = [ Route (birmingham,  98.6)
                              , Route (lancaster,  152.0)
                              , Route (leeds,       71.6)
                              , Route (leicerster,  54.0)
                              , Route (liverpool,  138.0)
                              , Route (manchester,  85.2)
                              , Route (nottingham,  39.9)
                              , Route (sheffield,   48.6)
                              , Route (stoke,       90.7)
                              ]}

liverpool :: Town
liverpool =  Town  { name    = Liverpool
                   , routes = [ Route (birmingham,  98.6)
                              , Route (lancaster,   57.4)
                              , Route (leeds,       72.6)
                              , Route (leicerster, 119.0)
                              , Route (lincoln,    138.0)
                              , Route (manchester,  34.9)
                              , Route (nottingham, 111.0)
                              , Route (sheffield,   77.1)
                              , Route (stoke,       56.3)
                              ]}

manchester :: Town
manchester =  Town { name   = Manchester
                   , routes = [ Route (birmingham,  86.3)
                              , Route (lancaster,   55.4)
                              , Route (leeds,       42.5)
                              , Route (leicerster, 107.0)
                              , Route (lincoln,     85.2)
                              , Route (liverpool,   34.9)
                              , Route (nottingham,  80.9)
                              , Route (sheffield,   37.9)
                              , Route (stoke,       44.7)
                              ]}

nottingham :: Town
nottingham =  Town { name   = Nottingham
                   , routes = [ Route (birmingham,  52.2)
                              , Route (lancaster,  141.0)
                              , Route (leeds,       71.6)
                              , Route (leicerster,  28.0)
                              , Route (lincoln,     39.9)
                              , Route (liverpool,  111.0)
                              , Route (manchester,  80.9)
                              , Route (sheffield,   38.8)
                              , Route (stoke,       52.4)
                              ]}

sheffield :: Town
sheffield =  Town  { name   = Sheffield
                   , routes = [ Route (birmingham,  85.3)
                              , Route (lancaster,   93.3)
                              , Route (leeds,       35.5)
                              , Route (leicerster,  64.2)
                              , Route (lincoln,     48.6)
                              , Route (liverpool,   77.1)
                              , Route (manchester,  37.9)
                              , Route (nottingham,  38.8)
                              , Route (stoke,       47.4)
                              ]}

stoke :: Town
stoke =  Town      {   name = Stoke
                   , routes = [ Route (birmingham,  44.5)
                              , Route (lancaster,   86.3)
                              , Route (leeds,       92.1)
                              , Route (leicerster,  60.7)
                              , Route (lincoln,     90.7)
                              , Route (liverpool,   56.3)
                              , Route (manchester,  44.7)
                              , Route (nottingham,  52.4)
                              , Route (sheffield,   47.4)
                              ]}

allTowns :: [Town]
allTowns =  [ birmingham
            , lancaster
            , leeds
            , leicerster
            , lincoln
            , liverpool
            , manchester
            , nottingham
            , sheffield
            , stoke
            ]
