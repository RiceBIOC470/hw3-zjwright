%HW3

%% Problem 1 - Smith-Waterman alignment
% Consider two sequences 'GTAATCC' and 'GTATCCG'

% Construct the scoring matrix for this with the parameters:
% match value = 2, mismatch value = -1, and gap penalty = -1. Use your
% solution to get the optimal alignment. If you prefer, it is acceptable to do this with
% pencil and paper, you can then take a snapshot of your solution and
% include it in your repository. 

%pic included in repository

%% Problem 2 - using the NCBI databases and sequence alignments

% Erk proteins are critical signal transducers of MAP kinase signaling.
% Accessions numbers for ERK1 (also called MAPK3) and ERK2 (also called MAPK1) human mRNA are NM_002746 and
% NM_002745, respectively. 

% Part 1. Perform an alignment of the coding DNA sequences of ERK1 and
% ERK2. What fraction of base pairs in ERK1 can align to ERK2? 
erk1=getgenbank('NM_002746');
erk2=getgenbank('NM_002745');
[score, erka_align, start]=swalign(erk1.Sequence, erk2.Sequence, 'Alphabet', 'nt');
showalignment(erka_align);
% 70% match

% Part2. Perform an alignment of the aminoacid sequences of ERK1 and ERK2.
% What fraction of amino acids align?
erk1_pept=nt2aa(erk1.Sequence);
erk2_pept=nt2aa(erk2.Sequence);
[score, erkp_align, start]=swalign(erk1_pept, erk2_pept);
showalignment(erkp_align);
% 33% match (58% match if you cant similar amino acids)

% Part 3.  Use the NCBI tools to get mRNA sequences for the mouse genes ERK1 and
% ERK2 and align both the coding DNA sequences and protein sequences to the
% human versions. How similar are they? 
%mouse ERK1 accession=NC_000073
%mouse ERK2 accession=NC_000082
erk1_mouse=getgenbank('AK155287');
[score, erk1mh_align, start]=swalign(erk1.Sequence, erk1_mouse.Sequence, 'Alphabet', 'nt');
showalignment(erk1mh_align);
%ERK1 mouse and human DNA are 83% identical
erk2_mouse=getgenbank('AK035386');
[score, erk2mh_align, start]=swalign(erk2.Sequence, erk2_mouse.Sequence, 'Alphabet', 'nt');
showalignment(erk2mh_align);
%ERK2 mouse and human DNA are 80% identical

erk1_mouse_pept=nt2aa(erk1_mouse.Sequence);
erk2_mouse_pept=nt2aa(erk2_mouse.Sequence);
[score, erk1mhp_align, start]=swalign(erk1_pept, erk1_mouse_pept);
showalignment(erk1mhp_align);
% erk1 mouse and human protein seq are 56% match (72% match if you cant similar amino acids)
[score, erk2mhp_align, start]=swalign(erk2_pept, erk2_mouse_pept);
showalignment(erk2mhp_align);
% erk2 mouse and human protein seq are 60% match (73% match if you cant similar amino acids)

%% Problem 3: using blast tools programatically

% Part 1. Write a function that takes an NCBI accession number and a number N as input and
% returns a cell array of the accession numbers for the top N blast hits. 

%function is called accession_finder

% Part 2. Write a function that takes an accession number as input, calls your function 
% from part 1, and returns two outputs - the closest scoring match in human DNA/RNA and the
% closest non-human match. Hint: see the "Source" or "SourceOrganism" field in the data
% returned by getgenbank. Make sure your function does something sensible
% if nothing human is found. 

%function is called closest_human_and_nonhuman_finder

% Part 3. Choose at least one gene from the human genome and one gene from
% another organism and run your code from part 2 on the relevant accession
% numbers. Comment on the results. 


