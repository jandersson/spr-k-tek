% Grammatikregler
s --> np.

np --> det(Genus, Numerus, Species), jj(Genus, Numerus, Species, Genusklass), n(Genus, Numerus, Species, nominativ, Genusklass).
np --> det(Genus, Numerus, Species), jj(Genus, Numerus, Species, Genusklass), n(Genus, Numerus, Species, genitiv, Genusklass), n(_, _, obestämd, nominativ, _).

% Lexikon
det(utrum, singularis, obestämd) --> [ en ].
det(neutrum, singularis, obestämd) --> [ ett ].
det(utrum, singularis, bestämd) --> [ den ].
det(neutrum, singularis, bestämd) --> [ det ].
det(_, pluralis, obestämd) --> [ några ].
det(_, pluralis, bestämd) --> [ de ].

jj(utrum, singularis, obestämd, _) --> [ gammal ].
jj(neutrum, singularis, obestämd, _) --> [ gammalt ].
jj(utrum, singularis, bestämd, maskulinum) --> [ gamle ].
jj(_, _, _, _) --> [ gamla ].


jj(utrum, singularis, obestämd, _) --> [ röd ].
jj(neutrum, singularis, obestämd, _) --> [ rött ].
jj(utrum, singularis, bestämd, maskulinum) --> [ röde ].
jj(_, _, _, _) --> [ röda ].

n(utrum, singularis, obestämd, nominativ, maskulinum) --> [ man ].
n(utrum, singularis, bestämd, nominativ, maskulinum) --> [ mannen ].
n(utrum, pluralis, obestämd, nominativ, maskulinum) --> [ män ].
n(utrum, pluralis, bestämd, nominativ, maskulinum) --> [ männen ].
n(utrum, singularis, obestämd, genitiv, maskulinum) --> [ mans ].
n(utrum, singularis, bestämd, genitiv, maskulinum) --> [ mannens ].
n(utrum, pluralis, obestämd, genitiv, maskulinum) --> [ mäns ].
n(utrum, pluralis, bestämd, genitiv, maskulinum) --> [ männens ].

n(utrum, singularis, obestämd, nominativ, femininum) --> [ kvinna ].
n(utrum, singularis, bestämd, nominativ, femininum) --> [ kvinnan ].
n(utrum, pluralis, obestämd, nominativ, femininum) --> [ kvinnor ].
n(utrum, pluralis, bestämd, nominativ, femininum) --> [ kvinnorna ].
n(utrum, singularis, obestämd, genitiv, femininum) --> [ kvinnas ].
n(utrum, singularis, bestämd, genitiv, femininum) --> [ kvinnans ].
n(utrum, pluralis, obestämd, genitiv, femininum) --> [ kvinnors ].
n(utrum, pluralis, bestämd, genitiv, femininum) --> [ kvinnornas ].

n(neutrum, _, obestämd, nominativ, _) --> [ bord ].
n(neutrum, singularis, bestämd, nominativ, _) --> [ bordet ].
n(neutrum, pluralis, bestämd, nominativ, _) --> [ borden ].
n(neutrum, _, obestämd, genitiv, _) --> [ bords ].
n(neutrum, singularis, bestämd, genitiv, _) --> [ bordets ].
n(neutrum, pluralis, bestämd, genitiv, _) --> [ bordens ].

n(neutrum, _, obestämd, nominativ, _) --> [ skal ].
n(neutrum, singularis, bestämd, nominativ, _) --> [ skalet ].
n(neutrum, pluralis, bestämd, nominativ, _) --> [ skalen ].
n(neutrum, _, obestämd, genitiv, _) --> [ skals ].
n(neutrum, singularis, bestämd, genitiv, _) --> [ skalets ].
n(neutrum, pluralis, bestämd, genitiv, _) --> [ skalens ].

n(neutrum, singularis, obestämd, nominativ, _) --> [ äpple].
n(neutrum, singularis, bestämd, nominativ, _) --> [ äpplet ].
n(neutrum, pluralis, obestämd, nominativ, _) --> [ äpplen ].
n(neutrum, pluralis, bestämd, nominativ, _) --> [ äpplena ].
n(neutrum, singularis, obestämd, genitiv, _) --> [ äpples ].
n(neutrum, singularis, bestämd, genitiv, _) --> [ äpplets ].
n(neutrum, pluralis, obestämd, genitiv, _) --> [ äpplens ].
n(_, pluralis, bestämd, genitiv, _) --> [ äpplenas ].

n(utrum, singularis, obestämd, nominativ, _) --> [ kant ].
n(utrum, singularis, bestämd, nominativ, _) --> [ kanten ].
n(utrum, pluralis, obestämd, nominativ, _) --> [ kanter ].
n(utrum, pluralis, bestämd, nominativ, _) --> [ kanterna ].
n(utrum, singularis, obestämd, genitiv, _) --> [ kants ].
n(utrum, singularis, bestämd, genitiv, _) --> [ kantens ].
n(utrum, pluralis, obestämd, genitiv, _) --> [ kanters ].
n(utrum, pluralis, bestämd, genitiv, _) --> [ kanternas ].
